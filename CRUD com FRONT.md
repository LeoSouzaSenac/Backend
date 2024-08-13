# Projeto de Gerenciamento de Usuários

Este projeto é uma aplicação simples de gerenciamento de usuários que faz o CRUD (Create, Read, Update e Delete) completo, 
com funcionalidades para adicionar, listar e deletar usuários. 
Ele usa uma combinação de HTML, CSS, JavaScript e um backend em Node.js com Express e MySQL.
Você também deve iniciar o servidor Apache e o MySQL no XAMPP. Lembre-se de configurar o arquivo server.js para conectar com o *seu servidor*.

## Estrutura do Projeto

O projeto é composto por quatro arquivos principais:

1. `index.html` - Página principal da aplicação
2. `style.css` - Folha de estilo para a aplicação (o visual)
3. `script.js` - Código JavaScript para interações com o backend
4. `server.js` - Servidor Node.js com Express para manipulação de dados

## Requisitos

- Node.js e npm (Node Package Manager)
- MySQL

## Configuração do Ambiente

1. **Instalação das Dependências**

   Primeiro, você precisa instalar as dependências do projeto. Navegue até o diretório do projeto e execute:

   ```bash
   npm install express mysql2 body-parser cors
   ```

2. **Configuração do Banco de Dados**

   Crie um banco de dados MySQL com o nome de sua escolha (lembre de alterar no arquivo server.js) e uma tabela `usuarios` com a seguinte estrutura:

   ```sql
   CREATE TABLE usuarios (
       id INT AUTO_INCREMENT PRIMARY KEY,
       nome VARCHAR(255) NOT NULL,
       email VARCHAR(255) NOT NULL UNIQUE,
       senha VARCHAR(255) NOT NULL
   );
   ```

3. **Executando o Servidor**

   Para iniciar o servidor, execute:

   ```bash
   node server.js
   ```

   O servidor estará disponível em `http://localhost:3000`.

4. **Abrindo a Aplicação**

   Abra o arquivo `index.html` em um navegador para visualizar e interagir com a aplicação.

## Explicação dos Arquivos

### `index.html`

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usuários</title>
    <link rel="stylesheet" href="style.css"> <!-- Link para a folha de estilos CSS -->
</head>
<body>
    <h1>Gerenciamento de Usuários</h1> <!-- Título do projeto -->
    <h2>Adicionar Usuário</h2> <!-- Subtítulo -->

    <input type="text" id="nome" placeholder="Nome"> <!-- Campo de entrada para o nome do usuário -->
    <input type="email" id="email" placeholder="Email"> <!-- Campo de entrada para o email do usuário -->
    <input type="password" id="senha" placeholder="Senha"> <!-- Campo de entrada para a senha do usuário -->

    <button onclick="adicionarUsuario()">Adicionar</button> <!-- Botão para adicionar o usuário, que chama uma função que adiciona o usuário -->

    <h2>Lista de Usuários</h2>
    <button onclick="obterUsuarios()">Atualizar Lista</button> <!-- Botão para atualizar a lista de usuários, que chama uma função que atualiza a lista -->
    <ul id="usuarios"></ul> <!-- Lista para exibir os usuários -->
    
    <script src="script.js"></script> <!-- Link para o arquivo JavaScript -->
</body>
</html>
```

### `style.css`

```css
body {
    font-family: Arial, sans-serif; /* Define a fonte da página */
    margin: 0; /* Remove as margens da página */
    padding: 20px; /* Adiciona uma margem interna de 20px */
    background-color: #f4f4f4; /* Define a cor de fundo da página */
}

h1, h2 {
    color: #333; /* Define a cor dos títulos */
}

input {
    width: 100%; /* Define a largura dos campos de entrada */
    margin: 10px; /* Adiciona uma margem externa de 10px */
    padding: 10px; /* Adiciona uma margem interna de 10px */
    font-size: 16px; /* Define o tamanho da fonte dos campos de entrada */
}

button {
    padding: 10px 20px; /* Define a margem interna dos botões */
    background-color: #007BFF; /* Define a cor de fundo dos botões */
    color: white; /* Define a cor do texto dos botões */
    border: none; /* Remove a borda dos botões */
    border-radius: 5px; /* Adiciona bordas arredondadas aos botões */
    cursor: pointer; /* Altera o cursor para pointer ao passar sobre o botão */
}

button:hover {
    background-color: #0056b3; /* Altera a cor de fundo dos botões ao passar o mouse sobre eles */
}

ul {
    list-style-type: none; /* Remove os marcadores das listas */
    padding: 0; /* Remove a margem interna da lista */
}

li {
    padding: 10px; /* Adiciona uma margem interna aos itens da lista */
    border-bottom: 1px solid #ddd; /* Adiciona uma borda inferior aos itens da lista */
    display: flex; /* Usa flexbox para alinhar os itens */
    justify-content: space-between; /* Alinha o conteúdo dos itens da lista */
}

li:last-child {
    border-bottom: none; /* Remove a borda inferior do último item da lista */
}

li button {
    background-color: red; /* Define a cor de fundo dos botões de deletar */
    padding: 5px 10px; /* Define a margem interna dos botões de deletar */
}
```

### `script.js`

```javascript
const API_URL = 'http://localhost:3000/usuarios'; // URL da API para a gestão dos usuários

// Função para adicionar um usuário
function adicionarUsuario() {
    const nome = document.getElementById('nome').value; // Obtém o valor do campo de nome de acordo com o ID que definimos em Index.html
    const email = document.getElementById('email').value; // Obtém o valor do campo de email de acordo com o ID que definimos em Index.html****
    const senha = document.getElementById('senha').value; // Obtém o valor do campo de senha de acordo com o ID que definimos em Index.html

    fetch(API_URL, {
        method: 'POST', // Método HTTP para adicionar dados
        headers: {
            'Content-Type': 'application/json' // Define o tipo de conteúdo como JSON
        },
        body: JSON.stringify({ nome, email, senha }) // Converte os dados para JSON
    })
    .then(response => response.text()) // Converte a resposta para texto
    .then(data => {
        alert(data); // Exibe uma mensagem de alerta com a resposta
        limparFormulario(); // Limpa os campos do formulário
        obterUsuarios(); // Atualiza a lista de usuários
    })
    .catch(error => console.error('Erro:', error)); // Captura e exibe erros
}

// Função para obter todos os usuários
function obterUsuarios() {
    fetch(API_URL) // Faz uma requisição GET para a API
    .then(response => response.json()) // Converte a resposta para JSON
    .then(data => {
        const listaUsuarios = document.getElementById('usuarios'); // Obtém o elemento da lista de usuários
        listaUsuarios.innerHTML = ''; // Limpa o conteúdo da lista
        data.forEach(usuario => { // Itera sobre cada usuário
            const li = document.createElement('li'); // Cria um novo elemento de lista
            li.innerHTML = `${usuario.nome} - ${usuario.email} <button onclick="deletarUsuario(${usuario.id})">Deletar</button>`; // Define o conteúdo HTML do item da lista
            listaUsuarios.appendChild(li); // Adiciona o item à lista
        });
    })
    .catch(error => console.error('Erro:', error)); // Captura e exibe erros
}

// Função para deletar um usuário
function deletarUsuario(id) {
    fetch(`${API_URL}/${id}`, {
        method: 'DELETE' // Método HTTP para deletar dados
    })
    .then(response => response.text()) // Converte a resposta para texto
    .then(data => {
        alert(data); // Exibe uma mensagem de alerta com a resposta
        obterUsuarios(); // Atualiza a lista de usuários
    })
    .catch(error => console.error('Erro:', error)); // Captura e exibe erros
}

// Função para limpar o formulário
function limparFormulario() {
    document.getElementById('nome').value = ''; // Limpa o campo de nome
    document.getElementById('email').value = ''; // Limpa o campo de email
    document.getElementById('senha').value = ''; // Limpa o campo de senha
}

// Carregar os usuários ao carregar a página
window.onload = obterUsuarios; // Define a função a ser chamada quando a página for carregada
```

### `server.js`

```javascript
const express = require('express'); // Importa o pacote Express
const mysql = require('mysql2'); // Importa o pacote MySQL2
const bodyParser = require('body-parser'); // Importa o pacote Body-Parser
const cors = require('cors'); // Importa o pacote CORS

const app = express(); // Cria uma nova aplicação Express
app.use(bodyParser.json()); // Usa o Body-Parser para lidar com dados JSON
app.use(cors()); // Usa o CORS para permitir requisições de outras origens

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost', // Endereço do servidor MySQL -- Se está no mesmo computador/servidor que este código, então é localhost. Se está em um servidor remoto, você deve inserir o IP do servidor.
  user: 'root' // Nome de usuário do MySQL
  password: '', // Senha do MySQL (vazia para configuração padrão do XAMPP)
  database: 'leo' // Nome do banco de dados
});

// Conectar ao banco de dados
connection.connect(error => {
  if (error) {
    console.error('Erro ao conectar ao banco de dados: ' + error.stack); // Exibe um erro se a conexão falhar
    return;
  }
  console.log('Conectado ao banco de dados com ID ' + connection.threadId); // Confirma a conexão bem-sucedida
});

// Endpoint para adicionar um usuário (POST)
app.post('/usuarios', (req, res) => {
  const { nome, email, senha } = req.body; // Obtém os dados do usuário do corpo da requisição
  const sql = 'INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)'; // SQL para inserir um novo usuário
  connection.query(sql, [nome, email, senha], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao adicionar usuário.'); // Responde com um erro se a inserção falhar
      return;
    }
    res.status(201).send('Usuário adicionado com sucesso.'); // Responde com sucesso se a inserção for bem-sucedida
  });
});

// Endpoint para obter todos os usuários (GET)
app.get('/usuarios', (req, res) => {
  connection.query('SELECT * FROM usuarios', (error, results) => {
    if (error) {
      res.status(500).send('Erro ao obter usuários.'); // Responde com um erro se a consulta falhar
      return;
    }
    res.json(results); // Responde com os resultados da consulta em formato JSON
  });
});

// Endpoint para obter um usuário por ID (GET)
app.get('/usuarios/:id', (req, res) => {
  const { id } = req.params; // Obtém o ID do usuário dos parâmetros da URL
  connection.query('SELECT * FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao obter usuário.'); // Responde com um erro se a consulta falhar
      return;
    }
    res.json(results[0]); // Responde com o usuário encontrado em formato JSON
  });
});

// Endpoint para atualizar um usuário (PUT)
app.put('/usuarios/:id', (req, res) => {
  const { id } = req.params; // Obtém o ID do usuário dos parâmetros da URL
  const { nome, email, senha } = req.body; // Obtém os novos dados do usuário do corpo da requisição
  const sql = 'UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?'; // SQL para atualizar um usuário
  connection.query(sql, [nome, email, senha, id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao atualizar usuário.'); // Responde com um erro se a atualização falhar
      return;
    }
    res.send('Usuário atualizado com sucesso.'); // Responde com sucesso se a atualização for bem-sucedida
  });
});

// Endpoint para deletar um usuário (DELETE)
app.delete('/usuarios/:id', (req, res) => {
  const { id } = req.params; // Obtém o ID do usuário dos parâmetros da URL
  connection.query('DELETE FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) {
      res.status(500).send('Erro ao deletar usuário.'); // Responde com um erro se a deleção falhar
      return;
    }
    res.send('Usuário deletado com sucesso.'); // Responde com sucesso se a deleção for bem-sucedida
  });
});

// Iniciar o servidor
const PORT = 3000; // Define a porta em que o servidor será executado
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`); // Confirma que o servidor está rodando
});
```

## Resumo

Este projeto é uma aplicação de gerenciamento de usuários com um frontend em HTML/CSS/JavaScript e um backend em Node.js usando Express e MySQL. Ele permite adicionar, listar e deletar usuários com uma interface simples. Certifique-se de que o servidor Node.js está rodando e que o banco de dados MySQL está configurado corretamente para que a aplicação funcione sem problemas.

Caso tenha dúvidas ou problemas, verifique os logs do console para mensagens de erro e consulte a documentação das tecnologias utilizadas.
