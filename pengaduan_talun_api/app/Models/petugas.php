<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Petugas extends Model {
    protected $table = 'petugas';

    // WAJIB ADA: Matikan timestamp
    public $timestamps = false;

    protected $fillable = ['nama', 'jabatan', 'no_hp'];
}