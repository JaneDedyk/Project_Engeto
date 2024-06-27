

-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2006
										AND industry_branch_code = 'A'
										AND category_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')) AS avg_amount_of_milk_and_bread_can_be_buy_in_year_2006
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2006;



SELECT 
	avg(avg_payroll_for_year) / (SELECT
										sum(avg_price_for_year) 
									FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
									WHERE particular_year = 2018
										AND industry_branch_code = 'A'
										AND category_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')) AS avg_amount_of_milk_and_bread_can_be_buy_in_year_2018
FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
WHERE payroll_year = 2018;