use empregados_ck;

select
	emp.nome as Empregados,
    emp.salario as Renda,
    (select count(*) from dependente where cod_emp = emp.cod_emp) as Dependentes
from
	empregado emp,
    dependente dep
where
	emp.cod_emp = dep.cod_emp
    group by emp.nome, emp.salario;
    
    
 
 select
	emp.cod_emp as Codigo,
    emp.nome as Nome_Empregado,
    emp.salario as Renda,
	case
		when (emp.salario <= 2112) then (emp.salario*0.0)
		when (emp.salario >= 2112.01 and emp.salario < 2826.66) then (emp.salario*0.075)
 		when (emp.salario >= 2826.66 and emp.salario < 3751.06) then (emp.salario*0.15)
 		when (emp.salario >= 3751.07 and emp.salario < 4664.68) then (emp.salario*0.225)
 		when (emp.salario > 4664.68) then (emp.salario*0.275)
    end as IRPF
from empregado emp;

/*Isento: Até R$ 2.112 por mês.
7,5%: De R$ 2.112,01 até R$ 2.826,66 por mês.
15%: De R$ 2.826,67 até R$ 3.751,06 por mês.
22,5%: De R$ 3.751,07 até R$ 4.664,68 por mês.
27,5%: Acima de R$ 4.664,68 por mês.*/



 select
	emp.cod_emp as Codigo,
    emp.nome as Nome_Empregado,
    emp.salario as Renda,
	case
		when (emp.salario <= 2112) then (emp.salario*0.0)
		when (emp.salario >= 2112.01 and emp.salario < 2826.66) then (emp.salario*0.075)
 		when (emp.salario >= 2826.66 and emp.salario < 3751.06) then (emp.salario*0.15)
 		when (emp.salario >= 3751.07 and emp.salario < 4664.68) then (emp.salario*0.225)
 		when (emp.salario > 4664.68) then (emp.salario*0.275)
    end as IRPF,
    case
		when (emp.salario <= 1412.00) then (emp.salario*0.075)
		when (emp.salario >= 1412.01 and emp.salario <= 2666.68) then (emp.salario*0.09)
 		when (emp.salario >= 2666.69 and emp.salario <= 4000.03) then (emp.salario*0.12)
 		when (emp.salario >= 4000.04 and emp.salario <= 7786.02) then (emp.salario*0.14)
        else 856.46
    end as INSS
from empregado emp

/*Até R$ 1.412,00	7,5%
De R$ 1.412,01 até R$ 2.666,68	9%
De R$ 2.666,69 até R$ 4.000,03	12%
De R$ 4.000,04 até R$ 7.786,02	14% */