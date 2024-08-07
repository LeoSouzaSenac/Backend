# Entendendo APIs

# O que são APIs e porque usamos elas para se comunicar com um servidor?

APIs, ou **Application Programming Interfaces** (Interfaces de Programação de Aplicações), são como intermediários que permitem que um aplicativo se comunique com um servidor. Elas definem um conjunto de regras e formatos que permitem a troca de informações entre o cliente (seu aplicativo) e o servidor (onde os dados e serviços estão armazenados).

## Como Funciona?

1. **Requisição**: Quando você usa um aplicativo e faz uma ação, como buscar informações ou enviar dados, o aplicativo faz uma requisição ao servidor usando uma API.
2. **Processamento**: O servidor recebe a requisição, processa a informação necessária (como consultar um banco de dados ou executar uma lógica de negócios).
3. **Resposta**: O servidor envia a resposta de volta ao aplicativo através da API, com os dados solicitados ou uma confirmação de que a ação foi completada.

## Exemplos de Uso

- **Buscar Dados**: Um aplicativo de clima que busca informações meteorológicas de um servidor.
- **Enviar Dados**: Um formulário de cadastro que envia informações do usuário para serem armazenadas em um banco de dados no servidor.
- **Atualizar Dados**: Um aplicativo de redes sociais que permite atualizar seu perfil, enviando as novas informações para o servidor.

## Importância das APIs

- **Integração**: APIs permitem que aplicativos interajam com serviços de terceiros (como serviços de pagamento ou redes sociais) sem precisar conhecer os detalhes internos desses serviços.
- **Eficiência**: Elas facilitam a comunicação eficiente entre o cliente e o servidor, permitindo o desenvolvimento de aplicativos complexos de maneira mais simples e rápida.
- **Segurança**: APIs podem ser configuradas para garantir que apenas usuários autorizados possam acessar e modificar dados no servidor.

Em resumo, as APIs são essenciais para que aplicativos possam se comunicar e interagir com servidores, permitindo a troca de dados e a execução de funcionalidades de forma estruturada e segura.


## A Analogia do Restaurante

Imagine que você está em um restaurante e quer fazer um pedido:

- **Você** é o cliente.
- **O cardápio** é a lista de opções de comida.
- **O garçom** é a API (Interface de Programação de Aplicações).
- **A cozinha** é o servidor (ou sistema que prepara a comida).
- **O protocolo HTTP** é o conjunto de regras que o garçom (API) usa para comunicar o seu pedido à cozinha e trazer a comida de volta.

## Como Funciona o Pedido

### Escolhendo do Cardápio (Definindo a Requisição)

Você decide o que quer comer e faz o pedido ao garçom. Este pedido é como uma requisição HTTP que você faz para um servidor. O garçom entende o pedido e usa uma "linguagem" (protocolo HTTP) para comunicar isso à cozinha.

### Entregando o Pedido (Enviando a Requisição)

O garçom (API) pega seu pedido e usa o protocolo HTTP para entregá-lo à cozinha. O protocolo HTTP define como essa comunicação deve ocorrer, como o formato da mensagem e os procedimentos de entrega. Por exemplo, o garçom pode usar um "pedido GET" para consultar o menu ou um "pedido POST" para enviar uma nova solicitação.

### Preparando a Comida (Processando a Requisição)

A cozinha (servidor) recebe o pedido e começa a preparar a comida. Esse é o processamento da requisição HTTP. A cozinha segue as instruções que o garçom trouxe para preparar o prato solicitado.

### Recebendo a Comida (Recebendo a Resposta)

Quando a comida está pronta, o garçom (API) a entrega a você. A resposta da cozinha é como a resposta HTTP que o servidor envia de volta ao cliente. A resposta pode conter o prato que você pediu, ou se houve algum problema, pode conter uma mensagem de erro.

## Tipos de Requisições e Respostas

- **GET:** Se você pede um prato que já está no menu, o garçom usa um pedido GET para solicitar as informações da cozinha. A resposta pode ser o prato pronto.

  Exemplo: `GET /menu HTTP/1.1`

  GET: Este é o método HTTP. Os métodos HTTP indicam a ação que o cliente deseja realizar.
  
  /menu: Este é o caminho do recurso que está sendo solicitado. No contexto de uma URL completa
  (por exemplo, https://www.example.com/menu), /menu especifica o recurso no servidor que o cliente deseja acessar.
  Este caminho pode variar dependendo da estrutura e organização dos recursos no servidor.

  HTTP/1.1: Esta é a versão do protocolo HTTP que está sendo usada. 

- **POST:** Se você deseja criar um novo prato que não está no menu, você faz um pedido POST para que a cozinha crie o prato. A resposta pode confirmar que o prato foi adicionado ao menu.

  Exemplo: `POST /add-dish HTTP/1.1`

  

- **PUT:** Se você quer mudar um prato já existente, o garçom faz um pedido PUT para atualizar as informações na cozinha. A resposta confirma que o prato foi atualizado.

  Exemplo: `PUT /update-dish/1 HTTP/1.1`

- **DELETE:** Se você deseja remover um prato do menu, o garçom faz um pedido DELETE para a cozinha. A resposta confirma que o prato foi removido.

  Exemplo: `DELETE /remove-dish/1 HTTP/1.1`

## Componentes de uma Requisição HTTP

- **Linha de Requisição:** Contém o método (GET, POST, etc.), o caminho do recurso (como `/menu`), e a versão do protocolo HTTP.

  Exemplo: `GET /menu HTTP/1.1`

- **Cabeçalhos:** Informações adicionais sobre o pedido, como o tipo de prato ou o formato preferido.

  Exemplo: `Accept: application/json`

- **Corpo da Requisição:** Dados enviados ao servidor, geralmente em pedidos POST e PUT. Pode incluir informações sobre o novo prato ou atualizações.

  Exemplo: `{ "name": "New Dish", "ingredients": ["chicken", "rice"] }`

## Componentes da Resposta HTTP

- **Linha de Status:** Indica o resultado da requisição, como sucesso ou erro.

  Exemplo: `HTTP/1.1 200 OK`

- **Cabeçalhos:** Informações adicionais sobre a resposta, como o tipo de conteúdo retornado.

  Exemplo: `Content-Type: application/json`

- **Corpo da Resposta:** Dados retornados pelo servidor, como o prato pronto ou uma mensagem de erro.

  Exemplo: `{ "dish": "New Dish", "status": "added" }`

## Resumo

No restaurante, a API (garçom) e o protocolo HTTP (conjunto de regras) trabalham juntos para garantir que seu pedido chegue corretamente à cozinha e que você receba o que pediu. Da mesma forma, na web, uma API usa o protocolo HTTP para permitir que aplicativos e servidores se comuniquem, enviando e recebendo dados de maneira estruturada e eficiente. Entender como essa comunicação funciona ajuda a construir e utilizar sistemas web de forma mais eficaz.



## Por Que Usamos Métodos HTTP e Comandos SQL Juntos?

Os métodos HTTP e comandos SQL servem a propósitos diferentes mas complementares:

- **Métodos HTTP**: São usados para definir a intenção da requisição que estamos fazendo ao servidor web. Por exemplo, queremos registrar um usuário? Saber quais usuários existem? Usamos os métodos HTTP.
- Eles seguem o protocolo HTTP e ajudam a organizar e padronizar a forma como os clientes (como navegadores ou aplicativos) comunicam-se com o servidor.
  
- **Comandos SQL**: São usados dentro do servidor para realizar operações específicas no banco de dados. Eles manipulam diretamente os dados armazenados. São eles que vão realizar a ação que queremos.

### Como Eles Funcionam Juntos?

Quando um cliente (por exemplo, um navegador web) faz uma requisição a um servidor, ele usa um método HTTP para indicar o tipo de ação que deseja realizar. O servidor então processa essa requisição e, dependendo da ação solicitada, executa os comandos SQL apropriados para interagir com o banco de dados.

### Exemplos:

1. **Adicionar um Usuário (POST)**
    - **Método HTTP**: `POST /usuarios`
    - **Ação**: Criar um novo usuário.
    - **Comando SQL**: `INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)`
    - **Processo**:
        - O cliente envia uma requisição `POST` com os dados do usuário.
        - O servidor recebe a requisição, extrai os dados e executa um comando `INSERT` para adicionar o novo usuário ao banco de dados.

2. **Obter Todos os Usuários (GET)**
    - **Método HTTP**: `GET /usuarios`
    - **Ação**: Ler todos os usuários.
    - **Comando SQL**: `SELECT * FROM usuarios`
    - **Processo**:
        - O cliente envia uma requisição `GET` para obter a lista de usuários.
        - O servidor recebe a requisição e executa um comando `SELECT` para recuperar todos os usuários do banco de dados e enviar de volta ao cliente.

3. **Atualizar um Usuário (PUT)**
    - **Método HTTP**: `PUT /usuarios/:id`
    - **Ação**: Atualizar um usuário existente.
    - **Comando SQL**: `UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?`
    - **Processo**:
        - O cliente envia uma requisição `PUT` com os novos dados do usuário.
        - O servidor recebe a requisição, extrai os novos dados e o `id`, e executa um comando `UPDATE` para atualizar o usuário no banco de dados.

4. **Deletar um Usuário (DELETE)**
    - **Método HTTP**: `DELETE /usuarios/:id`
    - **Ação**: Deletar um usuário existente.
    - **Comando SQL**: `DELETE FROM usuarios WHERE id = ?`
    - **Processo**:
        - O cliente envia uma requisição `DELETE` com o `id` do usuário a ser deletado.
        - O servidor recebe a requisição, extrai o `id`, e executa um comando `DELETE` para remover o usuário do banco de dados.

### Conclusão

Usamos métodos HTTP para definir a intenção da comunicação entre o cliente e o servidor, e comandos SQL para realizar as operações necessárias no banco de dados. Isso nos permite criar aplicativos web que podem interagir de forma eficiente e organizada com um banco de dados, fornecendo aos usuários uma interface para gerenciar dados.

