--Criar ID único incremental para cada transação

	alter table transactions add column ID serial NOT NULL;
	
	ALTER TABLE transactions ADD PRIMARY KEY ("id");
	
--Transformar coluna Age em inteiro

	update transactions set age = NULL where id in(  
		select id from transactions where (age ~* '[0-9]') is false);
		
	ALTER TABLE transactions ALTER COLUMN age TYPE integer USING age::integer;
	
--Deixar coluna Gender apenas com M e F

	update transactions set gender = NULL where id not in(select id from transactions where (gender = 'F') or (gender = 'M'));
    
--Deixar NULL onde coluna Amount for zero

	update transactions set amount = NULL where id in(
		select id from transactions where amount = 0);
		
--	Criar coluna mês: 
--        step 0 a 30 = 1
--        step 31 a 60 = 2
--        step 61 a 90 = 3
--        step 91 a 120 = 4
--        step 121 a 150 = 5
--        step 151 a 180 = 6

	alter table transactions add column mes int;
	update transactions set mes = (
		CASE 
			WHEN step BETWEEN 0 AND 30 THEN 1
			WHEN step BETWEEN 31 AND 60 THEN 2
			WHEN step BETWEEN 61 AND 90 THEN 3
			WHEN step BETWEEN 91 AND 120 THEN 4
			WHEN step BETWEEN 121 AND 150 THEN 5
			ELSE 6
		END);

--Criar coluna ano: 2021

	alter table transactions add column ano int;
	
	update transactions set ano = 2021;
	
--Criar coluna data: sempre dia 1

	alter table transactions add column data date;
	
	update transactions SET data = make_date(ano, mes, 1);









