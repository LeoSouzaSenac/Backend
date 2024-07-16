// Importação do Readline
import * as readlineSync from 'readline-sync'

// Importação das Interfaces
import { MetodoDePagamento } from './Interfaces/MetodoDePagamento'
import { Produtos } from './Interfaces/Produtos'

// Importação das classes de produto
import { Alimento } from './Classes/Alimento'
import { Eletronico } from './Classes/Eletronico'
import { Livro } from './Classes/Livro'

// Importação das classes de métodos de pagamento
import { PagamentoCartao } from './Classes/PagamentoCartao'
import { PagamentoDinheiro } from './Classes/PagamentoDinheiro'
import { PagamentoPix } from './Classes/PagamentoPix'

// Criação de um array de produtos
const produtos: Produtos[] = [
    new Livro('Ficção', 50, 'O Senhor dos Anéis', 1.2),
    new Eletronico('Smartphone', 2500, 'iPhone', 0.5),
    new Alimento('Fruta', 5, 'Maçã', 0.2)
]

// Array que vai armazenar os produtos que adicionarmos ao carrinho
const carrinho: Produtos[] = []
let totalCompra = 0

//Função que seleciona o método de pagamento
function selecionarPagamento(): MetodoDePagamento | void {
    console.log('Selecione o método de pagamento:')
    console.log('1. Cartão')
    console.log('2. Dinheiro')
    console.log('3. Pix')
    const metodo = readlineSync.question('Escolha uma opção de pagamento: ')

    switch (Number(metodo)) {
        case 1:
            return new PagamentoCartao()
        case 2:
            return new PagamentoDinheiro()
        case 3:
            return new PagamentoPix()
        default:
            console.log('Método de pagamento inválido.')
           
    }
}

function comprarProduto() {
    console.log('Produtos disponíveis:')
    //Itera sobre todos os produtos dentro do array 'produtos' para mostrá-los
    
    produtos.forEach(function(produto, index) {
        console.log(`${index + 1}. ${produto.nome} - ${produto.tipo} - R$${produto.preco}`)
    });

    const escolha = readlineSync.question('Escolha um produto para comprar (número): ')
    
    //O índice começa em zero, ou seja, o produto 1 é o índice 0, o produto 2 é o índice 1, e assim por diante. Por isso,'escolha - 1'.
    const produtoEscolhido = produtos[Number(escolha) - 1]

    //Adiciona o produto escolhido no carrinho e mostra o valor total
    if (produtoEscolhido) {
        //Mostra o nome do produto que escolhi
        console.log(`Você escolheu: ${produtoEscolhido.nome}`)
        //Adiciona o produto que escolhi no array
        carrinho.push(produtoEscolhido)
        //Adiciona o valor do produto escolhido no total da compra, chamando o método calcularValorTotal
        totalCompra += produtoEscolhido.calcularValorTotal()
        //o método toFixed(2) mostra apenas 2 números após a vírgula
        console.log(`Valor total atual: R$${totalCompra.toFixed(2)}`)
    } else {
        console.log('Escolha inválida.')
    }
}

function pagarCompra() {
    console.log(`Total da compra: R$${totalCompra.toFixed(2)}`)
    const metodoPagamento = selecionarPagamento()

    if (metodoPagamento) {
        //Chama o método pagar da classe e passa como argumento o total da compra
        console.log(metodoPagamento.pagar(totalCompra))
        //Define o tamanho do array como 0
        carrinho.length = 0
        //Reseta o total da compra
        totalCompra = 0
    } else {
        console.log('Operação de pagamento cancelada.')
    }
}

//Função que mostra todos os produtos dentro do carrinho
function verCarrinho() {
    console.log('Carrinho de Compras:')
    
    //Itera sobre o array com os produtos no carrinho, mostrando cada um
    carrinho.forEach(function(produto, index) {
        console.log(`${index + 1}. ${produto.nome} - R$${produto.calcularValorTotal().toFixed(2)}`)
    })
    
    console.log(`Total: R$${totalCompra.toFixed(2)}`)
}


//Função principal, que mostra o menu
function main() {
    let continuar = true
    while (continuar) {
        console.log('\nMenu:')
        console.log('1. Comprar Produto')
        console.log('2. Ver Carrinho')
        console.log('3. Pagar')
        console.log('4. Sair')

        const opcao = readlineSync.question('Escolha uma opção: ')

        switch (Number(opcao)) {
            case 1:
                comprarProduto()
                break
            case 2:
                verCarrinho()
                break
            case 3:
                pagarCompra()
                break
            case 4:
                continuar = false;
                console.log('Saindo...')
                break
            default:
                console.log('Opção inválida.')
                break
        }
    }
}

main();
