Лабораторная работа № 5. Создание формы и представления для нового поста

Python 3.12, Django 5.2.17, SQLite.
Репозиторий: https://github.com/aerial016/pis-labs-python-django/tree/main/lab5

Запуск из папки lab5:
python -m pip install -r requirements.txt
cd blog
python manage.py runserver 127.0.0.1:8765

Архив статей: http://127.0.0.1:8765/
Вход: http://127.0.0.1:8765/admin/
Форма: http://127.0.0.1:8765/article/new/
Логин и пароль находятся в blog/accounts.txt.
Для открытия формы необходимо войти в систему.

Запросы к базе данных находятся в queries.sql, результаты — в query_results.txt.
Для выполнения запросов из папки lab5: python run_queries.py
