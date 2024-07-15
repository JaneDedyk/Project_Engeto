

-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	ROUND(avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2006
										AND industry_branch_code = 'A'
										AND category_name IN ('Mléko polotučné pasterované')), 0) AS avg_amount_of_milk_can_be_bought_in_year_2006
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2006;


SELECT 
	ROUND(avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2006
										AND industry_branch_code = 'A'
										AND category_name IN ('Chléb konzumní kmínový')), 0) AS avg_amount_of_bread_can_be_bought_in_year_2006
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2006;



SELECT 
	ROUND(avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2018
										AND industry_branch_code = 'A'
										AND category_name IN ('Mléko polotučné pasterované')), 0) AS avg_amount_of_milk_can_be_bought_in_year_2018
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2018;


SELECT 
	ROUND(avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2018
										AND industry_branch_code = 'A'
										AND category_name IN ('Chléb konzumní kmínový')), 0) AS avg_amount_of_bread_can_be_bought_in_year_2018
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2018;