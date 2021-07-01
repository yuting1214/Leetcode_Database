
# Solution 1(self, wrong)
SELECT question_id  AS 'survey_log' 
FROM survey_log 
GROUP BY question_id
ORDER BY IFNULL(SUM(action = 'answer'), 0) / COUNT(DISTINCT id) DESC
LIMIT 1;

# Solutoin 2(reference, correct)
select question_id as 'survey_log'
from survey_log
group by question_id
order by count(answer_id) / sum(if(action = 'show', 1, 0)) desc
limit 1
