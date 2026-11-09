@echo off
REM Script para copiar archivos PHP a Apache XAMPP
REM Copiar reportes_sistema.php
copy "c:\Users\slipn\OneDrive - Instituto Tecnológico Superior Progreso\Proyecto nuevo\escuela_secundaria_tecnica_n_21\api\reportes_sistema.php" "C:\xampp\htdocs\escuela_api\reportes_sistema.php"
echo reportes_sistema.php copiado

REM Copiar reporte_falta.php
copy "c:\Users\slipn\OneDrive - Instituto Tecnológico Superior Progreso\Proyecto nuevo\escuela_secundaria_tecnica_n_21\api\reporte_falta.php" "C:\xampp\htdocs\escuela_api\reporte_falta.php"
echo reporte_falta.php copiado

REM Verifica PHP
php -l "C:\xampp\htdocs\escuela_api\reportes_sistema.php"
php -l "C:\xampp\htdocs\escuela_api\reporte_falta.php"

REM Mensaje final
echo.
echo ===========================================
echo Archivos listos. Las tablas se crearán automáticamente al usar los APIs.
echo ===========================================
pause
