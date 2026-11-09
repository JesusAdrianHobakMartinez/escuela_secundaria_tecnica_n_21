<?php
/**
 * Script de Instalación del Sistema de Backup
 * Verifica y configura automáticamente todas las tablas necesarias
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "╔════════════════════════════════════════════════════════════════╗\n";
echo "║  Sistema de Backup - Instalador                               ║\n";
echo "║  Escuela Secundaria Técnica N°21                             ║\n";
echo "╚════════════════════════════════════════════════════════════════╝\n\n";

// Configuración
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'escuela_secundaria_tecnica_21');

// Colores para consola
define('COLOR_RESET', "\033[0m");
define('COLOR_GREEN', "\033[32m");
define('COLOR_RED', "\033[31m");
define('COLOR_YELLOW', "\033[33m");
define('COLOR_BLUE', "\033[34m");
define('COLOR_CYAN', "\033[36m");

function printStep($mensaje) {
    echo COLOR_CYAN . "► " . COLOR_RESET . $mensaje . "\n";
}

function printSuccess($mensaje) {
    echo COLOR_GREEN . "✓ " . COLOR_RESET . $mensaje . "\n";
}

function printError($mensaje) {
    echo COLOR_RED . "✗ " . COLOR_RESET . $mensaje . "\n";
}

function printWarning($mensaje) {
    echo COLOR_YELLOW . "⚠ " . COLOR_RESET . $mensaje . "\n";
}

try {
    // Paso 1: Conectar a la base de datos
    printStep("Conectando a la base de datos...");
    $conn = new PDO(
        "mysql:host=" . DB_HOST . ";charset=utf8mb4",
        DB_USER,
        DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
    printSuccess("Conexión a MySQL establecida");
    
    // Paso 2: Seleccionar base de datos
    printStep("Verificando base de datos...");
    $stmt = $conn->query("SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '" . DB_NAME . "'");
    
    if ($stmt->rowCount() === 0) {
        printWarning("Base de datos '" . DB_NAME . "' no existe. Creándola...");
        $conn->exec("CREATE DATABASE IF NOT EXISTS " . DB_NAME . " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        printSuccess("Base de datos creada");
    } else {
        printSuccess("Base de datos '" . DB_NAME . "' encontrada");
    }
    
    // Cambiar a la DB de la escuela
    $conn->exec("USE " . DB_NAME);
    
    // Paso 3: Crear tablas de backup
    printStep("Creando tablas de backup...");
    
    $tablas = [
        'historial_backup' => "
            CREATE TABLE IF NOT EXISTS historial_backup (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              nombre_backup VARCHAR(255) NOT NULL,
              ruta_archivo VARCHAR(500),
              tipos_datos VARCHAR(500),
              cantidad_registros INT,
              tamanio_bytes BIGINT,
              fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              estado VARCHAR(20) NOT NULL DEFAULT 'COMPLETADO',
              descripcion TEXT,
              realizado_por VARCHAR(150) DEFAULT 'Sistema',
              CHECK (estado IN ('COMPLETADO', 'PENDIENTE', 'ERROR')),
              INDEX idx_fecha (fecha_creacion),
              INDEX idx_estado (estado)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ",
        
        'historial_restauracion' => "
            CREATE TABLE IF NOT EXISTS historial_restauracion (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              id_backup BIGINT NOT NULL,
              tipos_datos VARCHAR(500),
              cantidad_registros INT,
              fecha_restauracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              estado VARCHAR(20) NOT NULL DEFAULT 'COMPLETADO',
              realizado_por VARCHAR(150),
              descripcion TEXT,
              FOREIGN KEY (id_backup) REFERENCES historial_backup(id),
              CHECK (estado IN ('COMPLETADO', 'FALLIDO', 'PARCIAL')),
              INDEX idx_fecha (fecha_restauracion)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ",
        
        'backup_usuarios' => "
            CREATE TABLE IF NOT EXISTS backup_usuarios (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              usuario_id BIGINT,
              rol_id BIGINT,
              nombres VARCHAR(120),
              apellidos VARCHAR(120),
              email_matricula VARCHAR(150),
              rol_nombre VARCHAR(40),
              activo TINYINT(1),
              fecha_backup TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              fecha_original_creacion TIMESTAMP,
              fecha_original_ultimo_acceso TIMESTAMP,
              INDEX idx_usuario (usuario_id),
              INDEX idx_fecha (fecha_backup)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ",
        
        'backup_alumnos' => "
            CREATE TABLE IF NOT EXISTS backup_alumnos (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              alumno_id BIGINT,
              nombres VARCHAR(120),
              apellidos VARCHAR(120),
              fecha_nacimiento DATE,
              curp VARCHAR(18),
              grupo_id BIGINT,
              grupo_nombre VARCHAR(50),
              semestre SMALLINT,
              estado VARCHAR(20),
              creditos_acumulados DECIMAL(6,1),
              fecha_backup TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              fecha_original_creacion TIMESTAMP,
              INDEX idx_alumno (alumno_id),
              INDEX idx_fecha (fecha_backup)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ",
        
        'backup_calificaciones' => "
            CREATE TABLE IF NOT EXISTS backup_calificaciones (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              alumno_id BIGINT,
              alumno_nombre VARCHAR(240),
              materia_id BIGINT,
              materia_nombre VARCHAR(100),
              parcial_numero SMALLINT,
              parcial_nombre VARCHAR(50),
              calificacion SMALLINT,
              estado VARCHAR(20),
              fecha_backup TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              INDEX idx_alumno (alumno_id),
              INDEX idx_fecha (fecha_backup)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ",
        
        'backup_kardex' => "
            CREATE TABLE IF NOT EXISTS backup_kardex (
              id BIGINT AUTO_INCREMENT PRIMARY KEY,
              alumno_id BIGINT,
              alumno_nombre VARCHAR(240),
              materia_id BIGINT,
              materia_nombre VARCHAR(100),
              calificacion_final SMALLINT,
              estado VARCHAR(20),
              fecha_backup TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              INDEX idx_alumno (alumno_id),
              INDEX idx_fecha (fecha_backup)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        "
    ];
    
    foreach ($tablas as $nombre => $sql) {
        try {
            $conn->exec($sql);
            printSuccess("Tabla '$nombre' creada/verificada");
        } catch (PDOException $e) {
            if (strpos($e->getMessage(), 'already exists') !== false) {
                printSuccess("Tabla '$nombre' ya existe");
            } else {
                throw $e;
            }
        }
    }
    
    // Paso 4: Crear carpetas necesarias
    printStep("Creando carpetas necesarias...");
    
    $carpetas = [
        __DIR__ . '/api/backups' => 'Almacén de backups JSON',
        __DIR__ . '/api/logs_backup' => 'Logs de ejecución de backups'
    ];
    
    foreach ($carpetas as $carpeta => $descripcion) {
        if (!is_dir($carpeta)) {
            mkdir($carpeta, 0755, true);
            printSuccess("Carpeta '$descripcion' creada: " . $carpeta);
        } else {
            printSuccess("Carpeta '$descripcion' ya existe: " . $carpeta);
        }
    }
    
    // Paso 5: Crear archivo .htaccess para proteger carpeta de backups
    printStep("Configurando seguridad...");
    
    $htaccess = __DIR__ . '/api/backups/.htaccess';
    if (!file_exists($htaccess)) {
        $contenido = "# Proteger acceso directo a archivos de backup\n";
        $contenido .= "<FilesMatch \".*\">\n";
        $contenido .= "    Order Deny,Allow\n";
        $contenido .= "    Deny from all\n";
        $contenido .= "</FilesMatch>\n";
        
        file_put_contents($htaccess, $contenido);
        printSuccess("Archivo .htaccess creado para proteger backups");
    } else {
        printSuccess(".htaccess ya configurado");
    }
    
    // Paso 6: Prueba de backup manual
    printStep("Ejecutando prueba de backup...");
    
    require_once 'backup.php';
    $resultado = realizarBackupCompleto($conn);
    
    if ($resultado['success']) {
        printSuccess("Backup de prueba completado exitosamente");
        echo "  • Nombre: " . $resultado['nombre_backup'] . "\n";
        echo "  • Registros: " . $resultado['cantidad_registros'] . "\n";
        echo "  • Tamaño: " . number_format($resultado['tamanio_bytes'] / 1024, 2) . " KB\n";
    } else {
        printWarning("Backup de prueba reportó: " . $resultado['error']);
    }
    
    // Resumen final
    echo "\n";
    echo "╔════════════════════════════════════════════════════════════════╗\n";
    echo "║  ✓ INSTALACIÓN COMPLETADA CON ÉXITO                           ║\n";
    echo "╚════════════════════════════════════════════════════════════════╝\n\n";
    
    echo "Próximos pasos:\n\n";
    echo "1. " . COLOR_CYAN . "Configurar ejecución automática:" . COLOR_RESET . "\n";
    echo "   • Windows: Usar backup.bat con Task Scheduler\n";
    echo "   • Linux: Configurar cron job\n\n";
    
    echo "2. " . COLOR_CYAN . "Probar endpoints de la API:" . COLOR_RESET . "\n";
    echo "   • POST http://localhost/escuela_api/backup_api.php\n";
    echo "   • GET http://localhost/escuela_api/backup_api.php?accion=listar_backups\n\n";
    
    echo "3. " . COLOR_CYAN . "Revisar documentación:" . COLOR_RESET . "\n";
    echo "   • Ver: BACKUP_README.md\n\n";
    
    echo "📁 Archivos creados/configurados:\n";
    echo "   • api/backup.php (funciones principales)\n";
    echo "   • api/backup_api.php (endpoints REST)\n";
    echo "   • api/backup_automatico.php (ejecución automática)\n";
    echo "   • backup.bat (script para Windows)\n";
    echo "   • backup_automatico.ps1 (script PowerShell)\n";
    echo "   • BACKUP_README.md (documentación)\n\n";
    
    echo COLOR_GREEN . "¡El sistema de hacer backup está listo!" . COLOR_RESET . "\n\n";
    
} catch (Exception $e) {
    echo "\n";
    printError("ERROR: " . $e->getMessage());
    echo "\nPor favor, verifica:\n";
    echo "  1. Que MySQL esté ejecutándose (XAMPP)\n";
    echo "  2. Que las credenciales en config.php sean correctas\n";
    echo "  3. Que la base de datos exista\n";
    echo "\nDetalles del error:\n";
    echo $e->getMessage() . "\n";
    exit(1);
}
?>
