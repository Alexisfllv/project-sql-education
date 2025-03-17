

# EducationDB - Base de Datos para Gestión Educativa

## Descripción General
EducationDB es un esquema de base de datos diseñado para la gestión de usuarios, cursos, clases y asistencia dentro de una institución educativa. Su estructura permite registrar roles, inscripciones a cursos, asistencias a clases y calificaciones de los estudiantes.

## Estructura de la Base de Datos

### 1. Creación de la Base de Datos
```sql
drop database if exists education;
create database education;
use education;
```

### 2. Tablas Principales

#### Roles
Gestiona los roles dentro del sistema.
```sql
CREATE TABLE roles(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_nombre VARCHAR(60) NOT NULL
);
```

#### Usuarios
Almacena la información de los usuarios.
```sql
CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE
);
```

#### Cursos
Registra los cursos disponibles.
```sql
CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(100) UNIQUE NOT NULL,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    course_description VARCHAR(255) NOT NULL,
    course_start DATETIME NOT NULL,
    course_end DATETIME NOT NULL
);
```

#### Clases
Cada curso contiene múltiples clases.
```sql
CREATE TABLE classes(
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_description TEXT NOT NULL,
    class_start DATETIME NOT NULL,
    class_end DATETIME NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
```

### 3. Tablas Relacionales (N:M)

#### Registro de Usuarios en Cursos
Controla la inscripción de los usuarios en los cursos.
```sql
CREATE TABLE users_courses_registration(
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
```

#### Asistencia a Clases
Registra la asistencia de los usuarios a cada clase.
```sql
CREATE TABLE users_classes_attendances(
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    attendance_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    attendance_status ENUM('PRESENTE', 'TARDANZA', 'AUSENTE') NOT NULL DEFAULT 'PRESENTE',
    user_id INT NOT NULL,
    class_id INT NOT NULL,
    UNIQUE (user_id, class_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE
);
```

#### Notas de Usuarios en Cursos
Almacena las calificaciones obtenidas en cada curso.
```sql
CREATE TABLE users_courses_grades(
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    grade_score DECIMAL(5,2) NOT NULL,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
```

## Resumen
Este esquema proporciona una estructura robusta para la gestión de una plataforma educativa, permitiendo administrar usuarios, cursos, asistencia y calificaciones de manera eficiente.

📌 **Características Clave:**
- Administración de roles.
- Registro de usuarios y autenticación básica.
- Creación y gestión de cursos y clases.
- Inscripción de usuarios en cursos.
- Registro de asistencia y calificaciones.

