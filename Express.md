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

## Exemplos Básicos

### Criando um Servidor Simples

```javascript
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello World!');
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
```

### Adicionando Middlewares

```javascript
app.use((req, res, next) => {
  console.log('Middleware executado');
  next();
});
```

### Definindo Rotas

```javascript
app.get('/usuarios', (req, res) => {
  res.send('Lista de usuários');
});

app.post('/usuarios', (req, res) => {
  res.send('Usuário adicionado');
});
```

## Conclusão

Express é uma ferramenta poderosa e flexível que facilita a criação de servidores web e APIs. Sua simplicidade e capacidade de expansão o tornam uma escolha popular entre desenvolvedores de Node.js.
