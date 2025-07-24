/*
what are the optimal skills to learn 
-identify high demand with average salaries for Data Analyst roles
-concentrates on remote positions
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_skill_count
    FROM 
        job_postings_fact 
    JOIN 
        skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    JOIN 
        skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short ='Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        TRUNC(AVG(salary_year_avg), 0) AS avg_skill_salary
    FROM 
        job_postings_fact 
    JOIN 
        skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    JOIN 
        skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short LIKE '%Data Analyst%'
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id, skills_dim.skills
)

SELECT 
    sd.skills,
    sd.demand_skill_count,
    asal.avg_skill_salary
FROM 
    skills_demand sd
JOIN 
    average_salary asal ON sd.skill_id = asal.skill_id
ORDER BY 
       sd.demand_skill_count DESC ,
       asal.avg_skill_salary DESC
LIMIT 50;
