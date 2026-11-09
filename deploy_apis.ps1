# Script para copiar archivos PHP a Apache XAMPP

$projectPath = "c:\Users\slipn\OneDrive - Instituto Tecnológico Superior Progreso\Proyecto nuevo\escuela_secundaria_tecnica_n_21\api"
$apachePath = "C:\xampp\htdocs\escuela_api"

Write-Host "Copiando archivos API a Apache..." -ForegroundColor Green

# Copiar reportes_sistema.php
Copy-Item "$projectPath\reportes_sistema.php" "$apachePath\reportes_sistema.php" -Force
Write-Host "✓ reportes_sistema.php copiado" -ForegroundColor Green

# Copiar reporte_falta.php
Copy-Item "$projectPath\reporte_falta.php" "$apachePath\reporte_falta.php" -Force
Write-Host "✓ reporte_falta.php copiado" -ForegroundColor Green

# Verificar sintaxis
Write-Host ""
Write-Host "Verificando sintaxis PHP..." -ForegroundColor Cyan
php -l "$apachePath\reportes_sistema.php"
php -l "$apachePath\reporte_falta.php"

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Archivos listos para usar" -ForegroundColor Green
Write-Host "Las tablas se crearán automáticamente" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
