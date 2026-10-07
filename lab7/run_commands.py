from pathlib import Path
import sqlite3


def main():
    folder = Path(__file__).resolve().parent
    commands = (folder / 'commands.sql').read_text(encoding='utf-8')
    results = []
    statement = ''
    database = folder / 'blog/db_blog'
    if not database.is_file():
        raise FileNotFoundError(database)
    with sqlite3.connect(database) as connection:
        connection.execute('PRAGMA foreign_keys = ON')
        for line in commands.splitlines():
            statement += line + '\n'
            if not sqlite3.complete_statement(statement):
                continue
            statement = statement.strip()
            cursor = connection.execute(statement)
            results.append(statement)
            if cursor.description:
                results.append(' | '.join(column[0] for column in cursor.description))
                rows = cursor.fetchall()
                for row in rows:
                    results.append(' | '.join('NULL' if value is None else str(value) for value in row))
                if not rows:
                    results.append('(0 строк)')
            else:
                results.append('Изменено строк: ' + str(cursor.rowcount))
            results.append('')
            statement = ''
        if statement.strip():
            raise ValueError('Незавершённая SQL-команда')
    output = '\n'.join(results)
    (folder / 'trigger_results.txt').write_text(output, encoding='utf-8-sig')
    print(output)


if __name__ == '__main__':
    main()
