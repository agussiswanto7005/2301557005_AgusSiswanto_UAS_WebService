<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller {
    
    public function register(Request $request) {
        $this->validate($request, [
            'nama' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);

        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Password di-hash
            'role' => 'masyarakat'
        ]);

        return response()->json(['message' => 'Berhasil daftar', 'data' => $user], 201);
    }

    public function login(Request $request) {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Login gagal'], 401);
        }

        // Catatan: Untuk TA sebaiknya gunakan JWT Auth, tapi ini basic return user
        return response()->json(['message' => 'Login berhasil', 'data' => $user]);
    }
}