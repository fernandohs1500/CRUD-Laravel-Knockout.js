<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    protected $table = 'produtos';
    protected $primaryKey = 'cod_produto';
    protected $fillable = array(
        'non_produto','val_produto','qtd_produto', 'cod_categoria',
        'cod_marca','cod_ean','cod_fornecedor','dsc_observacoes');
}
