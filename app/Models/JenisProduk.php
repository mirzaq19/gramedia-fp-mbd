<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JenisProduk extends Model
{
    use HasFactory;
    protected $table = 'jenis_produk';
    protected $fillable = ['id_jenis','id_kategori','jenis','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = null;

    public function produks()
    {
        return $this->hasMany(Produk::class,'id_jenis','id_jenis');
    }
}
