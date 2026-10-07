-- 1. Выбор отдельной статьи по идентификатору: оператор равенства.
SELECT id, title, text, created_date, author_id
FROM articles_article
WHERE id = 5;

-- 2. Выбор статей о Django с текстом длиннее 140 символов: AND, LIKE, >, LENGTH.
SELECT id, title, LENGTH(text) AS text_length
FROM articles_article
WHERE title LIKE '%Django%' AND LENGTH(text) > 140
ORDER BY id;

-- 3. Статьи автора за 2026 год с датой и отрывком: JOIN, AND, STRFTIME, SUBSTR, CASE, ||.
SELECT a.id, a.title, u.username AS author,
       STRFTIME('%d.%m.%Y', a.created_date) AS created_date,
       SUBSTR(a.text, 1, 140) || CASE WHEN LENGTH(a.text) > 140 THEN '...' ELSE '' END AS excerpt
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
WHERE u.username = 'labadmin' AND STRFTIME('%Y', a.created_date) = '2026'
ORDER BY a.id;

-- 4. Статистика по авторам: GROUP BY, HAVING, >=, COUNT, AVG, MIN, MAX, ROUND, LENGTH.
SELECT u.username AS author, COUNT(*) AS article_count,
       ROUND(AVG(LENGTH(a.text)), 2) AS average_length,
       MIN(LENGTH(a.text)) AS min_length, MAX(LENGTH(a.text)) AS max_length
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
GROUP BY u.id, u.username
HAVING COUNT(*) >= 1
ORDER BY u.username;

-- 5. Три наиболее длинные статьи из выбранных: IN, OR, LIKE, LENGTH, ORDER BY, LIMIT.
SELECT id, title, LENGTH(text) AS text_length
FROM articles_article
WHERE id IN (1, 3, 5) OR title LIKE '%SQLite%'
ORDER BY LENGTH(text) DESC, id
LIMIT 3;
