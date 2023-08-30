-- This query gets the average spent, taking in considaration only converted users
SELECT "group", AVG(total_spent)
FROM "Cleaned Data"
WHERE converted = 't'
GROUP BY "group";

-- This query gets the average spent for all of the users
SELECT "group", AVG(total_spent)
FROM "Cleaned Data"
GROUP BY "group";

