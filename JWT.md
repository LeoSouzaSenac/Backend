# Guia de Uso de JSON Web Token (JWT) em Aplicações Node.js

Este guia ensina como implementar a autenticação com JSON Web Token (JWT) em uma aplicação Node.js usando o framework Express. 
O exemplo inclui:

- Geração de um token JWT após o login
- Proteção de rotas usando middleware de verificação do token
- Acesso ao ID do usuário armazenado no token JWT

## 1. Instalação das Dependências

Primeiro, crie um novo projeto Node.js e instale as dependências necessárias:

```bash
mkdir jwt-example
cd jwt-example
npm init -y
npm install express jsonwebtoken body-parser
```

Aqui, estamos instalando:

- **express**: Framework de aplicação web para Node.js.
- **jsonwebtoken**: Biblioteca para gerar e verificar tokens JWT.
- **body-parser**: Middleware para processar corpos de requisições HTTP.

## 2. Criando o Servidor Express

Crie um arquivo `server.js` e adicione o código para configurar o servidor Express:

```javascript
const express = require('express');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');

const app = express();
const SECRET_KEY = 'your_secret_key';

app.use(bodyParser.json());

// Simulando um banco de dados para login
const users = [
  { id: 1, username: 'user1', password: 'password1' },
  { id: 2, username: 'user2', password: 'password2' }
];
```

## 3. Rota de Login com Geração de JWT

Agora, crie uma rota de login que gere um token JWT ao validar as credenciais do usuário:

```javascript
// Rota de login
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Verifica se o usuário existe e a senha está correta
  const user = users.find(u => u.username === username && u.password === password);
  
  if (user) {
    // Gerando o token JWT com o ID e o username do usuário no payload
    const token = jwt.sign({ id: user.id, username: user.username }, SECRET_KEY, {
      expiresIn: '1h' // Token válido por 1 hora
    });

    // Retorna o token ao cliente
    res.json({ token });
  } else {
    res.status(401).json({ message: 'Username or password incorrect' });
  }
});
```

### Explicação:
- **jwt.sign**: Gera um token assinado com a chave secreta (`SECRET_KEY`). O token contém o ID e o username do usuário no payload e é configurado para expirar em 1 hora.

## 4. Middleware para Verificação do Token

Em seguida, crie um middleware para proteger rotas e garantir que o usuário está autenticado:

```javascript
// Middleware para verificar o token
function authenticateToken(req, res, next) {
  const token = req.header('Authorization')?.split(' ')[1];
  
  if (!token) return res.sendStatus(401); // Sem token, acesso negado

  // Verifica se o token é válido
  jwt.verify(token, SECRET_KEY, (err, user) => {
    if (err) return res.sendStatus(403); // Token inválido ou expirado

    req.user = user; // Armazena o payload do token (ID e username)
    next();
  });
}
```

### Explicação:
- **req.header('Authorization')**: O token é extraído do cabeçalho de autorização no formato `Bearer <token>`.
- **jwt.verify**: Verifica se o token é válido e não expirou. Se for válido, o payload (contendo o ID e o username) é armazenado em `req.user`.

## 5. Rota Protegida

Finalmente, crie uma rota protegida que apenas usuários autenticados podem acessar:

```javascript
// Rota protegida que requer autenticação
app.get('/protected', authenticateToken, (req, res) => {
  // Acessa o ID do usuário a partir do req.user
  const userId = req.user.id;
  res.json({ message: `Hello, user with ID: ${userId}` });
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});
```

### Explicação:
- **authenticateToken**: Middleware aplicado à rota para verificar o token antes de permitir o acesso.
- **req.user.id**: Acessa o ID do usuário autenticado, que foi armazenado no token JWT.

## 6. Testando a Aplicação

1. **Inicie o servidor**: 
   ```bash
   node server.js
   ```

2. **Faça login**: Envie uma requisição `POST` para `/login` com as credenciais de usuário:

   **Exemplo de requisição:**
   ```bash
   curl -X POST http://localhost:3000/login -H "Content-Type: application/json" -d '{"username":"user1","password":"password1"}'
   ```

   **Resposta esperada:**
   ```json
   {
     "token": "<token JWT aqui>"
   }
   ```

3. **Acesse a rota protegida**: Envie uma requisição `GET` para `/protected` com o token recebido no cabeçalho `Authorization`:

   **Exemplo de requisição:**
   ```bash
   curl -X GET http://localhost:3000/protected -H "Authorization: Bearer <token JWT aqui>"
   ```

   **Resposta esperada:**
   ```json
   {
     "message": "Hello, user with ID: 1"
   }
   ```

## Conclusão

Este guia mostrou como implementar autenticação usando JWT em uma aplicação Node.js com Express. Você aprendeu a gerar tokens JWT após o login, proteger rotas usando middleware, e acessar o ID do usuário autenticado. Este é um ponto de partida para implementar autenticação em aplicações maiores e mais complexas.
