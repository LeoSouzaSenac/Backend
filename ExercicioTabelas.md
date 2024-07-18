# Exercício: Criação de Tabelas de uma Loja Virtual no Excel

## Objetivo
Criar tabelas no Excel para uma loja virtual, utilizando chaves primárias e estrangeiras. 
As chaves estrangeiras devem ser destacadas com a mesma cor das colunas que elas referenciam em outras tabelas.


## Passos para Criar as Tabelas no Excel

1. **Abra uma nova planilha no Excel.**

2. **Crie as tabelas conforme a estrutura acima:**
   - Use uma aba separada para cada tabela (por exemplo, "Clientes", "Produtos", "Categorias", "Pedidos", "Itens do Pedido").

3. **Formatando as Colunas:**
   - **Tabela de Clientes:** 
     - `ID_Cliente` (A)
     - Nome (B)
     - Email (C)
     - Telefone (D)
     - Endereço (E)

   - **Tabela de Produtos:** 
     - `ID_Produto` (A)
     - Nome_Produto (B)
     - Preço (C)
     - Estoque (D)
     - `Categoria_ID` (E) - **Cor: Azul**

   - **Tabela de Categorias:** 
     - `ID_Categoria` (A) - **Cor: Verde**
     - Nome_Categoria (B)

   - **Tabela de Pedidos:** 
     - `ID_Pedido` (A)
     - `ID_Cliente` (B) - **Cor: Laranja**
     - Data_Pedido (C)
     - Total (D)

   - **Tabela de Itens do Pedido:** 
     - `ID_Item` (A)
     - `ID_Pedido` (B) - **Cor: Roxa**
     - `ID_Produto` (C) - **Cor: Vermelha**
     - Quantidade (D)

4. **Definição das Chaves Estrangeiras:**
   - `Categoria_ID` na Tabela de Produtos faz referência a `ID_Categoria` na Tabela de Categorias (Azul).
   - `ID_Cliente` na Tabela de Pedidos faz referência a `ID_Cliente` na Tabela de Clientes (Laranja).
   - `ID_Pedido` na Tabela de Itens do Pedido faz referência a `ID_Pedido` na Tabela de Pedidos (Roxa).
   - `ID_Produto` na Tabela de Itens do Pedido faz referência a `ID_Produto` na Tabela de Produtos (Vermelha).

5. **Formatação das Cores:**
   - Selecione as colunas de chave estrangeira e formate-as com a mesma cor que a coluna da chave primária correspondente. 
Por exemplo, todas as células em `Categoria_ID` devem ser preenchidas com azul.

## Finalizando o Exercício
- Preencha as tabelas com dados fictícios.
- Insira alguns dados de exemplo em cada tabela, garantindo que as chaves estrangeiras correspondam corretamente aos valores nas chaves primárias.

## Dica
Utilize as funções de validação de dados do Excel para garantir que as chaves estrangeiras aceitem apenas valores existentes nas chaves 
primárias das tabelas correspondentes.



