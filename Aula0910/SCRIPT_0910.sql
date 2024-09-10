select * from empregado;
select * from departamento;
select * from dependente;

/*Query com chaves Estrangeiras*/
select 
	e.nome as empregado,
    d.nome as dependente
from
	empregado e,
    dependente d
where 
	e.cod_emp = d.cod_emp;
    
/*Query com SubQuery*/
select 
	d.*,
    e.nome as empregado,
    (format((datediff(now(), e.dt_nascimento) / 365), 0)) as idade,
    (format((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa
from
	dependente d,
    empregado e
where
	d.cod_emp in(
		select cod_emp from empregado where (format((datediff(now(), dt_admissao) / 365), 0) < 22)
	)
and
	e.cod_emp = d.cod_emp;
    

/*View com uso de MySQL*/    
select cod_depto from departamento;

select cod_emp from empregado where cod_depto = 3;

create view vw_bonus_desenvolvimento
as
select
	d.*,
    (format((datediff(now(), d.dt_nascimento) / 365), 0)) as idade,
    e.nome as empregado,
	(format((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa,
    (e.salario * 0.15) as bonus_dependente,
    "Desenvolvimento" as departamento    
from
	dependente d,
    empregado e
where
	d.cod_emp in (
		select cod_emp from empregado where cod_depto = 3
    )
and
	e.cod_emp = d.cod_emp;

select * from vw_bonus_desenvolvimento;

/*Exercicio (Faça uma Query com uso de SubQuery)*/