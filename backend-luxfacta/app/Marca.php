<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    protected $table = 'marcas';
    protected $primaryKey = 'cod_marca';
    protected $fillable = array('nom_marca');
}
