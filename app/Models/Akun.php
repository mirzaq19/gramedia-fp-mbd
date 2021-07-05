<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Akun extends Model
{
    use HasFactory;

    use HasFactory;
    protected $table = 'akun';
    protected $fillable = ['id_akun','nama','email','password','nohp','alamat'];
    protected $primarykey = 'id_akun';

    
}
