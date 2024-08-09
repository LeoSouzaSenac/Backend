# Exercício: CRUD de Produtos com Express e MySQL

**Objetivo**: Criar uma API REST para gerenciar um catálogo de produtos utilizando Node.js, Express e MySQL.

## Passos:

### 1. Configuração Inicial
- Crie um novo projeto Node.js e instale as seguintes dependências:
  - `express`
  - `mysql2`
  - `body-parser`
  
  ```bash
  npm init -y
  npm install express mysql2 body-parser
  ```

- Configure a conexão com o banco de dados MySQL.
  - Crie um banco de dados chamado `catalogo_produtos`.
  - Dentro desse banco, crie uma tabela `produtos` com as seguintes colunas:
    - `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
    - `nome` (VARCHAR(255))
    - `descricao` (TEXT)
    - `preco` (DECIMAL(10, 2))

### 2. Criar Endpoints (as 'URLS')

Crie os seguintes endpoints na sua API:

#### **POST `/produtos`**
- Este endpoint deve adicionar um novo produto ao banco de dados.
- O corpo da requisição deve ser um JSON com os campos `nome`, `descricao`, e `preco`.
- Exemplo de corpo da requisição:

  ```json
  {
    "nome": "Produto Exemplo",
    "descricao": "Descrição do produto exemplo",
    "preco": 99.90
  }
  ```

#### **GET `/produtos`**
- Este endpoint deve retornar todos os produtos cadastrados no banco de dados.
- A resposta deve ser um array de objetos JSON representando os produtos.

#### **GET `/produtos/:id`**
- Este endpoint deve retornar os detalhes de um produto específico, com base no `id` passado na URL.
- Se o produto não for encontrado, deve retornar uma mensagem de erro.

#### **PUT `/produtos/:id`**
- Este endpoint deve atualizar as informações de um produto específico, baseado no `id` passado na URL.
- O corpo da requisição deve conter os campos que serão atualizados: `nome`, `descricao`, e `preco`.
- Exemplo de corpo da requisição:

  ```json
  {
    "nome": "Produto Atualizado",
    "descricao": "Descrição atualizada do produto",
    "preco": 149.99
  }
  ```

#### **DELETE `/produtos/:id`**
- Este endpoint deve deletar um produto específico com base no `id` passado na URL.
- Se o produto for deletado com sucesso, deve retornar uma mensagem de confirmação.

### 3. Validação e Tratamento de Erros
- Adicione validações para garantir que todos os campos obrigatórios (`nome`, `descricao`, `preco`) sejam preenchidos ao adicionar ou atualizar um produto.
- Implemente o tratamento de erros para responder corretamente em casos de:
  - Falhas na conexão com o banco de dados.
  - Tentativas de acesso a produtos que não existem.

### 4. Teste da API
- Utilize o Postman para testar os endpoints da API.
- Certifique-se de que todas as operações (CRUD) estão funcionando corretamente.

## Entrega
- Envie o link para o repositório GitHub onde o projeto foi desenvolvido.
- Certifique-se de que o código está bem organizado e comentado.



Neste exercpicio você vai praticar a criação de uma API completa com funcionalidades de CRUD, enquanto consolida seus conhecimentos em Node.js, Express e MySQL.
