# Script para ejecutar backups automáticos diarios en Windows
# Uso: powershell.exe -ExecutionPolicy Bypass -File "backup_automatico.ps1"

param(
    [string]$PhpPath = "C:\xampp\php\php.exe",
    [string]$ScriptPath = "C:\xampp\htdocs\escuela_api\backup_automatico.php"
)

# Verificar que exista XAMPP
if (-not (Test-Path $PhpPath)) {
    Write-Host "ERROR: No se encontró PHP en: $PhpPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $ScriptPath)) {
    Write-Host "ERROR: No se encontró script en: $ScriptPath" -ForegroundColor Red
    exit 1
}

Write-Host "Iniciando backup automático..." -ForegroundColor Green
Write-Host "Usando PHP: $PhpPath" -ForegroundColor Cyan
Write-Host "Script: $ScriptPath" -ForegroundColor Cyan

# Ejecutar script de backup
& $PhpPath $ScriptPath

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nBackup ejecutado exitosamente" -ForegroundColor Green
} else {
    Write-Host "`nOcurrió un error durante el backup" -ForegroundColor Red
}
