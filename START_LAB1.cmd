@echo off
cd /d "%~dp0lab1\project_name"
"%~dp0runtime\python312\python.exe" "%~dp0runtime\launch.py" manage.py runserver 127.0.0.1:8761 --noreload
pause

