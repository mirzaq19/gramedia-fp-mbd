<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lampiran extends Model
{
    use HasFactory;
    protected $table = 'lampiran';
    protected $fillable = ['id_lampiran','id_produk','lampiran','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = null;

    public function produk()
    {
        return $this->belongsTo(Produk::class,'id_produk','id_produk');
    }
}
