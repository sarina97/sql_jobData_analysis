/*
what skills are required for tjose top_paying data analyst jobs
add specific skills needed for these roles
*/

with top_paying_jobs AS (
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.* , 
    skills
 FROM 
    top_paying_jobs
JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 10 ;


