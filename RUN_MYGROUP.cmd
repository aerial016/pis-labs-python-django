@echo off
chcp 65001 >nul
set PYTHONIOENCODING=utf-8
"%~dp0runtime\python312\python.exe" "%~dp0runtime\launch.py" "%~dp0lab1\mygroup.py"
pause
