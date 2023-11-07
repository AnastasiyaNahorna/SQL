-- 1. Retrieve all fields and all records.
SELECT * FROM example_table;

-- 2. Retrieve all students in the table.
SELECT * FROM example_table;

-- 3. Retrieve only user IDs.
SELECT id FROM example_table;

-- 4. Retrieve only user names.
SELECT user_name FROM example_table;

-- 5. Retrieve only user emails.
SELECT email FROM example_table;

-- 6. Retrieve user names and emails.
SELECT user_name, email FROM example_table;

-- 7. Retrieve IDs, names, emails, and creation dates of users.
SELECT id, user_name, email, created_on FROM example_table;

-- 8. Retrieve users with the password '12333'.
SELECT * FROM example_table WHERE password = '12333';

-- 9. Retrieve users created on '2021-03-26 00:00:00'.
SELECT * FROM example_table WHERE created_on = '2021-03-26 00:00:00';

-- 10. Retrieve users with 'Anna' in their names.
SELECT * FROM example_table WHERE user_name LIKE '%Anna%';

-- 11. Retrieve users with '8' at the end of their names.
SELECT * FROM example_table WHERE user_name LIKE '%8';

-- 12. Retrieve users with the letter 'a' in their names.
SELECT * FROM example_table WHERE user_name LIKE '%a%';

-- 13. Retrieve users created on '2021-07-12 00:00:00'.
SELECT * FROM example_table WHERE created_on = '2021-07-12 00:00:00';

-- 14. Retrieve users created on '2021-07-12 00:00:00' with the password '1m313'.
SELECT * FROM example_table WHERE created_on = '2021-07-12 00:00:00' AND password = '1m313';

-- 15. Retrieve users created on '2021-07-12 00:00:00' with 'Andrey' in their names.
SELECT * FROM example_table WHERE created_on = '2021-07-12 00:00:00' AND user_name LIKE '%Andrey%';

-- 16. Retrieve users created on '2021-07-12 00:00:00' with a '8' in their names.
SELECT * FROM example_table WHERE created_on = '2021-07-12 00:00:00' AND user_name LIKE '%8%';

-- 17. Retrieve the user with ID 110.
SELECT * FROM example_table WHERE id = 110;

-- 18. Retrieve the user with ID 153.
SELECT * FROM example_table WHERE id = 153;

-- 19. Retrieve users with IDs greater than 140.
SELECT * FROM example_table WHERE id > 140;

-- 20. Retrieve users with IDs less than 130.
SELECT * FROM example_table WHERE id < 130;

-- 21. Retrieve users with IDs less than 127 or greater than 188.
SELECT * FROM example_table WHERE id < 127 OR id > 188;

-- 22. Retrieve users with IDs less than or equal to 137.
SELECT * FROM example_table WHERE id <= 137;

-- 23. Retrieve users with IDs greater than or equal to 137.
SELECT * FROM example_table WHERE id >= 137;

-- 24. Retrieve users with IDs greater than 180 but less than 190.
SELECT * FROM example_table WHERE id > 180 AND id < 190;

-- 25. Retrieve users with IDs between 180 and 190.
SELECT * FROM example_table WHERE id BETWEEN 180 AND 190;

-- 26. Retrieve users with passwords '12333', '1m313', or '123313'.
SELECT * FROM example_table WHERE password IN ('12333', '1m313', '123313');

-- 27. Retrieve users with creation dates '2020-10-03 00:00:00', '2021-05-19 00:00:00', or '2021-03-26 00:00:00'.
SELECT * FROM example_table WHERE created_on IN ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

-- 28. Retrieve the minimum ID.
SELECT MIN(id) FROM example_table;

-- 29. Retrieve the maximum ID.
SELECT MAX(id) FROM example_table;

-- 30. Retrieve the number of users.
SELECT COUNT(*) FROM example_table;

-- 31. Retrieve user IDs, names, and creation dates, sorted in ascending order of user creation.
SELECT id, user_name, created_on FROM example_table ORDER BY created_on ASC;

-- 32. Retrieve user IDs, names, and creation dates, sorted in descending order of user creation.
SELECT id, user_name, created_on FROM example_table ORDER BY created_on DESC;
