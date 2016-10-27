var PagedGridModel = function(items) {
    var self = this;
    this.url = "http://luxfacta.dev/produto/";
    this.items = ko.observableArray(items);

    this.sorterProduto = 1;
    this.sorterValor = 1;
    this.sorterQtd = 1;
    this.sorterDisponivel =1;

    this.gridViewModel = new ko.simpleGrid.viewModel({
        data: this.items,
        columns: [
            { headerText: "Codigo", rowText: "cod_produto" },
            { headerText: "Produto", rowText: "non_produto",
                sortOrder: {
                    ordenar: function(){
                        self.items.sort(function(a, b) {
                            if(self.sorterProduto == 1){
                                //
                                return a.non_produto < b.non_produto ? -1 : 1;
                            }else{
                                return a.non_produto > b.non_produto ? -1 : 1;
                            }
                        });

                        if(self.sorterProduto == 1){
                            self.sorterProduto = 0;
                        }else{
                            self.sorterProduto = 1;
                        }
                    }
                }
            },
            { headerText: "Valor", rowText: function (item) { return "R$" + item.val_produto.toFixed(2) },
                sortOrder: {
                    ordenar: function(){
                        self.items.sort(function(a, b) {
                            if(self.sorterValor == 1){
                                //
                                return a.val_produto < b.val_produto ? -1 : 1;
                            }else{
                                return a.val_produto > b.val_produto ? -1 : 1;
                            }
                        });

                        if(self.sorterValor == 1){
                            self.sorterValor = 0;
                        }else{
                            self.sorterValor = 1;
                        }
                    }
                }
            },
            { headerText: "Quantidade", rowText: "qtd_produto",
                sortOrder: {
                    ordenar: function(){
                        self.items.sort(function(a, b) {
                            if(self.sorterQtd == 1){
                                return a.qtd_produto < b.qtd_produto ? -1 : 1;
                            }else{
                                return a.qtd_produto > b.qtd_produto ? -1 : 1;
                            }
                        });

                        if(self.sorterQtd == 1){
                            self.sorterQtd = 0;
                        }else{
                            self.sorterQtd = 1;
                        }
                    }
                },
                editar: {
                    atualizar: function(item){
                        return function() {
                            $.ajax({
                                url: self.url + item.cod_produto + '/estoque',
                                type: 'POST',
                                dataType: 'json',
                                data: {qtd : item.qtd_produto}
                            });
                            alert('Estoque atualizado!');
                        }
                    }
                }
            },
            { headerText: "Cod.Barra", rowText: "cod_ean" },
            { headerText: "Disponível", rowText: "disponivel",
                sortOrder: {
                    ordenar: function(){
                        self.items.sort(function(a, b) {
                            if(self.sorterDisponivel == 1){
                                return a.disponivel < b.disponivel ? -1 : 1;
                            }else{
                                return a.disponivel > b.disponivel ? -1 : 1;
                            }
                        });

                        if(self.sorterDisponivel == 1){
                            self.sorterDisponivel = 0;
                        }else{
                            self.sorterDisponivel = 1;
                        }
                    }
                }
            },
            { headerText: "Ações", rowText: {
                excluir: function(item){
                    return function() {
                        $.ajax({
                            url: self.url + item.cod_produto,
                            type: 'DELETE',
                            dataType: 'json',
                            async: false
                        });
                        self.items.remove(item);
                    }
                },
                editar: function (item) {
                    return function() {
                        window.location.href = "form.html?id=" + item.cod_produto;
                    }
                }
            }}
        ],
        pageSize: 5,
    });

};

var urlBackEnd = 'http://luxfacta.dev/';
function loadGrid(){
    $.ajax({
        url: urlBackEnd + 'produtos/all',
        type: 'GET',
        dataType: 'json',
        async: false,
        success: function(response){
            ko.applyBindings(new PagedGridModel(response));
        },
        error: function(){
            alert("Erro ao carregar dados!");
        }
    });
}

loadGrid();