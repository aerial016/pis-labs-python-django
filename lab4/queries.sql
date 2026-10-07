SELECT id, title, text, created_date, author_id
FROM articles_article
WHERE id = 5;
SELECT id, title, LENGTH(text) AS text_length
FROM articles_article
WHERE title LIKE '%Django%' AND LENGTH(text) > 140
ORDER BY id;
SELECT a.id, a.title, u.username AS author,
       STRFTIME('%d.%m.%Y', a.created_date) AS created_date,
       SUBSTR(a.text, 1, 140) || CASE WHEN LENGTH(a.text) > 140 THEN '...' ELSE '' END AS excerpt
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
WHERE u.username = 'labadmin' AND STRFTIME('%Y', a.created_date) = '2026'
ORDER BY a.id;
SELECT u.username AS author, COUNT(*) AS article_count,
       ROUND(AVG(LENGTH(a.text)), 2) AS average_length,
       MIN(LENGTH(a.text)) AS min_length, MAX(LENGTH(a.text)) AS max_length
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
GROUP BY u.id, u.username
HAVING COUNT(*) >= 1
ORDER BY u.username;
SELECT id, title, LENGTH(text) AS text_length
FROM articles_article
WHERE id IN (1, 3, 5) OR title LIKE '%SQLite%'
ORDER BY LENGTH(text) DESC, id
LIMIT 3;
