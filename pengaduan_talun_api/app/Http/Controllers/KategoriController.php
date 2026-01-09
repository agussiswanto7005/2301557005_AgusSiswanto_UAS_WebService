<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\KategoriPengaduan;

class KategoriController extends Controller {
    public function index() {
        return response()->json(KategoriPengaduan::all());
    }

    public function store(Request $request) {
        $this->validate($request, ['nama_kategori' => 'required']);
        $kategori = KategoriPengaduan::create($request->all());
        return response()->json($kategori);
    }

    public function update(Request $request, $id) {
        $kategori = KategoriPengaduan::find($id);
        if($kategori) {
            $kategori->update($request->all());
            return response()->json($kategori);
        }
        return response()->json(['message' => 'Gagal'], 404);
    }

    public function destroy($id) {
        $kategori = KategoriPengaduan::find($id);
        if($kategori) {
            $kategori->delete();
            return response()->json(['message' => 'Terhapus']);
        }
        return response()->json(['message' => 'Gagal'], 404);
    }
}