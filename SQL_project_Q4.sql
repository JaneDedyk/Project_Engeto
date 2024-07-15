

-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?


CREATE OR REPLACE TABLE percentage_food_price_growth AS
SELECT
	particular_year,
	percentage_food_price_growth 
FROM food_price_changes fpc 
GROUP BY particular_year;

CREATE OR REPLACE TABLE year_average_payroll AS
	WITH avgerage_payroll_for_year AS (
			SELECT 
				payroll_year, 
				branch_name,
				avg_payroll_for_year 
			FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
			WHERE payroll_year  >= 2007
				AND payroll_year <= 2018
			GROUP BY payroll_year,
				branch_name 
	)
	SELECT 
		payroll_year,
		round(avg(avg_payroll_for_year), 2) AS year_average_payroll 
	FROM avgerage_payroll_for_year
	GROUP BY payroll_year;


CREATE OR REPLACE TABLE percentage_payroll_growth AS
WITH percentage_payroll_growth AS (
	SELECT 
		*		
	FROM year_average_payroll yap
)
SELECT
	ppg2.payroll_year AS just_year,
	((ppg2.year_average_payroll - ppg1.year_average_payroll) / ppg1.year_average_payroll) * 100 AS percentage_payroll_increase
FROM percentage_payroll_growth ppg2
JOIN percentage_payroll_growth ppg1 ON
	ppg2.payroll_year = ppg1.payroll_year + 1;
		

SELECT 
	pfpg.particular_year,
	pfpg.percentage_food_price_growth,
	ppg.percentage_payroll_increase,
	CASE 
		WHEN (pfpg.percentage_food_price_growth - ppg.percentage_payroll_increase) > 10 THEN 'Higher than 10%'
		ELSE 1
	END	
FROM percentage_food_price_growth pfpg 
JOIN percentage_payroll_growth ppg ON
	pfpg.particular_year = ppg.just_year 
	








