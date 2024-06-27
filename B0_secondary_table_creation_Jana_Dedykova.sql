-- tvorba sekundární tabulky

CREATE OR REPLACE TABLE t_jana_dedykova_project_sql_secondary_final 
	WITH ctry AS (
			SELECT 
					country,
					population 
			FROM countries c 
			WHERE continent = 'Europe'
	)
	SELECT 
			e.country,
			e.`year`, 
			e.GDP,
			e.gini,
			c.population
	FROM ctry c
	JOIN economies e ON
		e.country = c.country
	WHERE e.`year` BETWEEN 2007 AND 2018
	ORDER BY
			e.country ASC, 
			e.`year` ASC; 
