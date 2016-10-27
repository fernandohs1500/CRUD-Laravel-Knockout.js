<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table = 'usuarios';
    protected $primaryKey = 'cod_usuario';
    protected $fillable = array('nom_usuario','bol_ativo');
}
