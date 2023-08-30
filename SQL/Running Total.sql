--This query  counts the number of new users joined each day and sums it with the count of the days before.
SELECT join_dt,
  SUM(new_users) OVER 
  (ORDER BY join_dt ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  AS RunningSum 
FROM(
    SELECT join_dt,
        COUNT(converted) AS new_users
    FROM "Cleaned Data" AS c
    RIGHT JOIN "groups" AS g
    ON c.id = g.uid
    GROUP BY join_dt) AS count_users;

--This query only counts the number of new users joined each day. **Weren't in use
SELECT join_dt,
  COUNT(converted) AS new_users
FROM "Cleaned Data" AS c
RIGHT JOIN "groups" AS g
ON c.id = g.uid
GROUP BY join_dt
ORDER BY join_dt;

--This query  counts the number of new users joined each day and sums it with the count of the days before.
--Also it formats the date differently. **Weren't in use
SELECT TO_CHAR(join_dt, 'DD/MM/YYYY') AS formatted_date,
  SUM(new_users) OVER 
  (ORDER BY join_dt ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  AS RunningSum 
FROM(
    SELECT join_dt,
        COUNT(converted) AS new_users
    FROM "Cleaned Data" AS c
    RIGHT JOIN "groups" AS g
    ON c.id = g.uid
    GROUP BY join_dt) AS count_users;