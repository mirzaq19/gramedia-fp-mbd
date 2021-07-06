<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JasaKirim extends Model
{
    use HasFactory;
    protected $table = 'jasa_kirim';
    protected $fillable = ['id_jasakirim','jasakirim','biaya_perkg','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = 'id_jasakirim';

    public function transaksis()
    {
        return $this->hasMany(Transaksi::class,'id_jasakirim','id_jasakirim');
    }
}
