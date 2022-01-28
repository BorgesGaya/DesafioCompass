Create Table fact_merchant_kpi(
		data date,
		id_merchant varchar(50),
		tpv float,
		qtd_transacoes integer
);

Create Table fact_customer_kpi(
		data date,
		id_customer varchar(50),
		tpv float,
		qtd_transacoes integer
);

Create Table dim_merchant_category (
		id_merchant varchar(50),			
		category varchar(50)
);
