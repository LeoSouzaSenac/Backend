# 📚 Exercício Clássico: Banco de Dados de uma Livraria

## 🎯 Objetivo
Criar e manipular um banco de dados de uma livraria, incluindo tabelas para autores, livros, clientes e empréstimos. 

## 📝 Passos

### 1. 🏗️ Criação do Banco de Dados
- Crie um banco de dados chamado `Livraria`.

<details>
<summary>💡 Dica: Como criar o banco de dados</summary>

```sql
CREATE DATABASE IF NOT EXISTS Livraria;
USE Livraria;
```
</details>

### 2. 🛠️ Criação das Tabelas
- Crie as tabelas `Autores`, `Livros`, `Clientes` e `Emprestimos`.

#### 📖 Tabela de Autores
- Crie a tabela `Autores` com os campos:
  - `AutorID` (inteiro, chave primária, autoincremento)
  - `Nome` (texto, não nulo)
  - `Nacionalidade` (texto)

<details>
<summary>💡 Dica: Como criar a tabela de autores</summary>

```sql
CREATE TABLE IF NOT EXISTS Autores (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);
```
</details>

#### 📚 Tabela de Livros
- Crie a tabela `Livros` com os campos:
  - `LivroID` (inteiro, chave primária, autoincremento)
  - `Titulo` (texto, não nulo)
  - `Genero` (texto)
  - `AnoPublicacao` (inteiro)
  - `AutorID` (inteiro, chave estrangeira referenciando `Autores`)

<details>
<summary>💡 Dica: Como criar a tabela de livros</summary>

```sql
CREATE TABLE IF NOT EXISTS Livros (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    Genero VARCHAR(50),
    AnoPublicacao INT,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);
```
</details>

#### 🧑‍🤝‍🧑 Tabela de Clientes
- Crie a tabela `Clientes` com os campos:
  - `ClienteID` (inteiro, chave primária, autoincremento)
  - `Nome` (texto, não nulo)
  - `Endereco` (texto)
  - `Telefone` (texto)

<details>
<summary>💡 Dica: Como criar a tabela de clientes</summary>

```sql
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15)
);
```
</details>

#### 📅 Tabela de Empréstimos
- Crie a tabela `Emprestimos` com os campos:
  - `EmprestimoID` (inteiro, chave primária, autoincremento)
  - `LivroID` (inteiro, chave estrangeira referenciando `Livros`)
  - `ClienteID` (inteiro, chave estrangeira referenciando `Clientes`)
  - `DataEmprestimo` (data)
  - `DataDevolucao` (data)

<details>
<summary>💡 Dica: Como criar a tabela de empréstimos</summary>

```sql
CREATE TABLE IF NOT EXISTS Emprestimos (
    EmprestimoID INT PRIMARY KEY AUTO_INCREMENT,
    LivroID INT,
    ClienteID INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
```
</details>

### 3. ✍️ Inserção de Dados
- Insira dados nas tabelas `Autores`, `Livros` e `Clientes`.

<details>
<summary>💡 Dica: Como inserir dados nas tabelas</summary>

```sql
INSERT IGNORE INTO Autores (AutorID, Nome, Nacionalidade) VALUES 
(1, 'J.K. Rowling', 'Britânica'),
(2, 'George Orwell', 'Britânico'),
(3, 'Gabriel Garcia Marquez', 'Colombiano');

INSERT IGNORE INTO Livros (LivroID, Titulo, Genero, AnoPublicacao, AutorID) VALUES 
(1, 'Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 1),
(2, '1984', 'Distopia', 1949, 2),
(3, 'Cem Anos de Solidão', 'Realismo Mágico', 1967, 3);

INSERT IGNORE INTO Clientes (ClienteID, Nome, Endereco, Telefone) VALUES 
(1, 'Ana Silva', 'Rua A, 123', '1111-1111'),
(2, 'Bruno Souza', 'Rua B, 456', '2222-2222'),
(3, 'Carlos Pereira', 'Rua C, 789', '3333-3333');
```
</details>

### 4. 🔄 Alteração das Tabelas
Adicione novas colunas às tabelas Autores, Livros, Clientes e Emprestimos.

#### 📖 Tabela de Autores
Adicione as colunas:
DataNascimento (data),
Biografia (texto)
<details>
<summary>💡 Dica: Como adicionar colunas à tabela de autores</summary>
sql
Copiar código
ALTER TABLE Autores
ADD COLUMN DataNascimento DATE,
ADD COLUMN Biografia TEXT;
</details>

#### 📚 Tabela de Livros
Adicione as colunas:
Editora (texto),
NumeroPaginas (inteiro),
Idioma (texto)
<details>
<summary>💡 Dica: Como adicionar colunas à tabela de livros</summary>
sql
Copiar código
ALTER TABLE Livros
ADD COLUMN Editora VARCHAR(100),
ADD COLUMN NumeroPaginas INT,
ADD COLUMN Idioma VARCHAR(50);
</details>

#### 🧑‍🤝‍🧑 Tabela de Clientes
Adicione as colunas:
Email (texto),
DataNascimento (data)
<details>
<summary>💡 Dica: Como adicionar colunas à tabela de clientes</summary>
sql
Copiar código
ALTER TABLE Clientes
ADD COLUMN Email VARCHAR(100),
ADD COLUMN DataNascimento DATE;
</details>

#### 📅 Tabela de Empréstimos
Adicione as colunas:
DataPrevistaDevolucao (data),
Status (texto)
<details>
<summary>💡 Dica: Como adicionar colunas à tabela de empréstimos</summary>
sql
Copiar código
ALTER TABLE Emprestimos
ADD COLUMN DataPrevistaDevolucao DATE,
ADD COLUMN Status VARCHAR(20);
</details>

### 5. ✍️ Inserção de Dados nas Novas Colunas
Atualize os dados existentes para incluir valores nas novas colunas.
<details>
<summary>💡 Dica: Como atualizar dados nas novas colunas</summary>
sql
Copiar código
UPDATE Autores
SET DataNascimento = '1965-07-31', Biografia = 'J.K. Rowling é uma escritora britânica, autora da série Harry Potter.'
WHERE AutorID = 1;

UPDATE Livros
SET Editora = 'Bloomsbury', NumeroPaginas = 223, Idioma = 'Inglês'
WHERE LivroID = 1;

UPDATE Clientes
SET Email = 'ana.silva@example.com', DataNascimento = '1980-01-15'
WHERE ClienteID = 1;

UPDATE Emprestimos
SET DataPrevistaDevolucao = '2023-07-15', Status = 'Em andamento'
WHERE EmprestimoID = 1;
</details>
