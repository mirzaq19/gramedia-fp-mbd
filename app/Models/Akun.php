<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Akun extends Model
{
    use HasFactory;
    protected $table = 'akun';
    protected $fillable = ['id_akun','nama','email','password','nohp','alamat','created_at','updated_at'];
    public $timestamp = false;
    protected $primarykey = 'id_akun';

    public function testimonis()
    {
        return $this->hasMany(Testimoni::class,'id_akun','id_akun');
    }
    public function diskusis()
    {
        return $this->hasMany(Diskusi::class,'id_akun','id_akun');
    }
    public function transaksis()
    {
        return $this->hasMany(Transaksi::class,'id_akun','id_akun');
    }
}
