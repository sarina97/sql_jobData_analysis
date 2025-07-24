/*
Top Paying Data anlayst Jobs
-top 10 highest-paying Data Analyst roles that are available remotely
-remove Nulls
--highlight top-paying opportunities 
*/

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact j_position
LEFT JOIN 
    company_dim c_dim ON c_dim.company_id = j_position.company_id
WHERE 
    job_title LIKE '%Data Analyst%' AND job_location LIKE '%Anywhere%' AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;