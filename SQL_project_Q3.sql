-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

CREATE OR REPLACE TABLE food_price_changes AS
	WITH food_price_evolution AS (
			SELECT
				category_name AS food_category,
				particular_year,
				avg_price_for_year AS price 
			FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
			WHERE particular_year >= 2007
			GROUP BY particular_year,
					category_name 
			ORDER BY  category_name ASC, 
					 particular_year ASC 
	)
	SELECT
			FPE2.particular_year,
			FPE2.food_category,
			FPE2.price,
			FPE1.price AS price_year_before,
			FPE2.price - FPE1.price AS comparing,
			((FPE2.price - FPE1.price) / fpe1.price) * 100 AS percentage_food_price_growth
			FROM food_price_evolution FPE2
	LEFT JOIN food_price_evolution FPE1 ON
			FPE2.food_category = FPE1.food_category
			AND FPE2.particular_year = fpe1.particular_year + 1;
		
		
WITH food_category_with_lowest_price_growth AS (
		SELECT 
			food_category,
			round(avg(percentage_food_price_growth), 2) AS avg_percentage_food_price_growth2
		FROM food_price_changes fpc 
		GROUP BY food_category 
)
SELECT 
	food_category
FROM food_category_with_lowest_price_growth
ORDER BY avg_percentage_food_price_growth2 ASC 
LIMIT 1;
