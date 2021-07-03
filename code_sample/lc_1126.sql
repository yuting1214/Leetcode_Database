# Table
CREATE TABLE Events
(
     business_id 	varchar(300),
     event_type 	varchar(300),
     occurences 	INT
);

INSERT INTO Events ( business_id , event_type , occurences )
VALUES
    ('1', 'reviews', 7),
    ('3', 'reviews', 3),
    ('1', 'ads', 11),
    ('2', 'ads', 7),
    ('3', 'ads', 6),
    ('1', 'page views', 3),
    ('2', 'page views', 12);
    
# Solution 1(self, correct)    
SELECT business_id
FROM 
    (SELECT *, AVG(occurences) OVER( PARTITION BY event_type) AS AVG_occurences
    FROM Events) AVG_table
WHERE occurences > AVG_occurences
GROUP BY business_id
HAVING COUNT(DISTINCT event_type) > 1

# Solutoin 2(reference, correct)
SELECT agg.business_id
FROM (
    SELECT e2.business_id, COUNT(*) AS "count_above_avg"
    FROM Events e2
    LEFT JOIN (
        SELECT e.event_type, AVG(e.occurences) AS "avg_ocur"
        FROM Events e
        GROUP BY e.event_type) sum_table
    ON e2.event_type = sum_table.event_type
    WHERE e2.occurences> sum_table.avg_ocur
    GROUP BY e2.business_id) agg
WHERE agg.count_above_avg > 1
