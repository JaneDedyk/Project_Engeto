

CREATE OR REPLACE TABLE t_JANA_DEDYKOVA_project_SQL_primary_final AS
	WITH payroll_by_branch_and_year AS (
			SELECT
				cp.industry_branch_code,
				cpib.name AS branch_name, 
				cp.value_type_code,
				cpvt.name AS value_type,
				avg(cp.value) AS avg_payroll_for_year,
				cp.payroll_year 
			FROM czechia_payroll cp 
			LEFT JOIN czechia_payroll_value_type cpvt 
				ON cp.value_type_code = cpvt.code
			LEFT JOIN czechia_payroll_industry_branch cpib 
				ON cp.industry_branch_code = cpib.code 
			WHERE cp.value_type_code = 5958
					AND cp.industry_branch_code IS NOT NULL 
			GROUP BY cp.industry_branch_code,
				cpib.name, 
				cp.value_type_code,
				cpvt.name,
				cp.payroll_year
	), price_by_category_and_year AS (
			SELECT 	 
				cpc.name AS category_name,
				year(cpric.date_from) AS particular_year,
				round(avg(cpric.value), 2) AS avg_price_for_year
			FROM czechia_price cpric
			LEFT JOIN czechia_price_category cpc 
				ON cpric.category_code = cpc.code 
			GROUP BY 
					cpc.name,
					particular_year
	)
	SELECT *
	FROM payroll_by_branch_and_year
	LEFT JOIN price_by_category_and_year ON
		payroll_by_branch_and_year.payroll_year = price_by_category_and_year.particular_year;