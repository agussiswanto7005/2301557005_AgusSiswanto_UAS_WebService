<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LogStatusController extends Controller
{
    /**
     * Menampilkan semua log status (Opsional untuk Admin)
     */
    public function index()
    {
        $logs = DB::table('log_status')
            ->join('pengaduan', 'log_status.pengaduan_id', '=', 'pengaduan.id')
            ->select('log_status.*', 'pengaduan.judul')
            ->orderBy('log_status.tanggal', 'DESC')
            ->get();

        return response()->json($logs);
    }

    /**
     * Menampilkan riwayat status untuk satu pengaduan spesifik
     * Digunakan untuk fitur "Timeline" di frontend
     */
    public function showByPengaduan($id)
    {
        $logs = DB::table('log_status')
            ->where('pengaduan_id', $id)
            ->orderBy('tanggal', 'ASC')
            ->get();

        if ($logs->isEmpty()) {
            return response()->json(['message' => 'Belum ada riwayat status'], 404);
        }

        return response()->json($logs);
    }

    /**
     * Menambahkan log status baru secara manual
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'pengaduan_id' => 'required|exists:pengaduan,id',
            'status'       => 'required|in:dikirim,diproses,selesai',
            'keterangan'   => 'required|string'
        ]);

        $insert = DB::table('log_status')->insert([
            'pengaduan_id' => $request->pengaduan_id,
            'status'       => $request->status,
            'keterangan'   => $request->keterangan,
            'tanggal'      => date('Y-m-d H:i:s')
        ]);

        if ($insert) {
            return response()->json(['message' => 'Log status berhasil ditambahkan'], 201);
        }

        return response()->json(['message' => 'Gagal menambahkan log'], 500);
    }
}