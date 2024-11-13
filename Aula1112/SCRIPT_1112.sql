delimiter / / 

create function calcula_salario(
	renda decimal(10, 2),
	irpf double,
	inss double,
	filhos int
) returns decimal(10, 2) 
deterministic 
begin 
declare liquido decimal(10, 2);

declare abatimento decimal(10, 2);

declare desconto decimal(10, 2);

set
	abatimento = (2275.08 * filhos) / 13;

set
	desconto =((renda * irpf) +(renda * inss)) - abatimento;

set
	liquido =(renda - desconto);

return liquido;

end / /
select
	emp.nome as empregado,
	emp.salario as renda,
	count(dep.cod_dep) as dependentes,
	case
		when (emp.salario <= 2259.2) then 0
		when (
			emp.salario >= 2259.21
			and emp.salario < 2826.55
		) then 0.075
		when (
			emp.salario >= 2826.56
			and emp.salario < 3751.05
		) then 0.15
		when (
			emp.salario >= 3751.06
			and emp.salario < 4664.68
		) then 0.225
		else 0.275
	end as irpf,
	case
		when (emp.salario <= 1412) then 0.075
		when (
			emp.salario >= 1412.01
			and emp.salario < 2666.68
		) then 0.09
		when (
			emp.salario >= 2666.69
			and emp.salario < 4000.03
		) then 0.12
		when (
			emp.salario >= 4000.04
			and emp.salario < 7786.02
		) then 0.14
		else 0.14
	end as inss;
from
	empregado emp,
	ependente dep
where
	emp.cod_emp = dep.cod_emp
group by
	emp.nome,
	emp.salario;
