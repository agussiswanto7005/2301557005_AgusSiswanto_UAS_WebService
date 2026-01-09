<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request; // Tambahkan ini untuk menangkap data input

class UserController extends Controller {
    
    public function index() {
        return response()->json(User::all());
    }

    // Tambahkan fungsi store di bawah ini
    public function store(Request $request) {
        // Validasi input sesuai kolom database Anda
        $this->validate($request, [
            'nama' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'role' => 'required'
        ]);

        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => $request->password, // Sebaiknya gunakan Hash::make() untuk keamanan
            'role' => $request->role,
        ]);

        return response()->json(['message' => 'User berhasil dibuat', 'data' => $user], 201);
    }
}