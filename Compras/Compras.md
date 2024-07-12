# 🛒 Sistema de Compras em TypeScript

Você deve criar um programa que simule um sistema de compras de produtos, onde o usuário pode escolher produtos para comprar, visualizar o carrinho de compras, realizar o pagamento e escolher entre diferentes métodos de pagamento.

## Passos para Implementação

### 🏷️ Crie as Interfaces

1. **Interface Produtos**:
   - Crie uma interface chamada `Produtos` que tenha os atributos e métodos que suas classes de produto devem seguir.
   - Inclua um método obrigatório na interface chamado `calcularValorTotal(): number` que retorna um número representando o valor total do produto.

2. **Interface MetodosDePagamento**:
   - Crie uma interface chamada `MétodosDePagamento` que tenha os atributos e métodos que suas classes de pagamento devem seguir. Por exemplo, método `pagar()`.

### 🏭 Classes Implementando a Interface

1. **Produtos**:
   - Implemente três classes que utilizem a interface `Produtos`: Ex. `Livro`, `Eletronico` e `Alimento`.
   - Cada classe deve implementar a interface `Produtos` e ter um construtor que inicialize os atributos.
   - Implemente o método `calcularValorTotal()` de forma diferente em cada classe, aplicando uma lógica de cálculo específica para cada tipo de produto.
     - Exemplo: em `Alimento`, o valor total é multiplicado por um valor pois tem taxas, etc.

2. **MétodosDePagamento**:
   - Crie três classes implementando a interface `MétodosDePagamento`: Ex. `CartaoDeCredito`, `Pix`, `Dinheiro`.

### 🛍️ Sistema de Compras

1. **Carrinho de Compras**:
   - Crie um array `carrinho` que armazenará os produtos adicionados pelo usuário. Ele vai funcionar como nosso banco de dados.

2. **Funções**:
   - Implemente as seguintes funções:
     - `comprarProduto()`: Permite ao usuário adicionar produtos ao carrinho.
     - `verCarrinho()`: Exibe os produtos no carrinho, mostrando o nome, tipo e preço de cada produto, além do total da compra.
     - `pagar()`: Permite ao usuário escolher entre diferentes métodos de pagamento para finalizar a compra. Ao selecionar um método de pagamento, exibe o valor total da compra e pergunta se o usuário deseja prosseguir com o pagamento.

### 📋 Menu Principal

- Implemente um loop principal que exibe um menu para o usuário com as seguintes opções:
  - Comprar Produto
  - Ver Carrinho
  - Pagar
  - Sair

### 🛠️ Requisitos Adicionais

- Use `readline-sync` ou outra biblioteca adequada para interação com o usuário.
- Mantenha o código organizado e utilize boas práticas de programação em TypeScript.
