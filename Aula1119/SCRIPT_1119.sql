select
 emp.nome as empregado, 
 calcula_inss(emp.salario) as INSS, 
 calcula_irpf(emp.salario) as IRPF, 
 count(dep.cod_dep) as dependentes,
 format((count(dep.cod_dep)*2275.08) / 12,2) as abatimento_mes,
 format((emp.salario-(calcula_inss(emp.salario)+calcula_irpf(emp.salario)))+(count(dep.cod_dep)*2275.08) / 12,2) as renda_liquido 
from 
 dependente dep
 right join empregado emp
 on emp.cod_emp = dep.cod_emp
 group by
 emp.nome,
 emp.salario; 
 
 
 /*-----------------Gatilhos-----------------*/
DELIMITER $$
CREATE TRIGGER tg_remover_dependente
BEFORE DELETE ON empregado
FOR EACH ROW
BEGIN
    DELETE FROM dependente
    WHERE cod_emp = OLD.cod_emp;
END$$
DELIMITER ;

select * from empregado where cod_emp = 5;
select * from dependente where cod_emp = 5;

delete from empregado where cod_emp = 5;



-- Atividade
DELIMITER $$
CREATE TRIGGER tg_remover_empregado
BEFORE DELETE ON departamento
FOR EACH ROW
BEGIN
    DELETE FROM empregado
    WHERE cod_depto = OLD.cod_depto;
END$$
DELIMITER ;

select * from departamento;
select * from empregado where cod_depto = 3;
delete from departamento where cod_depto = 3;