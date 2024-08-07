# O Que São Rotas em Express?

## Introdução

No contexto de desenvolvimento web com Express (um framework para Node.js), rotas são regras que definem como o servidor responde a diferentes requisições feitas pelo cliente. Uma rota em Express é composta por um **caminho** e um **método HTTP**. 

### Caminho (Path)

O caminho é a parte da URL que vem após o domínio. Por exemplo, em `https://meusite.com/usuarios`, o caminho é `/usuarios`. O 'nome' do caminho é escolhido por você.

### Métodos HTTP

Os métodos HTTP são ações específicas que indicam o que queremos fazer com um recurso. Alguns dos métodos HTTP mais comuns são:

- `GET`: Usado para ler dados.
- `POST`: Usado para criar novos dados.
- `PUT`: Usado para atualizar dados existentes.
- `DELETE`: Usado para deletar dados.

## Como Funcionam as Rotas em Express?

Quando uma requisição é feita a um servidor Express, ele verifica suas rotas configuradas para determinar como lidar com essa requisição. Cada rota é associada a uma função que é executada quando a rota é "acessada".

### Sintaxe Básica

```javascript
app.metodoHTTP(caminho, funçãoCallback);
```

- `app`: O objeto Express.
- `metodoHTTP`: O método HTTP (como `get`, `post`, `put`, `delete`).
- `caminho`: A parte da URL após o domínio.
- `funçãoCallback`: A função que será executada quando a rota for acessada.

## Exemplos Práticos

### Adicionar um Usuário (POST)

```javascript
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
```

- **Rota**: `/usuarios`
- **Método HTTP**: `POST`
- **Descrição**: Adiciona um novo usuário ao banco de dados.
- **Função Callback**: Recebe os dados do usuário (nome, email, senha) do corpo da requisição e os insere na tabela `usuarios` do banco de dados. Retorna uma mensagem de sucesso ou erro.

### Obter Todos os Usuários (GET)

```javascript
app.get('/usuarios', (req, res) => {
  connection.query('SELECT * FROM usuarios', (error, results) => {
    if (error) {
      res.status(500).send('Erro ao obter usuários.');
      return;
    }
    res.json(results);
  });
});
```

- **Rota**: `/usuarios`
- **Método HTTP**: `GET`
- **Descrição**: Retorna todos os usuários do banco de dados.
- **Função Callback**: Executa um comando SQL para selecionar todos os usuários da tabela `usuarios` e envia o resultado como uma resposta JSON.

### Obter um Usuário por ID (GET)

```javascript
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
```

- **Rota**: `/usuarios/:id`
- **Método HTTP**: `GET`
- **Descrição**: Retorna um usuário específico baseado no ID fornecido.
- **Função Callback**: Recebe o `id` dos parâmetros da URL, executa um comando SQL para selecionar o usuário correspondente na tabela `usuarios` e envia o resultado como uma resposta JSON.

### Atualizar um Usuário (PUT)

```javascript
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
```

- **Rota**: `/usuarios/:id`
- **Método HTTP**: `PUT`
- **Descrição**: Atualiza os dados de um usuário específico baseado no ID fornecido.
- **Função Callback**: Recebe o `id` dos parâmetros da URL e os novos dados do usuário do corpo da requisição, executa um comando SQL para atualizar o usuário na tabela `usuarios` e envia uma mensagem de sucesso ou erro.

### Deletar um Usuário (DELETE)

```javascript
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
```

- **Rota**: `/usuarios/:id`
- **Método HTTP**: `DELETE`
- **Descrição**: Deleta um usuário específico baseado no ID fornecido.
- **Função Callback**: Recebe o `id` dos parâmetros da URL, executa um comando SQL para deletar o usuário correspondente na tabela `usuarios` e envia uma mensagem de sucesso ou erro.

## Conclusão

Rotas são fundamentais para definir como o servidor responde a diferentes requisições HTTP. Elas especificam o caminho e o método HTTP, e estão associadas a funções que determinam a lógica a ser executada quando a rota é acessada. No seu código, configuramos várias rotas para realizar operações CRUD em uma tabela de usuários, cada uma com sua lógica específica.
