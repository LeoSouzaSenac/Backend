# Criando e Testando uma API Simples com Node.js e XAMPP

## Configuração do Banco de Dados com XAMPP

### 1. Instalar e Configurar XAMPP
- Baixe e instale o XAMPP a partir de [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html).
- Inicie o Apache e o MySQL no painel de controle do XAMPP.

### 2. Criar o Banco de Dados e Tabela
- Acesse o phpMyAdmin via `http://localhost/phpmyadmin`.
- Crie um novo banco de dados chamado `meu_banco`.
- No banco de dados `meu_banco`, crie uma tabela `usuarios` com a seguinte estrutura:

```sql
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(100) NOT NULL
);
```

## Configuração do Servidor Node.js

### 1. Instalar Node.js
- Se ainda não tiver o Node.js instalado, baixe e instale a partir de [https://nodejs.org](https://nodejs.org).

### 2. Criar o Projeto Node.js
- Em um diretório separado do XAMPP (não dentro do `htdocs`), crie um novo diretório para o projeto e inicialize um projeto Node.js:

```bash
mkdir meu_projeto_node
cd meu_projeto_node
npm init -y
```

### 3. Instalar Dependências
- Instale `express`, `mysql2`, e `body-parser`:

```bash
npm install express mysql2 body-parser
```

### 4. Criar o Arquivo `server.js`
- No diretório do projeto, crie um arquivo chamado `server.js` e adicione o seguinte código para criar a API:

```javascript
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Senha padrão do XAMPP é vazia
  database: 'meu_banco'
});

// Conectar ao banco de dados
connection.connect(error => {
  if (error) {
    console.error('Erro ao conectar ao banco de dados: ' + error.stack);
    return;
  }
  console.log('Conectado ao banco de dados com ID ' + connection.threadId);
});

// Endpoint para adicionar um usuário (POST)
app.post('/usuarios', (req, res) => {
  const { nome, email, senha } = req.body;
  const sql = 'INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)';
  connection.query(sql, [nome, email, senha], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao adicionar usuário.');
      return;
    }
    res.status(201).send('Usuário adicionado com sucesso.');
  });
});

// Endpoint para obter todos os usuários (GET)
app.get('/usuarios', (req, res) => {
  connection.query('SELECT * FROM usuarios', (error, results) => {
    if (error) {
      res.status(500).send('Erro ao obter usuários.');
      return;
    }
    res.json(results);
  });
});

// Endpoint para obter um usuário por ID (GET)
app.get('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao obter usuário.');
      return;
    }
    res.json(results[0]);
  });
});

// Endpoint para atualizar um usuário (PUT)
app.put('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  const { nome, email, senha } = req.body;
  const sql = 'UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?';
  connection.query(sql, [nome, email, senha, id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao atualizar usuário.');
      return;
    }
    res.send('Usuário atualizado com sucesso.');
  });
});

// Endpoint para deletar um usuário (DELETE)
app.delete('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  connection.query('DELETE FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao deletar usuário.');
      return;
    }
    res.send('Usuário deletado com sucesso.');
  });
});

// Iniciar o servidor
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
```

### 5. Iniciar o Servidor Node.js
- No terminal, execute o servidor:

```bash
node server.js
```
- O servidor estará rodando em `http://localhost:3000`.

## Testar a API

### Usando Postman

#### 1. Adicionar um Usuário (POST)
- Abra o Postman.
- Selecione o método `POST`.
- No campo de URL, digite `http://localhost:3000/usuarios`.
- Vá até a aba `Body`, selecione `raw` e escolha `JSON` no menu suspenso.
- Adicione o seguinte JSON no corpo:

```json
{
  "nome": "João",
  "email": "joao@exemplo.com",
  "senha": "senha123"
}
```
- Clique no botão `Send`.

#### 2. Obter Todos os Usuários (GET)
- Selecione o método `GET`.
- No campo de URL, digite `http://localhost:3000/usuarios`.
- Clique no botão `Send`.

#### 3. Obter um Usuário por ID (GET)
- Selecione o método `GET`.
- No campo de URL, digite `http://localhost:3000/usuarios/1` (substitua `1` pelo ID do usuário que deseja buscar).
- Clique no botão `Send`.

#### 4. Atualizar um Usuário (PUT)
- Selecione o método `PUT`.
- No campo de URL, digite `http://localhost:3000/usuarios/1` (substitua `1` pelo ID do usuário que deseja atualizar).
- Vá até a aba `Body`, selecione `raw` e escolha `JSON` no menu suspenso.
- Adicione o seguinte JSON no corpo:

```json
{
  "nome": "João Atualizado",
  "email": "joao.atualizado@exemplo.com",
  "senha": "novaSenha123"
}
```
- Clique no botão `Send`.

#### 5. Deletar um Usuário (DELETE)
- Selecione o método `DELETE`.
- No campo de URL, digite `http://localhost:3000/usuarios/1` (substitua `1` pelo ID do usuário que deseja deletar).
- Clique no botão `Send`.



### Conclusão
Esses métodos permitirão que você teste a API que configurou. Usar Postman é muito útil para visualizar as respostas e fazer testes de forma mais interativa, enquanto `curl` é uma ferramenta poderosa para fazer requisições HTTP diretamente do terminal.
