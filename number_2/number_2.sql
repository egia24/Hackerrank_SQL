with Manhattan_Distance  as(
    SELECT abs(MAX(LAT_N) - MIN(LAT_N)) + abs(MAX(LONG_W) - MIN(LONG_W)) as hasil FROM STATION
)

SELECT  
    round(hasil, 4)
FROM Manhattan_Distance ;
