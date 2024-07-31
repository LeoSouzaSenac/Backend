CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);


CREATE TABLE empregados (
    empregados_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);



INSERT INTO departamentos (nome) VALUES
('Vendas'),
('Marketing'),
('TI'),
('Recursos Humanos');

INSERT INTO empregados (nome, salario, departamento_id) VALUES
('Maicou Diécson', 5000.00, 1),
('Vandercleison', 6000.00, 1),
('Kerolaine', 4000.00, 2),
('Wanderneidson', 5500.00, 3),
('Kellen', 7000.00, 3),
('Chico', 3000.00, 4),
('Greice Kelly', 4500.00, 2),
('Xonas', 3500.00, 1);












Uma subconsulta é uma consulta interna colocada dentro de uma consulta externa. A subconsulta pode retornar um único valor, um conjunto de valores, ou uma tabela de resultados, dependendo de como é usada.




Tipos de Subconsultas


1. Subconsultas Escalares
Retornam um único valor.

Consulta para Encontrar Empregados com Salário Acima da Média


SELECT nome, salario
FROM empregados
WHERE salario > (SELECT AVG(salario) FROM empregados);

Neste exemplo, a subconsulta (SELECT AVG(salario) FROM empregados) calcula o salário médio, e a consulta externa seleciona empregados com salários acima da média.


ALTER TABLE departamentos ADD localizacao VARCHAR(50);



UPDATE departamentos SET localizacao = 'São Paulo' WHERE nome = 'Vendas';
UPDATE departamentos SET localizacao = 'Rio de Janeiro' WHERE nome = 'Marketing';
UPDATE departamentos SET localizacao = 'São Paulo' WHERE nome = 'TI';
UPDATE departamentos SET localizacao = 'Belo Horizonte' WHERE nome = 'Recursos Humanos';










2. Subconsultas de Coluna Única
Retornam um conjunto de valores de uma única coluna e são usadas com operadores como IN, ANY, ALL.


Exemplo com IN

SELECT nome
FROM empregados
WHERE departamento_id IN (SELECT departamento_id FROM departamentos WHERE localizacao = 'São Paulo');

Aqui, a subconsulta retorna todos os departamento_id de departamentos localizados em São Paulo, e a consulta externa retorna os nomes dos empregados que pertencem a esses departamentos.










Exemplo com ANY

Exemplo: Salário Maior que Qualquer Salário no Departamento de TI

SELECT nome, salario
FROM empregados
WHERE salario > ANY (SELECT salario FROM empregados WHERE departamento_id = (SELECT departamento_id FROM departamentos WHERE nome = 'TI'));

O operador ANY retorna verdadeiro se qualquer valor na subconsulta satisfizer a condição. Vamos supor que queremos encontrar empregados cujo salário é maior do que qualquer salário no departamento de TI.


A subconsulta (SELECT id FROM departamentos WHERE nome = 'TI') encontra o id do departamento de TI.

A subconsulta aninhada (SELECT salario FROM empregados WHERE departamento_id = (SELECT id FROM departamentos WHERE nome = 'TI')) retorna todos os salários dos empregados no departamento de TI.

O operador ANY compara o salário de cada empregado com qualquer um dos salários retornados pela subconsulta.















Exemplo com ALL
O operador ALL retorna verdadeiro se todos os valores na subconsulta satisfizerem a condição. Vamos supor que queremos encontrar empregados cujo salário é maior do que todos os salários no departamento de TI.

Exemplo: Salário Maior que Todos os Salários no Departamento de TI


SELECT nome, salario
FROM empregados
WHERE salario > ALL (SELECT salario FROM empregados WHERE departamento_id = (SELECT id FROM departamentos WHERE nome = 'TI'));



A subconsulta (SELECT id FROM departamentos WHERE nome = 'TI') encontra o id do departamento de TI.

A subconsulta aninhada (SELECT salario FROM empregados WHERE departamento_id = (SELECT id FROM departamentos WHERE nome = 'TI')) retorna todos os salários dos empregados no departamento de TI.

O operador ALL compara o salário de cada empregado com todos os salários retornados pela subconsulta, retornando apenas aqueles cujo salário é maior que todos os salários no departamento de TI.





ALTER TABLE empregados ADD titulo VARCHAR(50);

CREATE TABLE cargos (
    cargos_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    departamento_id INT,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);




UPDATE empregados SET titulo = 'Gerente' WHERE nome = 'Maicou Diécson';
UPDATE empregados SET titulo = 'Assistente' WHERE nome = 'Vandercleison';
UPDATE empregados SET titulo = 'Analista' WHERE nome = 'Kerolaine';
UPDATE empregados SET titulo = 'Desenvolvedor' WHERE nome = 'Wanderneidson';
UPDATE empregados SET titulo = 'Engenheiro' WHERE nome = 'Kellen';
UPDATE empregados SET titulo = 'Assistente' WHERE nome = 'Chico';
UPDATE empregados SET titulo = 'Analista' WHERE nome = 'Greice Kelly';
UPDATE empregados SET titulo = 'Estagiário' WHERE nome = 'Xonas';


INSERT INTO cargos (titulo, departamento_id, salario) VALUES
('Gerente', 1, 8000.00),
('Assistente', 1, 4000.00),
('Analista', 2, 4500.00),
('Desenvolvedor', 3, 6000.00),
('Engenheiro', 3, 7000.00),
('Assistente', 4, 3500.00),
('Analista', 2, 4600.00),
('Estagiário', 1, 2000.00);






3. Subconsultas de Múltiplas Colunas
Retornam múltiplas colunas e podem ser usadas para comparar conjuntos de colunas.

SELECT nome
FROM empregados
WHERE (departamento_id, titulo) IN (SELECT departamento_id, titulo FROM cargos WHERE salario > 5000);


Esta subconsulta retorna combinações de departamento_id e titulo de cargos com salário acima de 5000, e a consulta externa seleciona os nomes dos empregados que correspondem a essas combinações.
