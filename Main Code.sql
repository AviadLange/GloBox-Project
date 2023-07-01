-- Gets a table with all the needed data.
SELECT id, country, gender, g.device, "group",
    CASE WHEN total_per_cus IS NULL THEN FALSE
    ELSE TRUE
    END AS converted,
coalesce(total_per_cus, 0) AS total_spent
FROM "users" AS u
LEFT JOIN "groups" AS g
ON g.uid = u.id
LEFT JOIN
    (SELECT uid, SUM(spent) AS total_per_cus
    FROM "activity"
    GROUP BY uid) AS "new_activity"
ON "new_activity".uid = u.id
ORDER BY total_spent DESC


-- Gets the average spening per group. **Weren't in use
SELECT AVG(coalesce(total_spent, 0)), "group"
FROM (SELECT uid, SUM(spent) AS total_spent
    FROM "activity"
    GROUP BY uid) AS "new_activity"
RIGHT JOIN "groups"  
USING(uid)
GROUP BY "group"
