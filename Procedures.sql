Procedimentos Armazenados

Procedimentos Armazenados são conjuntos de comandos SQL que podem ser executados como uma única unidade. Eles permitem encapsular a lógica de negócios no banco de dados e são úteis para tarefas repetitivas.



Sintaxe:

DELIMITER //

CREATE PROCEDURE procedure_name (parameters)
BEGIN
    -- Comandos
END //

DELIMITER ;


DELIMITER: Define um delimitador alternativo para que o MySQL reconheça o fim do procedimento.
CREATE PROCEDURE: Cria o procedimento.
procedure_name: Nome do procedimento.
parameters: Parâmetros de entrada (IN), saída (OUT) ou ambos (INOUT).
BEGIN ... END: Delimita o bloco de comandos SQL.


Exemplo: Aumentar o salário dos empregados de um determinado departamento.

Este comando chama o procedimento e aumenta os salários em 10% para todos os empregados no departamento com departamento_id = 1.


DELIMITER //

CREATE PROCEDURE AumentarSalario(
    IN dep_id INT,
    IN percentual DECIMAL(5,2)
)
BEGIN
    UPDATE cargos 
    SET salario = salario + (salario * (percentual / 100))
    WHERE departamento_id = dep_id;
END //

DELIMITER ;


Uso do Procedimento:

CALL AumentarSalario(1, 10);

Para ver o procedimento:
SHOW CREATE PROCEDURE AumentarSalario;
