# MySQL

## 1
```
WHERE MONTH(t.program_date) = 6
AND YEAR(t.program_date) = 2020
```

## 2
```
T.program_date >= '2020-06-01' AND
T.program_date < '2020-07-01' AND
```

## 3
```
WHERE EXTRACT(YEAR_MONTH FROM program_date) = '202006'
```

## 4
```
WHERE (month(program_date), year(program_date)) = (6, 2020)
```
