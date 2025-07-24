/*
what the most in-demand skills for data analyst?
*/

SELECT 
    skills , COUNT(skills_job_dim.job_id) AS demand_skill_count
FROM 
    job_postings_fact 
JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short LIKE '%Data Analyst%' AND
job_work_from_home = TRUE
GROUP BY skills 
ORDER BY demand_skill_count DESC
LIMIT 5;