<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Petugas;

class PetugasController extends Controller {
    public function index() {
        return response()->json(Petugas::all());
    }

    public function store(Request $request) {
        $this->validate($request, ['nama' => 'required']);
        $petugas = Petugas::create($request->all());
        return response()->json($petugas);
    }

    public function update(Request $request, $id) {
        $petugas = Petugas::find($id);
        if($petugas) {
            $petugas->update($request->all());
            return response()->json($petugas);
        }
        return response()->json(['message' => 'Gagal'], 404);
    }

    public function destroy($id) {
        $petugas = Petugas::find($id);
        if($petugas) {
            $petugas->delete();
            return response()->json(['message' => 'Terhapus']);
        }
        return response()->json(['message' => 'Gagal'], 404);
    }
}