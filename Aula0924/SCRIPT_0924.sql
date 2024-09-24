use empregados_icoma;

select * from empregado;


create view vw_pagamento_setembro
as
select *,
	   (salario * 0.075) as INSS_F,
       (salario * 0.075) as INSS_E,
       (salario * 0.08) as FGTS,
       (salario / 12) as Decimo_E
from empregado;

select * from vw_pagamento_setembro;

select 
	*,
    format((FGTS + Decimo_E + INSS_E),2) as Deposito,
	format((salario - INSS_F),2) as Liquido
from vw_pagamento_setembro;

select 
	*,
    format((((salario - INSS_F) * 0.4) * 60) / 2.44,2) as Consignado
from vw_pagamento_setembro;
