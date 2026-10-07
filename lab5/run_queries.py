from pathlib import Path
import sqlite3


def main():
    root = Path(__file__).resolve().parent
    database_uri = (root / 'blog' / 'db_blog').as_uri() + '?mode=ro'
    outputs = []
    with sqlite3.connect(database_uri, uri=True) as connection:
        statement = ''
        for line in (root / 'queries.sql').read_text(encoding='utf-8').splitlines(True):
            statement += line
            if not sqlite3.complete_statement(statement):
                continue
            cursor = connection.execute(statement)
            rows = cursor.fetchall()
            outputs.append(statement.strip())
            outputs.append(' | '.join(column[0] for column in cursor.description))
            outputs.extend(' | '.join(str(value) for value in row) for row in rows)
            outputs.append('Количество строк: %s\n' % len(rows))
            statement = ''
    result = '\n'.join(outputs)
    (root / 'query_results.txt').write_text(result + '\n', encoding='utf-8-sig')
    print(result)


if __name__ == '__main__':
    main()
