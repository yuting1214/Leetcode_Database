# Pattern
FROM:

| DEPTNO | EMPS   |
|--------|--------|
| 10     | CLARK  |
| 10     | KING   |
| 10     | MILLER |
| 20     | SMITH  |
| 20     | ADAMS  |
| 20     | FORD   |
| 30     | SCOTT  |
| 30     | JONES  |

TO:

| DEPTNO | EMPS_string       |
|--------|-------------------|
| 10	   | CLARK,KING,MILLER |
| 20	   | ADAMS,SMITH       |

# MySQL
```
SELECT
    DEPTNO,
    group_concat(EMPS order by EMPS separator ',') AS EMPS_string
FROM dep
GROUP BY DEPTNO
```
