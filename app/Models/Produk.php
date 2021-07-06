<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;
    protected $table = 'produk';
    protected $fillable = ['id_produk','id_kategori','id_jenis','nama','berat','harga','rating','stok','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = 'id_produk';

    public function lampirans()
    {
        return $this->hasMany(Lampiran::class,'id_produk','id_produk');
    }

    public function diskusis()
    {
        return $this->hasMany(Diskusi::class,'id_produk','id_produk');
    }

    public function testimonis()
    {
        return $this->hasMany(Testimoni::class,'id_produk','id_produk');
    }

    public function transaksidetails()
    {
        return $this->hasMany(TransaksiDetail::class,'id_produk','id_produk');
    }

    public function kategori()
    {
        return $this->belongsTo(Kategori::class,'id_kategori','id_kategori');
    }

    public function jenisproduk()
    {
        return $this->belongsTo(JenisProduk::class,'id_jenis','id_jenis');
    }
}
