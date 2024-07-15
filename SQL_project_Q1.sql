/*
 * Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
 */
	
CREATE OR REPLACE TABLE comparing_of_payroll AS	
 WITH filtred_years AS (
		SELECT 
		payroll_year,
		avg_payroll_for_year,
		branch_name	
		FROM t_jana_dedykova_project_sql_primary_final tjdpspf 
		WHERE payroll_year >= 2000
		GROUP BY payroll_year,
				avg_payroll_for_year ,
				branch_name 
		ORDER BY branch_name ASC, 
				payroll_year ASC)
SELECT 
	p1.payroll_year AS this_year,
	p1.branch_name,
	p1.avg_payroll_for_year AS payroll_this_year,
	p0.avg_payroll_for_year AS payroll_last_year,
	p1.avg_payroll_for_year - p0.avg_payroll_for_year AS difference,
	CASE WHEN p1.avg_payroll_for_year - p0.avg_payroll_for_year > 0 THEN 'growth'
		ELSE 'decline' END AS description 
FROM filtred_years p1
LEFT JOIN filtred_years p0 ON
		p1.branch_name = p0.branch_name
	AND p1.payroll_year = p0.payroll_year + 1;

	
SELECT *
FROM comparing_of_payroll cop 
WHERE description  = 'decline' 
	AND difference IS NOT NULL; 