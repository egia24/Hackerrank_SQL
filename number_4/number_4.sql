SET NOCOUNT ON;
with coins_min as (
    SELECT 
        t1.id,
        t2.age,
        t1.power,
        t2.is_evil,
        t1.coins_needed,
        MIN(t1.coins_needed) OVER (PARTITION BY t2.age, t1.power) AS coins_min
    FROM Wands t1
    JOIN Wands_Property t2 ON t1.code = t2.code
    where is_evil = 0
) 

SELECT 
    id,
    age,
    coins_needed,
    power
FROM coins_min t3
WHERE t3.coins_needed = t3.coins_min
ORDER BY t3.power DESC, t3.age DESC;
go
