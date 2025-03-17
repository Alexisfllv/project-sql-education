-- creacion de base de datos , EstudianteDB

drop database if exists education;

create database education;
use education;


-- roles
CREATE TABLE roles(
	role_id INT PRIMARY KEY AUTO_INCREMENT,
	role_nombre VARCHAR(60) NOT NULL
);

-- usuarios
CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(100) NOT NULL ,
	user_email VARCHAR(100) UNIQUE NOT NULL,
	user_password VARCHAR(255) NOT NULL,
	-- fk
	role_id INT,
	FOREIGN KEY (role_id) REFERENCES roles (role_id)
	ON DELETE CASCADE
);
-- cursos
CREATE TABLE courses(
	course_id int PRIMARY KEY AUTO_INCREMENT,
	course_code VARCHAR(100) UNIQUE NOT NULL,
    course_name VARCHAR(100) UNIQUE NOT NULL,
	course_description VARCHAR(255) NOT NULL,
    course_start DATETIME NOT NULL,
    course_end DATETIME NOT NULL
);

-- clases
CREATE TABLE classes(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
	class_description TEXT NOT NULL,
	class_start DATETIME NOT NULL,
	class_end DATETIME NOT NULL,
	-- fk
	course_id INT NOT NULL,
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
	ON DELETE CASCADE 	
);

-- tablas n:m

-- usuarios_cursos
CREATE TABLE users_courses_registration(
	registration_id INT PRIMARY KEY auto_increment,
	registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	user_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE (user_id, course_id),  -- CLAVE COMPUESTA
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);


-- usuarios,clases, asistencias
CREATE TABLE users_classes_attendances(
	attendance_id INT PRIMARY KEY AUTO_INCREMENT,
	attendance_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    attendance_status ENUM('PRESENTE', 'TARDANZA', 'AUSENTE') NOT NULL DEFAULT 'PRESENTE',
	-- fk
	user_id INT NOT NULL,
	class_id INT NOT NULL,
    UNIQUE (user_id , class_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)ON DELETE CASCADE,
	FOREIGN KEY (class_id) REFERENCES classes (class_id)ON DELETE CASCADE	
);

-- usuarios,cursos,notas
CREATE TABLE users_courses_grades(
	grade_id INT PRIMARY KEY AUTO_INCREMENT,
	grade_score DECIMAL(5,2) NOT NULL,
	-- fk
	user_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE (user_id,course_id), -- UNIQUE COMPUESTA
	FOREIGN KEY (user_id) REFERENCES users (user_id)ON DELETE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses (course_id)ON DELETE CASCADE	
);

-- 

