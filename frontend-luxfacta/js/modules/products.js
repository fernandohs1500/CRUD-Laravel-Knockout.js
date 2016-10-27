var modelProduct = function(){

    var self = this;

    this.url = 'http://beckendluxfacta.gessovitoriaudi.com.br/produto/';

    this.nome = ko.observable("");
    this.preco = ko.observable("");
    this.estoque = ko.observable("");
    this.ean = ko.observable("");
    this.dat_cadastro = ko.observable("");
    this.marca = ko.observable("");
    this.fornecedor = ko.observable("");
    this.categoria = ko.observable("");
    this.observacoes = ko.observable("");
    this.id = ko.observable("");

    var date = new Date();
    var day = date.getDate();
    var monthIndex = date.getMonth() + 1;
    var year = date.getFullYear();
    this.dat_cadastro = ko.observable(day+'/'+monthIndex+'/'+year);

    //lst de marcas
    this.marcas = ko.observableArray([]);
    this.fornecedores = ko.observableArray([]);
    this.categorias = ko.observableArray([]);

    this.criarProduto = function(){

        if(self.validarProdutos()){
            var pproduto = {
                'id' : this.id(),
                'nome' : this.nome(),
                'preco' : this.preco(),
                'estoque' : this.estoque(),
                'ean' : this.ean(),
                'dat_cadastro' : this.dat_cadastro(),
                'marca' : this.marca(),
                'fornecedor' : this.fornecedor(),
                'categoria' : this.categoria(),
                'observacoes' : this.observacoes()
            };

            self.nome("");
            self.preco("");
            self.estoque("");
            self.ean("");
            self.dat_cadastro("");
            self.marca("");
            self.fornecedor("");
            self.categoria("");
            self.observacoes("");

            self.salvarProduto(ko.toJSON(pproduto));
        }else{
            alert("Preencha todos os campos!");
        }
    };

    this.validarProdutos = function(){

        if (self.nome() !== "" && self.preco() != "" && self.estoque() != "" && self.ean() != ""
            && self.dat_cadastro() != "" && self.marca() != "" && self.fornecedores() != ""
            && self.categoria() != "" && self.observacoes() != "") {
            return true;
        }
        return false;
    };

    this.salvarProduto = function(produto){

        $.ajax({
            url: self.url + 'salvar',
            type: 'POST',
            dataType: 'json',
            data: {dados: produto},
            success:function(response){
                if(response.success) {
                    alert("Salvo com sucesso!");
                    window.location.href = "products.html";
                }else{
                    alert("Erro ao salvar os dados");
                }
            },
            error: function(){
                alert("Erro ao enviar dados");
            }
        });

    }

    this.loadReference = function() {
        $.ajax({
            url: self.url + 'referencias',
            type: 'GET',
            dataType: 'json',
            async: false,
            success: function (response) {
                $.each(response.categorias, function (i, categoria) {
                    self.categorias.push(categoria);
                });

                $.each(response.marcas, function (i, categoria) {
                    self.marcas.push(categoria);
                });

                $.each(response.fornecedores, function (i, fornecedor) {
                    self.fornecedores.push(fornecedor);
                });
            }
        });
    }

    this.load = function(id){
        $.ajax({
            url: self.url +id,
            type:'GET',
            dataType: 'json',
            async: false,
            success: function (response) {
                if(response.length == 1) {
                    product = response[0];
                    self.id = ko.observable(product.cod_produto);
                    self.nome = ko.observable(product.non_produto);
                    self.preco = ko.observable(product.val_produto);
                    self.estoque = ko.observable(product.qtd_produto);
                    self.categoria = ko.observable(product.cod_categoria);
                    self.marca = ko.observable(product.cod_marca);
                    self.ean = ko.observable(product.cod_ean);
                    self.fornecedor = ko.observable(product.cod_fornecedor);
                    self.observacoes = ko.observable(product.dsc_observacoes);
                    self.dat_cadastro = ko.observable(product.created_at);
                }
            }
        });
    }

self.loadReference();

    var id = window.location.href.split('=')[1];
    if (id != undefined ){
        self.load(id);
    }
};

ko.applyBindings(new modelProduct());