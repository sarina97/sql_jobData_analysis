

SELECT 
    skills,
    TRUNC(AVG(salary_year_avg) , 2) AS avg_skill_salary
FROM 
    job_postings_fact 
JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short LIKE '%Data Analyst%'
      AND salary_year_avg IS NOT NULL
GROUP BY skills 
ORDER BY avg_skill_salary DESC
LIMIT 25;



/*
This report highlights the highest paying skills found in 
data analyst roles based on average salary data.

| SVN           | $400,000            | Legacy version control tool. Rare expertise, still used in some enterprises, hence high pay. |
| VMware        | $261,250            | Virtualization technology critical for cloud/data infrastructure roles. |
| Yarn          | $219,575            | JavaScript package manager; valuable for building data-driven web apps. |
| FastAPI       | $185,000            | Python framework for building fast APIs. Highly demanded for analytics services. |
| Solidity      | $179,000            | Blockchain smart contract programming language; lucrative in crypto/data tokenization projects. |
--------------------------------------------------------------

 **Trends:**
- Legacy technologies like SVN pay exceptionally well due to scarcity of specialists.
- Cloud & API-related skills (VMware, FastAPI) dominate modern data infrastructure needs.
- Blockchain & crypto-related data roles (Solidity) are emerging as highly paid opportunities.
- Frontend tools (Yarn) show how analytics is overlapping with full-stack development.

-- [
--   {
--     "skills": "svn",
--     "avg_skill_salary": "400000.00"
--   },
--   {
--     "skills": "vmware",
--     "avg_skill_salary": "261250.00"
--   },
--   {
--     "skills": "yarn",
--     "avg_skill_salary": "219575.00"
--   },
--   {
--     "skills": "fastapi",
--     "avg_skill_salary": "185000.00"
--   },
--   {
--     "skills": "solidity",
--     "avg_skill_salary": "179000.00"
--   }
-- ]