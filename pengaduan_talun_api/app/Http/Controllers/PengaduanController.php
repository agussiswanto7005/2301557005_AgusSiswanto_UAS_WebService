<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Pengaduan;

class PengaduanController extends Controller {

    // GET: Ambil semua pengaduan
    public function index() {
        // Menggunakan 'with' untuk eager loading relasi user dan kategori
        $data = Pengaduan::with(['user', 'kategori', 'tanggapan'])->orderBy('created_at', 'desc')->get();
        return response()->json($data);
    }

    // POST: Kirim pengaduan baru
    public function store(Request $request) {
        $this->validate($request, [
            'user_id' => 'required|integer',
            'kategori_id' => 'required|integer',
            'judul' => 'required',
            'isi' => 'required'
        ]);

        $pengaduan = Pengaduan::create($request->all());
        return response()->json(['message' => 'Pengaduan terkirim', 'data' => $pengaduan], 201);
    }

    // GET: Detail pengaduan by ID
    public function show($id) {
        $pengaduan = Pengaduan::with(['user', 'kategori', 'tanggapan'])->find($id);
        if (!$pengaduan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }
        return response()->json($pengaduan);
    }

    // Tambahkan method ini di dalam class PengaduanController

    // PUT: Update status pengaduan
    public function update(Request $request, $id) {
        $pengaduan = Pengaduan::find($id);
        if (!$pengaduan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        // Hanya update status (contoh sederhana)
        $pengaduan->update($request->only(['status']));
        return response()->json(['message' => 'Status berhasil diupdate', 'data' => $pengaduan]);
    }

    // DELETE: Hapus pengaduan
    public function destroy($id) {
        $pengaduan = Pengaduan::find($id);
        if (!$pengaduan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $pengaduan->delete();
        return response()->json(['message' => 'Data berhasil dihapus']);
    }
}