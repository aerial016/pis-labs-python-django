BEGIN;

CALL create_article('Хранимые процедуры', 'Процедура добавляет статью и возвращает её идентификатор.', 1, NULL)
\gset

SELECT :article_id AS article_id;
SELECT id, title, author_id FROM articles_article WHERE id = :article_id;

CALL rename_article(:article_id, 'Хранимые процедуры PostgreSQL');
SELECT id, title, author_id FROM articles_article WHERE id = :article_id;

ROLLBACK;
