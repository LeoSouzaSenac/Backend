# O Que é o Express?

## Introdução

Express é um framework web minimalista e flexível para Node.js. Ele facilita a criação de servidores web e APIs, oferecendo uma estrutura leve que pode ser expandida conforme necessário.

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
