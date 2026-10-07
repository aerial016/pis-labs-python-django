@echo off
cd /d "%~dp0lab3\blog"
"%~dp0runtime\python312\python.exe" "%~dp0runtime\launch.py" manage.py runserver 127.0.0.1:8763 --noreload
pause

