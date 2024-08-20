select * from departamento where nome like "%a%";
select count(cod_depto) as departamento from departamento;

-- Meu
select departamento.nome Departamento, empregado.nome Nome from empregado, departamento 
where departamento.cod_depto = empregado.cod_depto;

-- Prof
select
 emp.nome as Empregado,
 depto.nome as Departamento 
from 
 empregado emp, 
 departamento depto 
where 
 depto.cod_depto=emp.cod_depto;
 
-- Meu
select
 nome as Empregado,
 dt_admissao as Admissão,
 dt_nascimento as Nascimento,
 year(now()) - year(dt_nascimento) as Idade,
 year(now()) - year(dt_admissao) as "Tempo de Serviço"
from 
 empregado;
 
-- Meu / Prof
select
 nome as Empregado,
 format((datediff(now(), dt_nascimento) / 365),0) as Idade,
 format((datediff(now(), dt_admissao) / 365),0) as Admissão,
 dt_admissao as Admissão,
 date_format(date_sub(dt_admissao, interval 1 month), concat(year(now()),"- %m-%d")) as "1 Mês Antes"
from 
 empregado;

-- Prof
 SELECT
    nome AS Empregado,
    FORMAT((DATEDIFF(NOW(), dt_nascimento) / 365), 0) AS idade,
    FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0) AS tempo_empresa,
    DATE_FORMAT(DATE_SUB(dt_admissao, INTERVAL 1 MONTH), CONCAT(YEAR(CURDATE()), "/%m/%d")) AS ferias
FROM
    empregado;