-- 1. Статьи и их авторы.
SELECT a.id, a.title, u.username AS author, a.created_date
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
ORDER BY a.id;

-- 2. Количество статей каждого автора.
SELECT u.username AS author, COUNT(a.id) AS article_count
FROM auth_user AS u
LEFT JOIN articles_article AS a ON a.author_id = u.id
GROUP BY u.id, u.username
ORDER BY article_count DESC, u.username;

-- 3. Статьи пользователя labadmin: вложенный запрос IN.
SELECT id, title, created_date
FROM articles_article
WHERE author_id IN (
    SELECT id FROM auth_user WHERE username = 'labadmin'
)
ORDER BY id;

-- 4. Статьи длиннее среднего: вложенный запрос с AVG.
SELECT id, title, LENGTH(text) AS text_length
FROM articles_article
WHERE LENGTH(text) > (
    SELECT AVG(LENGTH(text)) FROM articles_article
)
ORDER BY text_length DESC, id;

-- 5. Пользователи, у которых есть статьи: коррелированный запрос EXISTS.
SELECT u.id, u.username
FROM auth_user AS u
WHERE EXISTS (
    SELECT 1 FROM articles_article AS a WHERE a.author_id = u.id
)
ORDER BY u.id;

-- 6. Самая длинная статья каждого автора: JOIN и вложенный запрос.
SELECT a.id, a.title, u.username AS author, LENGTH(a.text) AS text_length
FROM articles_article AS a
JOIN auth_user AS u ON u.id = a.author_id
WHERE LENGTH(a.text) = (
    SELECT MAX(LENGTH(other.text))
    FROM articles_article AS other
    WHERE other.author_id = a.author_id
)
ORDER BY u.username, a.id;
