@echo off
REM Script para ejecutar backup automático diario
REM Diseñado para Windows Task Scheduler
REM Uso: backup.bat o desde Task Scheduler

setlocal enabledelayedexpansion

REM Configuración - Editar según tu instalación
set XAMPP_PATH=C:\xampp
set PHP_EXE=%XAMPP_PATH%\php\php.exe
set SCRIPT_PATH=%XAMPP_PATH%\htdocs\escuela_api\backup_automatico.php
set LOG_PATH=%XAMPP_PATH%\htdocs\escuela_api\logs_backup

REM Crear carpetas si no existen
if not exist "%LOG_PATH%" mkdir "%LOG_PATH%"

REM Verificar que PHP existe
if not exist "%PHP_EXE%" (
    echo.
    echo ============================================
    echo ERROR: No se encontro PHP en %PHP_EXE%
    echo ============================================
    echo.
    pause
    exit /b 1
)

REM Verificar que el script existe
if not exist "%SCRIPT_PATH%" (
    echo.
    echo ============================================
    echo ERROR: No se encontro script en %SCRIPT_PATH%
    echo ============================================
    echo.
    pause
    exit /b 1
)

REM Verificar que XAMPP esté iniciado
tasklist /FI "IMAGENAME eq mysqld.exe" | find /I /N "mysqld.exe" > nul
if "%ERRORLEVEL%" == "1" (
    echo.
    echo ============================================
    echo ADVERTENCIA: MySQL no parece estar ejecutandose
    echo Inicia XAMPP en Control Panel antes de ejecutar
    echo ============================================
    echo.
    REM Comentar la siguiente línea si ejecutas desde Task Scheduler
    pause
    exit /b 1
)

REM Ejecutar backup
echo.
echo ============================================
echo Iniciando backup automático...
echo Fecha: %date% %time%
echo ============================================
echo.

call "%PHP_EXE%" "%SCRIPT_PATH%"

REM Capturar código de salida
set EXITCODE=%ERRORLEVEL%

echo.
echo ============================================
if %EXITCODE% equ 0 (
    echo Backup completado exitosamente
) else (
    echo Backup finalizado con errores (Código: %EXITCODE%)
)
echo Fecha: %date% %time%
echo ============================================
echo.

REM Solo mostrar pausa si se ejecuta desde el explorador
if not "%SCHEDULED_TASK%" == "1" (
    pause
)

exit /b %EXITCODE%
