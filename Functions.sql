Procedimentos são usados para realizar ações que alteram o banco de dados, como inserções, atualizações e exclusões.
Uso: Para modificar dados (como UPDATE), executar operações complexas, ou realizar tarefas administrativas.



Funções retornam um único valor. São usadas dentro de consultas. Não modificam o estado do banco diretamente.
Uso: Em consultas SELECT, WHERE, HAVING, etc.



use empresa;

DELIMITER //
CREATE FUNCTION CalcularSalarioBruto(
    emp_id INT
)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE salario1 DECIMAL(10,2);

    -- Obtém o salário do cargo do empregado com o ID fornecido
    SELECT cargos.salario 
    INTO salario1
    FROM empregados
    JOIN cargos ON empregados.titulo = cargos.titulo AND empregados.departamento_id = cargos.departamento_id
    WHERE empregados.empregados_id = emp_id;

    -- Retorna o salário
    RETURN salario1;
END //
DELIMITER ;



SELECT nome, CalcularSalarioBruto(empregados_id) AS salario_bruto
FROM empregados
WHERE empregados_id = 1;




Exercício 1: Função para Calcular Salário Anual
Crie uma função que, dado o ID de um cargo, retorne o salário anual correspondente ao cargo.

Exercício 2: Função para Contar Empregados por Departamento
Crie uma função que, dado o ID de um departamento, retorne o número de empregados que trabalham nesse departamento.

Exercício 3: Função para Obter Nome do Departamento
Crie uma função que, dado o ID de um departamento, retorne o nome do departamento.

Exercício 4: Função para Obter Título do Empregado
Crie uma função que, dado o ID de um empregado, retorne o título do cargo desse empregado.

Exercício 5: Função para Calcular Salário Total de um Departamento
Crie uma função que, dado o ID de um departamento, retorne o salário total de todos os empregados desse departamento.

