
/*
 * Má výška HDP vliv na změny ve mzdách a cenách potravin?
 * Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 */

WITH comparison_HDP_price_payroll AS (
	WITH CZ_HDP AS (
			SELECT 
					country,
					`year`,
					GDP 
			FROM t_jana_dedykova_project_sql_secondary_final tjdpssf 
			WHERE Country = 'czech republic'
	)
	SELECT 
					ch2.country AS Country,
					ch2.`year` HDP_year,
					ch2.GDP AS HDP,
					((ch2.GDP - ch1.GDP) / ch1.GDP) * 100 AS percentage_HDP_change,
					pfpg.percentage_food_price_growth AS percentage_food_price_change,
					ppg.percentage_payroll_increase AS percentage_payroll_change
			FROM CZ_HDP ch2
			JOIN CZ_HDP ch1 ON
				ch2.`year`= ch1.`year` + 1
			LEFT JOIN percentage_food_price_growth pfpg ON
				ch2.`year`= pfpg.particular_year 
			LEFT JOIN percentage_payroll_growth ppg ON
				ch2.`year` = ppg.just_year 
			ORDER BY HDP_year ASC 
)		
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
FROM comparison_HDP_price_payroll;












