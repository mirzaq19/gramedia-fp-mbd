<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiDetail extends Model
{
    use HasFactory;
    protected $table = 'transaksi_detail';
    protected $fillable = ['id_produk','id_transaksi','jumlah','subtotal'];
    public $timestamp = false;
    protected $primarykey = null;

    public function produk()
    {
        return $this->belongsTo(Produk::class,'id_produk','id_produk');
    }
    public function transaksi()
    {
        return $this->belongsTo(Transaksi::class,'id_transaksi','id_transaksi');
    }
}
