SELECT name FROM sqlite_master WHERE type = 'trigger' ORDER BY name;

INSERT INTO articles_article (title, text, created_date, author_id)
VALUES ('Работа с триггерами', 'Триггер сохраняет сведения о добавлении статьи.',
        DATE('now'), (SELECT id FROM auth_user WHERE username = 'labadmin'));

SELECT id, title FROM articles_article WHERE title = 'Работа с триггерами';
SELECT operation, article_id, old_title, new_title FROM article_changes ORDER BY id;

UPDATE articles_article SET title = 'Триггеры SQLite'
WHERE title = 'Работа с триггерами';

SELECT id, title FROM articles_article WHERE title = 'Триггеры SQLite';
SELECT operation, article_id, old_title, new_title FROM article_changes ORDER BY id;

DELETE FROM articles_article WHERE title = 'Триггеры SQLite';

SELECT id, title FROM articles_article WHERE title = 'Триггеры SQLite';
SELECT operation, article_id, old_title, new_title FROM article_changes ORDER BY id;
SELECT COUNT(*) AS article_count FROM articles_article;
