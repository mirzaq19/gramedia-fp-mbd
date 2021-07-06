<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testimoni extends Model
{
    use HasFactory;
    protected $table = 'testimoni';
    protected $fillable = ['id_testimoni','id_akun','id_produk','rating','testimoni','created_at','updated_at'];
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
