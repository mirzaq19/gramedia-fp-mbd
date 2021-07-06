<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    use HasFactory;
    protected $table = 'kategori';
    protected $fillable = ['id_kategori','kategori','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = 'id_kategori';

    public function produks()
    {
        return $this->hasMany(Produk::class,'id_kategori','id_kategori');
    }

    public function jenisproduks()
    {
        return $this->hasMany(JenisProduk::class,'id_kategori','id_kategori');
    }
}
