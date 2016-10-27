<?php
namespace App\Http\Controllers;

use App\Categoria;
use App\Fornecedor;
use App\Marca;
use App\Produto;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        echo '<h3>LuxFacta BackEnd</h3>';
    }

    public function save(Request $request)
    {
        $request = $request->all();
        $request = $request['dados'];
        $produto = json_decode($request, true);

        if (empty($produto['id'])) {
            $codProduto = Produto::create(array(
                'non_produto' => $produto['nome'],
                'val_produto' => str_replace(',', '.', $produto['preco']),
                'qtd_produto' => $produto['estoque'],
                'cod_categoria' => $produto['categoria'],
                'cod_marca' => $produto['marca'],
                'cod_ean' => $produto['ean'],
                'cod_fornecedor' => $produto['fornecedor'],
                'dsc_observacoes' => $produto['observacoes'],
            ));
        } else {
            $objProduto = Produto::find($produto['id']);
            $objProduto->non_produto = $produto['nome'];
            $objProduto->val_produto = str_replace(',', '.', $produto['preco']);
            $objProduto->qtd_produto = $produto['estoque'];
            $objProduto->cod_categoria = $produto['categoria'];
            $objProduto->cod_marca = $produto['marca'];
            $objProduto->cod_ean = $produto['ean'];
            $objProduto->cod_fornecedor = $produto['fornecedor'];
            $objProduto->dsc_observacoes = $produto['observacoes'];
            $objProduto->save();

            $codProduto = $produto['id'];
        }

        if (!empty($codProduto)) {
            return array("success" => 1, 'cod' => $codProduto);
        }

        return array("success" => 0, 'cod' => '');
    }


    public function getReferencesProduct()
    {
        $lstCategoria  = Categoria::all()->toArray();
        $lstFornecedor = Fornecedor::all()->toArray();
        $lstMarca = Marca::all()->toArray();

        return array('categorias' => $lstCategoria, 'fornecedores' => $lstFornecedor,  'marcas' => $lstMarca);
    }

    public function getProduct($id)
    {
        if (is_numeric($id)) {
            $produto = DB::table('produtos')->where('cod_produto', $id)->get()->toArray();
            return $produto;
        }
    }

    public function getAll()
    {
        $lstProdutos  = Produto::all()->toArray();

        foreach ($lstProdutos as &$produto) {
            $produto['disponivel'] = $produto['qtd_produto'] >= 1 ? 'sim' : 'não';
        }

        return $lstProdutos;
    }

    public function delete($id)
    {
        Produto::destroy($id);
    }

    public function atualizarEstoque(Request $request, $id)
    {
        $request = $request->all();
        $objProduto = Produto::find($id);
        $objProduto->qtd_produto = $request['qtd'];
        $objProduto->save();
    }
}
