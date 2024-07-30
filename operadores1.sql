Operador ON

O operador ON é usado em junções (JOINs) para especificar a condição na qual duas tabelas serão unidas. É essencial para realizar junções (JOIN).

Exemplo
Vamos supor que temos duas tabelas: empregados e departamentos.

SELECT empregados.nome, departamentos.nome
FROM empregados
INNER JOIN departamentos
ON empregados.departamento_id = departamentos.id;


Aqui, ON empregados.departamento_id = departamentos.id é a condição de junção que determina como as duas tabelas serão combinadas.


------------------------------------------------------------------------------


Operador IN
O operador IN é usado para especificar múltiplos valores em uma cláusula WHERE. Ele é útil para filtrar linhas com base em uma lista de valores.


SELECT coluna1, coluna2
FROM tabela
WHERE coluna1 IN (valor1, valor2, valor3);


SELECT nome, departamento
FROM empregados
WHERE departamento IN ('Vendas', 'Marketing', 'TI');

Este exemplo retorna os empregados que trabalham nos departamentos de Vendas, Marketing ou TI.


------------------------------------------------------------------------------



BETWEEN
O operador BETWEEN é usado para selecionar valores dentro de um intervalo.

SELECT nome, salario
FROM empregados
WHERE salario BETWEEN 3000 AND 5000;


------------------------------------------------------------------------------


LIKE
O operador LIKE é usado para procurar um padrão específico em uma coluna.

SELECT nome
FROM empregados
WHERE nome LIKE 'A%';


Este exemplo retorna empregados cujos nomes começam com a letra 'A'.



SELECT nome
FROM empregados
WHERE nome LIKE '%a';

Este exemplo retorna todos os nomes que terminam com a letra 'a'.



SELECT nome
FROM empregados
WHERE nome LIKE '%an%';

Este exemplo retorna todos os nomes que contêm a substring 'an'.


SELECT nome
FROM empregados
WHERE nome LIKE 'A___';

Este exemplo retorna todos os nomes que começam com 'A' e têm exatamente quatro caracteres.


SELECT nome
FROM empregados
WHERE nome LIKE '_a%';

Este exemplo retorna todos os nomes onde a segunda letra é 'a'.



SELECT nome
FROM empregados
WHERE nome LIKE '%a_r%';

Este exemplo retorna todos os nomes que contêm 'a' seguido por qualquer caractere e depois 'r'.




