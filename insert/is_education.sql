-- INSERCION DE DATOS DBESTUDIANTES

-- Insertar roles
INSERT INTO roles (role_nombre) VALUES 
('Admin'), 
('Profesor'), 
('Estudiante');

select * from roles;

-- Insertar usuarios
INSERT INTO users (user_name, user_email, user_password, role_id) VALUES 
('Juan Perez', 'juan@example.com', 'password123', 1),
('Maria Lopez', 'maria@example.com', 'password123', 2),
('Carlos Sanchez', 'carlos@example.com', 'password123', 3),
('Ana Torres', 'ana@example.com', 'password123', 3);

select * from users;

-- Insertar cursos
INSERT INTO courses (course_code, course_name, course_description, course_start, course_end) VALUES 
('CS101', 'Introducción a la Programación', 'Curso básico de programación en Java', '2024-03-01 08:00:00', '2024-06-01 18:00:00'),
('DB202', 'Bases de Datos', 'Fundamentos de SQL y diseño de bases de datos', '2024-04-01 09:00:00', '2024-07-01 19:00:00');

select * from courses;

-- Insertar clases
INSERT INTO classes (class_description, class_start, class_end, course_id) VALUES 
('Clase 1: Variables y estructuras de control', '2024-03-02 10:00:00', '2024-03-02 12:00:00', 1),
('Clase 2: POO en Java', '2024-03-09 10:00:00', '2024-03-09 12:00:00', 1),
('Clase 1: Introducción a SQL', '2024-04-02 11:00:00', '2024-04-02 13:00:00', 2);

select * from classes;

-- Inscribir usuarios en cursos
INSERT INTO users_courses_registration (user_id, course_id) VALUES 
(3, 1), -- Carlos en Introducción a la Programación
(4, 1), -- Ana en Introducción a la Programación
(3, 2); -- Carlos en Bases de Datos

select * from users_courses_registration ;

-- Registrar asistencias
INSERT INTO users_classes_attendances (user_id, class_id, attendance_status) VALUES 
(3, 1, 'PRESENTE'),
(3, 2, 'TARDANZA'),
(4, 1, 'AUSENTE');

select * from users_classes_attendances;

-- Registrar calificaciones
INSERT INTO users_courses_grades (user_id, course_id, grade_score) VALUES 
(3, 1, 15.5),
(4, 1, 12.0),
(3, 2, 18.0);


select * from users_courses_grades;












