from django.db import migrations


CREATE_SQL = """
CREATE TABLE article_changes (
    id INTEGER PRIMARY KEY,
    operation TEXT NOT NULL CHECK (operation IN ('INSERT', 'UPDATE', 'DELETE')),
    article_id INTEGER NOT NULL,
    old_title TEXT,
    new_title TEXT
);

CREATE TRIGGER article_after_insert
AFTER INSERT ON articles_article
FOR EACH ROW
BEGIN
    INSERT INTO article_changes (operation, article_id, new_title)
    VALUES ('INSERT', NEW.id, NEW.title);
END;

CREATE TRIGGER article_after_update
AFTER UPDATE OF title ON articles_article
FOR EACH ROW
WHEN OLD.title IS NOT NEW.title
BEGIN
    INSERT INTO article_changes (operation, article_id, old_title, new_title)
    VALUES ('UPDATE', NEW.id, OLD.title, NEW.title);
END;

CREATE TRIGGER article_after_delete
AFTER DELETE ON articles_article
FOR EACH ROW
BEGIN
    INSERT INTO article_changes (operation, article_id, old_title)
    VALUES ('DELETE', OLD.id, OLD.title);
END;
"""

REVERSE_SQL = """
DROP TRIGGER article_after_delete;
DROP TRIGGER article_after_update;
DROP TRIGGER article_after_insert;
DROP TABLE article_changes;"""


class Migration(migrations.Migration):
    dependencies = [('articles', '0001_initial')]
    operations = [migrations.RunSQL(CREATE_SQL, REVERSE_SQL)]
