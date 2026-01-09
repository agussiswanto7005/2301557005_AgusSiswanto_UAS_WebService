<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TanggapanController extends Controller
{
    /**
     * Menampilkan semua tanggapan beserta data pengaduan dan petugasnya
     */
    public function index()
    {
        $tanggapan = DB::table('tanggapan')
            ->join('pengaduan', 'tanggapan.pengaduan_id', '=', 'pengaduan.id')
            ->join('petugas', 'tanggapan.petugas_id', '=', 'petugas.id')
            ->select('tanggapan.*', 'pengaduan.judul as judul_pengaduan', 'petugas.nama as nama_petugas')
            ->get();

        return response()->json($tanggapan);
    }

    /**
     * Menyimpan tanggapan baru dan mengubah status pengaduan
     */
    public function store(Request $request)
    {
        // Validasi input
        $this->validate($request, [
            'pengaduan_id' => 'required|exists:pengaduan,id',
            'petugas_id'   => 'required|exists:petugas,id',
            'isi_tanggapan' => 'required',
            'status_baru'  => 'required|in:diproses,selesai'
        ]);

        try {
            DB::beginTransaction();

            // 1. Insert ke tabel tanggapan
            DB::table('tanggapan')->insert([
                'pengaduan_id' => $request->pengaduan_id,
                'petugas_id'   => $request->petugas_id,
                'isi_tanggapan' => $request->isi_tanggapan,
                'created_at'   => date('Y-m-d H:i:s')
            ]);

            // 2. Update status di tabel pengaduan
            DB::table('pengaduan')
                ->where('id', $request->pengaduan_id)
                ->update(['status' => $request->status_baru]);

            // 3. Catat ke log_status
            DB::table('log_status')->insert([
                'pengaduan_id' => $request->pengaduan_id,
                'status'       => $request->status_baru,
                'keterangan'   => 'Tanggapan diberikan: ' . substr($request->isi_tanggapan, 0, 50) . '...',
                'tanggal'      => date('Y-m-d H:i:s')
            ]);

            DB::commit();

            return response()->json(['message' => 'Tanggapan berhasil dikirim dan status diperbarui'], 201);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['message' => 'Gagal mengirim tanggapan', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Melihat tanggapan berdasarkan ID Pengaduan tertentu
     */
    public function showByPengaduan($id)
    {
        $tanggapan = DB::table('tanggapan')
            ->where('pengaduan_id', $id)
            ->join('petugas', 'tanggapan.petugas_id', '=', 'petugas.id')
            ->select('tanggapan.*', 'petugas.nama as nama_petugas', 'petugas.jabatan')
            ->get();

        if ($tanggapan->isEmpty()) {
            return response()->json(['message' => 'Belum ada tanggapan untuk pengaduan ini'], 404);
        }

        return response()->json($tanggapan);
    }
}