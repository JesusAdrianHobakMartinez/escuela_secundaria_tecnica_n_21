# Sistema de Backup de Base de Datos - Escuela Secundaria Técnica N°21

## 📋 Descripción

Sistema completo de backup y restauración de datos académicos con respaldo tanto en **archivos JSON** como en **tablas de historial en MySQL**. Protege contra pérdida de datos de XAMPP.

### ✨ Características

- ✅ **Backup automático diario** de datos académicos
- ✅ **Almacenamiento dual**: archivos JSON + tablas de historial
- ✅ **Respaldo de usuarios y credenciales**
- ✅ **Respaldo de datos de alumnos, calificaciones y kardex**
- ✅ **Historial de backups y restauraciones**
- ✅ **Limpieza automática de backups antiguos (30 días)**
- ✅ **Estadísticas y monitoreo**

---

## 🚀 Instalación

### Paso 1: Crear las tablas de backup

Ejecuta el script SQL en tu base de datos MySQL:

```sql
-- Opción A: Importar archivo SQL
-- En phpMyAdmin o MySQL Workbench, importa: database/crear_tabla_backup.sql

-- Opción B: Ejecutar con comando MySQL en XAMPP
mysql -u root escuela_secundaria_tecnica_21 < database/crear_tabla_backup.sql
```

### Paso 2: Copiar archivos a XAMPP

Copia los archivos a la carpeta de la API:

```powershell
# Windows PowerShell
Copy-Item -Path "api\backup.php" -Destination "C:\xampp\htdocs\escuela_api\" -Force
Copy-Item -Path "api\backup_api.php" -Destination "C:\xampp\htdocs\escuela_api\" -Force
Copy-Item -Path "api\backup_automatico.php" -Destination "C:\xampp\htdocs\escuela_api\" -Force
```

### Paso 3: Crear carpeta de backups

```powershell
# La carpeta se crea automáticamente, pero puedes crearla manualmente
New-Item -ItemType Directory -Path "C:\xampp\htdocs\escuela_api\backups" -Force
New-Item -ItemType Directory -Path "C:\xampp\htdocs\escuela_api\logs_backup" -Force
```

---

## 📡 Endpoints Disponibles

### 1. Crear Backup Manual

```bash
curl -X POST http://localhost/escuela_api/backup_api.php \
  -H "Content-Type: application/json" \
  -d '{"accion":"crear_backup"}'
```

**Respuesta exitosa:**
```json
{
  "success": true,
  "mensaje": "Backup completado exitosamente",
  "nombre_backup": "backup_escuela_2026-03-09_14-30-45",
  "ruta": "C:\xampp\htdocs\escuela_api\backups\backup_escuela_2026-03-09_14-30-45.json",
  "cantidad_registros": 150,
  "tamanio_bytes": 45678
}
```

### 2. Listar Backups Disponibles

```bash
curl http://localhost/escuela_api/backup_api.php?accion=listar_backups
```

**Respuesta:**
```json
{
  "success": true,
  "archivos_json": [
    {
      "archivo": "backup_escuela_2026-03-09_14-30-45.json",
      "fecha": 1709991045,
      "tamanio": 45678
    }
  ],
  "historial_bd": [
    {
      "id": 1,
      "nombre_backup": "backup_escuela_2026-03-09_14-30-45",
      "fecha_creacion": "2026-03-09 14:30:45",
      "tipos_datos": "usuarios_credenciales,alumnos,calificaciones,kardex",
      "cantidad_registros": 150,
      "tamanio_bytes": 45678,
      "estado": "COMPLETADO"
    }
  ]
}
```

### 3. Obtener Contenido de Backup

```bash
curl http://localhost/escuela_api/backup_api.php \
  -H "Content-Type: application/json" \
  -d '{"accion":"obtener_backup","archivo":"backup_escuela_2026-03-09_14-30-45.json"}'
```

### 4. Descargar Archivo de Backup

```bash
# Descarga el archivo JSON
curl http://localhost/escuela_api/backup_api.php?accion=descargar_backup&archivo=backup_escuela_2026-03-09_14-30-45.json \
  -o backup.json
```

### 5. Restaurar desde Backup

```bash
curl -X POST http://localhost/escuela_api/backup_api.php \
  -H "Content-Type: application/json" \
  -d '{
    "accion":"restaurar_backup",
    "archivo":"backup_escuela_2026-03-09_14-30-45.json",
    "tipos":["usuarios","alumnos","calificaciones","kardex"]
  }'
```

**⚠️ Nota:** Por seguridad, no se restauran credenciales automáticamente. Solo se leen y registran.

### 6. Ver Historial de Restauraciones

```bash
curl http://localhost/escuela_api/backup_api.php?accion=historial_restauraciones
```

### 7. Estadísticas de Backups

```bash
curl http://localhost/escuela_api/backup_api.php?accion=estadisticas_backup
```

**Respuesta:**
```json
{
  "success": true,
  "estadisticas": {
    "cantidad_backups": 5,
    "tamanio_total": 250340,
    "ultimo_backup": "2026-03-09 14:30:45",
    "tamanio_promedio": 50068,
    "registros_totales": 750
  },
  "espacio_disco_disponible": 987654321
}
```

### 8. Limpiar Backups Antiguos

```bash
curl -X POST http://localhost/escuela_api/backup_api.php \
  -H "Content-Type: application/json" \
  -d '{"accion":"limpiar_backups_antiguos"}'
```

---

## ⏰ Automático (Backup Diario)

### Opción 1: Task Scheduler de Windows (Recomendado)

1. **Abre Task Scheduler:**
   - Presiona `Win + R`
   - Escribe `taskschd.msc`
   - Presiona Enter

2. **Crea una nueva tarea:**
   - Haz clic derecho en "Task Scheduler Library"
   - Selecciona "Create Basic Task"
   - Nombre: `Backup Escuela Automático`
   - Descripción: `Backup automático diario de la base de datos`

3. **Configura el disparo:**
   - Trigger: Daily
   - Hora: 02:00 (o la hora que prefieras)
   - Repetir cada: 1 día

4. **Configura la acción:**
   - Action: Start a program
   - Program: `C:\xampp\php\php.exe`
   - Arguments: `C:\xampp\htdocs\escuela_api\backup_automatico.php`
   - Start in: `C:\xampp\htdocs\escuela_api\`

5. **Haz clic en Finish**

### Opción 2: PowerShell Script

```powershell
# Ejecutar script PowerShell
powershell.exe -ExecutionPolicy Bypass -File "backup_automatico.ps1"
```

### Opción 3: Batch File (Más simple)

Crea `backup.bat`:
```batch
@echo off
C:\xampp\php\php.exe C:\xampp\htdocs\escuela_api\backup_automatico.php
pause
```

Ejecuta desde Task Scheduler o desde línea de comandos.

---

## 📊 Tablas de Backup Creadas

### historial_backup
Registra cada backup realizado:
```
id, nombre_backup, ruta_archivo, tipos_datos, cantidad_registros, 
tamanio_bytes, fecha_creacion, estado, descripcion
```

### backup_usuarios
Copia diaria de usuarios y credenciales:
```
usuario_id, rol_id, nombres, apellidos, email_matricula, 
rol_nombre, activo, fecha_original_creacion, fecha_original_ultimo_acceso
```

### backup_alumnos
Datos de alumnos respaldados:
```
alumno_id, nombres, apellidos, curp, grupo_id, grupo_nombre, 
semestre, estado, creditos_acumulados
```

### backup_calificaciones
Calificaciones parciales respaldadas:
```
alumno_id, alumno_nombre, materia_id, materia_nombre, parcial_numero,
calificacion, estado
```

### backup_kardex
Kardex (calificaciones finales) respaldado:
```
alumno_id, alumno_nombre, materia_id, materia_nombre, 
calificacion_final, estado
```

---

## 📁 Estructura de Archivos

```
api/
├── backup.php              # Funciones principales de backup
├── backup_api.php          # Endpoints REST para backup
├── backup_automatico.php   # Script para ejecución automática
├── backups/               # Carpeta con archivos JSON
│   ├── backup_escuela_2026-03-09_14-30-45.json
│   ├── backup_escuela_2026-03-08_02-00-00.json
│   └── ...
└── logs_backup/           # Logs de ejecución de backups
    ├── backup_2026-03-09.log
    └── ...
```

---

## 🔐 Seguridad

### Consideraciones Importantes

1. **Carpeta `backups/` no accesible por web** (configura .htaccess):
```apache
# .htaccess en api/backups/
<FilesMatch ".*">
    Order Deny,Allow
    Deny from all
</FilesMatch>
```

2. **Permisos de archivo:**
```bash
chmod 700 api/backups/
chmod 700 api/logs_backup/
```

3. **Credenciales:**
   - Los backups incluyen hashes de contraseña, no textos planos
   - Protege la carpeta `backups/` adecuadamente

---

## 🔄 Restauración de Datos

### Proceso Manual (Desde backup JSON)

1. Obtén el archivo JSON del backup
2. Usa el endpoint `/backup_api.php?accion=obtener_backup`
3. Restaura manualmente en phpMyAdmin si es necesario

### Proceso Automático

```bash
curl -X POST http://localhost/escuela_api/backup_api.php \
  -d '{"accion":"restaurar_backup","archivo":"backup_escuela_2026-03-09_14-30-45.json","tipos":["alumnos","calificaciones"]}'
```

---

## 📝 Logs y Monitoreo

Los logs se guardan en `api/logs_backup/backup_YYYY-MM-DD.log`:

```
[2026-03-09 02:00:00] === Iniciando backup automático diario ===
[2026-03-09 02:00:01] Iniciando realización de backup...
[2026-03-09 02:00:05] ✓ BIEN: Backup completado exitosamente
[2026-03-09 02:00:05]   - Nombre: backup_escuela_2026-03-09_02-00-05
[2026-03-09 02:00:05]   - Ruta: C:\xampp\htdocs\escuela_api\backups\backup_escuela_2026-03-09_02-00-05.json
[2026-03-09 02:00:05]   - Cantidad de registros: 150
[2026-03-09 02:00:05]   - Tamaño: 45.12 KB
```

---

## 🆘 Resolución de Problemas

### "Tabla no existe"
```sql
-- Ejecuta el script de creación de tablas
mysql -u root escuela_secundaria_tecnica_21 < database/crear_tabla_backup.sql
```

### "Permiso denegado en carpeta backups"
```powershell
# Windows - Dar permisos a la carpeta
icacls "C:\xampp\htdocs\escuela_api\backups" /grant:r "%USERNAME%":F
```

### "Task Scheduler no ejecuta el backup"
- Verifica que XAMPP esté iniciado
- Revisa los logs en `api/logs_backup/`
- Comprueba la ruta de php.exe

---

## 📊 Ejemplos de Uso en Flutter

```dart
// Crear backup desde la app
Future<void> crearBackup() async {
  final response = await http.post(
    Uri.parse('http://localhost/escuela_api/backup_api.php'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'accion': 'crear_backup'}),
  );
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print('Backup creado: ${data['nombre_backup']}');
  }
}

// Listar backups disponibles
Future<List<dynamic>> listarBackups() async {
  final response = await http.get(
    Uri.parse('http://localhost/escuela_api/backup_api.php?accion=listar_backups'),
  );
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['archivos_json'];
  }
  return [];
}
```

---

## 📅 Mantenimiento Recomendado

- **Semanal**: Verificar que los backups automáticos se ejecuten
- **Mensual**: Revisar logs y estadísticas
- **Trimestral**: Probar restauración de datos desde backup
- **Anual**: Archivar backups antiguos importantes

---

## ✅ Checklist de Instalación

- [ ] Ejecutar `crear_tabla_backup.sql`
- [ ] Copiar `backup.php` a XAMPP
- [ ] Copiar `backup_api.php` a XAMPP
- [ ] Copiar `backup_automatico.php` a XAMPP
- [ ] Crear carpeta `backups/`
- [ ] Crear carpeta `logs_backup/`
- [ ] Configurar Task Scheduler (o cron en Linux)
- [ ] Probar backup manual desde endpoint
- [ ] Verificar archivo JSON creado
- [ ] Revisar logs de ejecución

---

## 📞 Soporte

En caso de problemas:
1. Revisa los logs en `api/logs_backup/`
2. Verifica que MySQL esté ejecutándose
3. Comprueba que XAMPP esté iniciado
4. Revisa los permisos de carpetas

---

**Última actualización**: 09 de marzo de 2026
**Versión**: 1.0
