<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Pengaduan extends Model {
    protected $table = 'pengaduan';
    
    // TAMBAHKAN BARIS INI (Wajib!)
    // Agar Lumen tidak mencari kolom 'updated_at' yang hilang
    public $timestamps = false; 

    protected $fillable = ['user_id', 'kategori_id', 'judul', 'isi', 'status', 'created_at'];

    // Relasi ke User
    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relasi ke Kategori
    public function kategori() {
        return $this->belongsTo(KategoriPengaduan::class, 'kategori_id');
    }

    // Relasi ke Tanggapan
    public function tanggapan() {
        return $this->hasMany(Tanggapan::class, 'pengaduan_id');
    }
}