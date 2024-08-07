# O Que é o Express?

## Introdução

Express é um framework web minimalista e flexível para Node.js. Ele facilita a criação de servidores web. Quando falamos que o Express "cria um servidor web," estamos nos referindo ao fato de que ele fornece uma maneira fácil e rápida de configurar e gerenciar um servidor que pode responder a requisições HTTP.


## Como o Express Cria um Servidor Web
Criação do Servidor:
O Express permite criar um servidor web com apenas algumas linhas de código. Ele usa o módulo HTTP do Node.js para fazer isso, mas oferece uma API mais amigável e poderosa.

### Configuração de Rotas:
Com o Express, você define rotas que determinam como o servidor deve responder a diferentes URLs e métodos HTTP (GET, POST, etc.). Essas rotas são configuradas para responder a requisições com dados específicos ou executar funções de backend.

### Uso de Middlewares:
Middlewares são funções que podem processar requisições e respostas. Eles podem ser usados para tarefas como autenticação, validação de dados, e logging. O Express facilita a integração de middlewares para adicionar funcionalidades adicionais ao servidor.

### Início do Servidor:
O Express simplifica o processo de iniciar o servidor e escutar requisições em uma porta específica. Isso permite que o servidor fique disponível para receber e responder a requisições dos clientes.


## Principais Características

- **Minimalista**: Fornece apenas o essencial para criar servidores web, permitindo adicionar funcionalidades conforme necessário.
- **Fácil de Usar**: Tem uma API simples e intuitiva, que torna o desenvolvimento rápido e eficiente.
- **Middlewares**: Funções que processam requisições e respostas, podendo modificar dados ou finalizar o ciclo de requisição-resposta.
- **Roteamento**: Sistema poderoso para definir rotas e responder a diferentes métodos HTTP (GET, POST, PUT, DELETE).


## O Papel do Servidor Web e do Banco de Dados
### Servidor Web (Express):

Gerencia Requisições e Respostas: O Express lida com as requisições HTTP recebidas dos clientes e envia respostas de volta. Isso inclui processar dados, aplicar lógica de negócios e comunicar-se com o banco de dados.

Roteamento: Define rotas (URLs) e métodos HTTP (GET, POST, PUT, DELETE) para determinar como o servidor deve responder a diferentes tipos de requisições.

### Banco de Dados:

Armazena Dados: O banco de dados armazena informações como usuários, produtos, pedidos, etc.

Executa Consultas: Responde a consultas enviadas pelo servidor, como recuperar, inserir, atualizar ou deletar dados.

## Por Que Iniciar o Servidor Express?

### Estabelecer Conexões com o Banco de Dados:
Quando você inicia o servidor Express, ele se conecta ao banco de dados para que possa executar operações, como consultas e atualizações, com base nas requisições dos clientes. A conexão ao banco de dados é estabelecida quando o servidor Express inicia e está preparado para processar requisições.

### Gerenciar Requisições e Operações de Banco de Dados:
Receber Requisições do Cliente: O servidor Express escuta requisições HTTP dos clientes. Por exemplo, um cliente pode enviar uma requisição POST para adicionar um novo usuário.
Interagir com o Banco de Dados: Quando o Express recebe uma requisição que requer manipulação de dados, ele executa as operações necessárias no banco de dados (como inserir um novo usuário ou buscar uma lista de usuários).
Enviar Respostas ao Cliente: Após processar a requisição e interagir com o banco de dados, o Express envia uma resposta ao cliente, como confirmar que um usuário foi adicionado com sucesso ou fornecer uma lista de usuários.

### Exemplo de Fluxo
Aqui está um exemplo simples para ilustrar como o servidor Express interage com o banco de dados:

Cliente Envia Requisição:
O cliente faz uma requisição HTTP POST para adicionar um novo usuário.

Servidor Express Recebe Requisição:
O Express recebe a requisição na rota configurada para lidar com adições de usuários.

Servidor Express Conecta ao Banco de Dados:
O Express usa a conexão ao banco de dados (configurada quando o servidor inicia) para executar uma consulta SQL que insere o novo usuário.

Banco de Dados Processa a Consulta:
O banco de dados executa a consulta e armazena os dados do novo usuário.

Servidor Express Envia Resposta:
Após a operação no banco de dados, o Express envia uma resposta ao cliente, confirmando que o usuário foi adicionado com sucesso.
