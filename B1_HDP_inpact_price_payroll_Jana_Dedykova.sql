
/*
 * Má výška HDP vliv na změny ve mzdách a cenách potravin?
 * Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 */

SELECT *,
	CASE
		WHEN (percentage_HDP_change < 0 AND percentage_payroll_change < 0) THEN 'Correlation - decline'
		WHEN (percentage_HDP_change >= 0 AND percentage_payroll_change >= 0) THEN 'Correlation -  growth'
		ELSE 'NO CORRELATION'
	END AS impact_of_HDP_on_payroll,
	CASE 
		WHEN (percentage_HDP_change < 0 AND percentage_food_price_change  > 0) THEN 'Correlation - HDP decline/price growth'
		WHEN (percentage_HDP_change > 0 AND percentage_food_price_change  < 0) THEN 'Correlation - HDP growth/price decline'
		ELSE 'NO CORRELATION'
	END AS impact_of_HDP_on_food_price
FROM t_jana_dedykova_project_sql_secondary_final tjdpssf; 












