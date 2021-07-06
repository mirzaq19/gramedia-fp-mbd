<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diskon extends Model
{
    use HasFactory;
    protected $table = 'diskon';
    protected $fillable = ['id_diskon','diskon','kuota','potongan','masa_berlaku','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = 'id_diskon';

    public function transaksis()
    {
        return $this->hasMany(Transaksi::class,'id_diskon','id_diskon');
    }
}
