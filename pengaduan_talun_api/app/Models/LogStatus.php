<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class LogStatus extends Model {
    protected $table = 'log_status';
    public $timestamps = false;
    protected $fillable = ['pengaduan_id', 'status', 'keterangan', 'tanggal'];
}