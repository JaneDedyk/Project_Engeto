-- tvorba sekundární tabulky

CREATE OR REPLACE TABLE t_Jana_Dedykova_project_SQL_secondary_final AS
	WITH CZ_HDP AS (
			SELECT
				country,
				`year`,
				GDP 
			FROM economies e 
			WHERE country = 'Czech Republic'
				AND `year`  BETWEEN 2007 AND 2018
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
		ORDER BY HDP_year ASC; 
	
	
	
	
	
	
	

SELECT *
FROM t_jana_dedykova_project_sql_primary_final tjdpspf;

SELECT *
FROM percentage_food_price_growth pfpg; 