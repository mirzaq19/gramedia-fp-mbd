<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;
    protected $table = 'transaksi';
    protected $fillable = ['id_transaksi','id_akun','id_diskon','id_jasakirim','jumlah_biaya','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = null;

    public function transaksidetails()
    {
        return $this->hasMany(TransaksiDetail::class,'id_transaksi','id_transaksi');
    }

    public function akun()
    {
        return $this->belongsTo(Akun::class,'id_akun','id_akun');
    }

    public function jasakirim()
    {
        return $this->belongsTo(JasaKirim::class,'id_jasakirim','id_jasakirim');
    }
    public function diskon()
    {
        return $this->belongsTo(Diskon::class,'id_diskon','id_diskon');
    }
}
