# Example table
```
create table cinema (seat_id  integer, free BOOLEAN);
```

| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 0    |
| 4       | 1    |
| 5       | 1    |
| 6       | 1    |

# Self join

## (1) Expand
```
select o.seat_id AS pre_s, o.free AS pre_f, n.seat_id current_s, n.free current_f
FROM cinema o, cinema n;
```
| pre_s |	pre_f | current_s | current_f |
|-------|-------|-----------|-----------|
| 6     | 1     | 1         | 1         |
| 5     | 1     | 1         | 1         |
| 4     | 1     | 1         | 1         |
| 3     | 0     | 1         | 1         |
| 2     | 0     | 1         | 1         |
| 1     | 1     | 1         | 1         |
| 6     | 1     | 2         | 2         |
| 5     | 1     | 2         | 2         |
| 4     | 1     | 2         | 2         |
| 3     | 0     | 2         | 2         |
| 2     | 0     | 2         | 2         |
| 1     | 1     | 2         | 2         |
| 6     | 1     | 3         | 3         |
| 5     | 1     | 3         | 3         |
| 4     | 1     | 3         | 3         |
| 3     | 0     | 3         | 3         |
| 2     | 0     | 3         | 3         |
| 1     | 1     | 3         | 3         |
| 6     | 1     | 4         | 4         |
| 5     | 1     | 4         | 4         |
| 4     | 1     | 4         | 4         |
| 3     | 0     | 4         | 4         |
| 2     | 0     | 4         | 4         |
| 1     | 1     | 4         | 4         |
| 6     | 1     | 5         | 5         |
| 5     | 1     | 5         | 5         |
| 4     | 1     | 5         | 5         |
| 3     | 0     | 5         | 5         |
| 2     | 0     | 5         | 5         |
| 1     | 1     | 5         | 5         |
| 6     | 1     | 6         | 6         |
| 5     | 1     | 6         | 6         |
| 4     | 1     | 6         | 6         |
| 3     | 0     | 6         | 6         |
| 2     | 0     | 6         | 6         |
| 1     | 1     | 6         | 6         |

## (2-1)Connect- Exclude the later
```
select o.seat_id AS pre_s, o.free AS pre_f, n.seat_id current_s, n.free current_f
FROM cinema o, cinema n
WHERE (o.seat_id + 1) = n.seat_id;
```

| pre_s | pre_f | current_s | current_f |
|-------|-------|-----------|-----------|
| 1     | 1     | 2         | 0         |
| 2     | 0     | 3         | 0         |
| 3     | 0     | 4         | 1         |
| 4     | 1     | 5         | 1         |
| 5     | 1     | 6         | 1         |

## (2-2)Connect- Include the later
```
select o.seat_id AS pre_s, o.free AS pre_f, n.seat_id current_s, n.free current_f
FROM cinema o, cinema n
WHERE (o.seat_id + 1) = n.seat_id OR (o.seat_id - 1) = n.seat_id;
```
| pre_s | pre_f | current_s | current_f |
|-------|-------|-----------|-----------|
| 2     | 0     | 1         | 1         |
| 3     | 0     | 2         | 0         |
| 1     | 1     | 2         | 0         |
| 4     | 1     | 3         | 0         |
| 2     | 0     | 3         | 0         |
| 5     | 1     | 4         | 1         |
| 3     | 0     | 4         | 1         |
| 6     | 1     | 5         | 1         |
| 4     | 1     | 5         | 1         |
| 5     | 1     | 6         | 1         |

## (3-1) All consecutiveness (1 -> 2-2 -> 3-1)
```
select o.seat_id AS pre_s, o.free AS pre_f, n.seat_id current_s, n.free current_f
FROM cinema o, cinema n
WHERE ((o.seat_id + 1) = n.seat_id OR (o.seat_id - 1) = n.seat_id) AND (o.free = n.free)
ORDER BY pre_s;
```

| pre_s | pre_f | current_s | current_f |
|-------|-------|-----------|-----------|
| 2     | 0     | 3         | 0         |
| 3     | 0     | 2         | 0         |
| 4     | 1     | 5         | 1         |
| 5     | 1     | 4         | 1         |
| 5     | 1     | 6         | 1         |
| 6     | 1     | 5         | 1         |

## (3-2) One type consecutiveness (1 -> 2-2 -> 3-2)



## (4) Get distinct

