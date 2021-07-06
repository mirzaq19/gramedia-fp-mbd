<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diskusi extends Model
{
    use HasFactory;
    protected $table = 'diskusi';
    protected $fillable = ['id_diskusi','id_produk','id_akun','isi','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = null;

    public function akun()
    {
        return $this->belongsTo(Akun::class,'id_akun','id_akun');
    }
    public function produk()
    {
        return $this->belongsTo(Produk::class,'id_produk','id_produk');
    }
}
