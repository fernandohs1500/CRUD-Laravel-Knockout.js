<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fornecedor extends Model
{
    protected $table = 'fornecedores';
    protected $primaryKey = 'cod_fornecedor';
    protected $fillable = array('nom_fornecedor');
}
