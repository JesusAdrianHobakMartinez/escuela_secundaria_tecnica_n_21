@echo off
REM Iniciar XAMPP Apache y MySQL
cd /d "C:\xampp"

echo Iniciando Apache...
start /B apache_start.bat

echo Iniciando MySQL...
start /B mysql_start.bat

echo.
echo Esperando a que los servicios inicien...
timeout /t 5 /nobreak > nul

echo.
echo Apache y MySQL iniciados. XAMPP está corriendo en http://localhost
echo phpMyAdmin disponible en http://localhost/phpmyadmin
echo.
echo Presiona cualquier tecla para cerrar esta ventana (los servicios seguiran corriendo)
pause
