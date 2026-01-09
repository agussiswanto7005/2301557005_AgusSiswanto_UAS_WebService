<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class KategoriPengaduan extends Model {
    protected $table = 'kategori_pengaduan';
    
    // WAJIB ADA: Agar Lumen tidak mencari kolom created_at/updated_at yang hilang
    public $timestamps = false; 

    protected $fillable = ['nama_kategori'];
}