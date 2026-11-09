# Escuela Secundaria Técnica N° 21

Sistema de gestión escolar desarrollado en Flutter con base de datos PostgreSQL/MySQL.

## Características

### Sistema de Autenticación
- Inicio de sesión con matrícula/correo y contraseña
- El sistema determina automáticamente el rol del usuario (Administrador, Docente, Alumno)
- Sesiones seguras con validación de credenciales

### Roles y Permisos

#### Administrador
- **Credenciales por defecto:**
  - Email: `reyespucachac@gmail.com`
  - Contraseña: `reyespuc12`
- **Funcionalidades:**
  - Crear y gestionar cuentas de usuarios
  - Asignar roles (Administrador, Docente, Alumno)
  - Activar/desactivar usuarios
  - Gestión completa del sistema

#### Docente
- Acceso a su panel personalizado
- Gestión de calificaciones y parciales
- Registro de conducta y reportes
- Validación de asistencias

#### Alumno
- Consulta de calificaciones
- Visualización de kardex
- Acceso a reportes de conducta

## Estructura de Base de Datos

### Tablas Principales
- **grado**: Niveles escolares (1°, 2°, 3°)
- **grupo**: Grupos por grado (A, B, C, etc.)
- **materia**: Materias asignadas a cada grado
- **maestro**: Información de docentes
- **alumno**: Información de estudiantes
- **horario**: Horarios de clases
- **maestro\_materia\_horario**: Asignaciones M-M (un maestro puede tener muchas materias y horarios)
- **parcial**: Parciales 1, 2, 3 con opción de bloqueo temporal
- **calificacion\_parcial**: Calificaciones por parcial (permite NP, NO\_CURSADO, CALIFICADO)
- **kardex\_materia**: Calificaciones finales por materia
- **conducta\_reporte**: Reportes y conducta unificados
- **usuario** y **credencial**: Sistema de autenticación
- **expediente** y **justificante**: Gestión de justificantes validados por trabajo social

### Características del Modelo
- Relaciones Many-to-Many entre maestros, materias y horarios
- Restricción única: mismo maestro no puede tener misma materia en mismo horario
- Parciales con estados: NO\_CURSADO, NP (No Puntaje), CALIFICADO
- Bloqueo temporal de captura de calificaciones por parcial
- Sistema de roles para control de acceso

## Requisitos

- Flutter SDK 3.10.8 o superior
- Dart 3.10.8 o superior
- XAMPP (incluye Apache y MySQL)
- Dispositivo/emulador Android, iOS, o navegador web (Chrome)

## Instalación

### 1. Configurar la Base de Datos en XAMPP

**a) Iniciar XAMPP:**
- Abre XAMPP Control Panel
- Inicia **Apache** y **MySQL**

**b) Crear la base de datos:**
- Abre phpMyAdmin: `http://localhost/phpmyadmin`
- Ve a la pestaña **SQL**
- Copia y pega el contenido completo de `database/schema.sql`
- Clic en **Ejecutar**
- La base de datos `escuela_secundaria_tecnica_21` se creará con:
  - 16 tablas
  - Roles por defecto (Administrador, Docente, Alumno, Trabajo Social)
  - Usuario administrador: `reyespucachac@gmail.com` / `reyespuc12`
  - 3 parciales por defecto

### 2. Instalar API REST en XAMPP

**Los archivos ya están copiados en:** `C:\xampp\htdocs\escuela_api\`

**Para verificar que funciona:**
1. Abre en tu navegador: http://localhost/escuela_api/test.html
2. Clic en "Probar Login Admin"
3. Deberías ver una respuesta JSON exitosa

**Si los archivos NO están copiados:**
```powershell
Copy-Item -Path ".\api\*.php" -Destination "C:\xampp\htdocs\escuela_api\" -Force
```

### 3. Instalar Dependencias de Flutter

```bash
cd escuela_secundaria_tecnica_n_21
flutter pub get
```

### 4. Ejecutar el Proyecto

```bash
# Para web (Chrome) - recomendado para desarrollo
flutter run -d chrome

# Para emulador Android
flutter run

# Para dispositivo conectado
flutter run -d <device-id>
```

### 5. Iniciar Sesión

Usa las credenciales del administrador:
- **Correo:** reyespucachac@gmail.com
- **Contraseña:** reyespuc12

## Arquitectura

### Backend: API REST en PHP
- **Ubicación:** `C:\xampp\htdocs\escuela_api\`
- **Base URL:** http://localhost/escuela_api
- **Endpoints:**
  - `POST /auth.php` - Login de usuarios
  - `GET /usuarios.php` - Listar usuarios
  - `POST /usuarios.php` - Crear usuarios

### Frontend: Flutter
- Se conecta a la API PHP mediante HTTP
- Compatible con Web, Android, iOS y Desktop
- Usa paquete `http` para peticiones REST

**Modificar la URL de la API:**
Si cambias la ubicación de la API, edita [lib/database.dart](escuela_secundaria_tecnica_n_21/lib/database.dart):
```dart
static const String baseUrl = 'http://localhost/escuela_api';
```

## Desarrollo

### Estructura del Proyecto
```
lib/
  main.dart         # Punto de entrada, autenticación y paneles principales
  database.dart     # Cliente HTTP para consumir API REST

api/ (se copia a C:\xampp\htdocs\escuela_api\)
  config.php        # Configuración BD y CORS
  auth.php          # Endpoint de autenticación
  usuarios.php      # CRUD de usuarios
  test.html         # Página de prueba de la API

database/
  schema.sql        # Esquema completo de la base de datos MySQL
  verificar_datos.sql  # Script de verificación
```

### Estado Actual
- ✅ API REST en PHP
- ✅ Sistema de autenticación con MySQL vía HTTP
- ✅ Compatible con Flutter Web, Android, iOS y Desktop
- ✅ Usuario administrador predefinido
- ✅ Gestión de usuarios (crear, asignar roles, activar/desactivar)
- ✅ Paneles diferenciados por rol
- ✅ Esquema de BD completo con todas las tablas
- ✅ CORS configurado para desarrollo

### Próximas Funcionalidades
- [ ] CRUD completo para grados, grupos, materias y alumnos
- [ ] Gestión de horarios y asignaciones maestro-materia-horario
- [ ] Captura de calificaciones por parcial
- [ ] Generación de kardex
- [ ] Sistema de justificantes con trabajo social
- [ ] Reportes y estadísticas
- [ ] Exportación de datos
- [ ] Implementar hash de contraseñas (bcrypt/argon2)

## Notas de Seguridad

⚠️ **IMPORTANTE:** En producción:
- Cambiar la contraseña del usuario root de MySQL
- Implementar hash de contraseñas (actualmente en texto plano para desarrollo)
- Usar variables de entorno para credenciales de BD
- Habilitar HTTPS/SSL para conexiones

## Autor

Proyecto desarrollado para la Escuela Secundaria Técnica N° 21

## Licencia

Privado - Todos los derechos reservados

