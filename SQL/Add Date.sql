--This query groups the number of conversions and the average spendig by day.
SELECT "group", dt AS date,
    COUNT(converted) AS num_of_conv,
    AVG(spent) AS avg_spent
FROM "Cleaned Data" AS c
RIGHT JOIN "activity" AS a
ON c.id = a.uid
WHERE converted = 't'
GROUP BY dt, "group"
ORDER BY date

