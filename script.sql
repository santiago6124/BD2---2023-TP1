drop database if EXISTS Pelu;
CREATE database Pelu;

CREATE TABLE Peluquero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255)
);

CREATE TABLE Estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE Sucursal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(255)
);

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255)
);

CREATE TABLE Estilo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE Contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(255),
    numeroTelefono VARCHAR(255)
);

CREATE TABLE Cita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FechaHora DATETIME,
    Peluquero_id INT,
    cliente_id INT,
    sucursal_id INT,
    estado_id INT,
    FOREIGN KEY (Peluquero_id) REFERENCES Peluquero(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id),
    FOREIGN KEY (estado_id) REFERENCES Estado(id)
);

CREATE TABLE Servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    precio INT,
    descripcion VARCHAR(255)
);

CREATE TABLE CitaServicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT,
    servicio_id INT,
    FOREIGN KEY (cita_id) REFERENCES Cita(id),
    FOREIGN KEY (servicio_id) REFERENCES Servicio(id)
);

CREATE TABLE EstiloCliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estilo_id INT,
    cliente_id INT,
    FOREIGN KEY (estilo_id) REFERENCES Estilo(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE ContactoCliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contacto_id INT,
    cliente_id INT,
    FOREIGN KEY (contacto_id) REFERENCES Contacto(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);


-- Inserts para la tabla Peluquero
INSERT INTO Peluquero (id, nombre, apellido) VALUES
(1, 'Juan', 'Pérez'),
(2, 'María', 'García'),
(3, 'Pedro', 'Sánchez'),
(4, 'Laura', 'López'),
(5, 'Carlos', 'Fernández');

-- Inserts para la tabla Estado
INSERT INTO Estado (id, estado, descripcion) VALUES
(1, 'Agendada', 'La cita ha sido agendada.'),
(2, 'Cancelada', 'La cita ha sido cancelada.'),
(3, 'Completada', 'La cita ha sido completada.');

-- Inserts para la tabla Sucursal
INSERT INTO Sucursal (id, nombre, direccion, telefono) VALUES
(1, 'Sucursal A', 'Av. Principal 123', '+1 123-456-7890'),
(2, 'Sucursal B', 'Calle Secundaria 456', '+1 234-567-8901'),
(3, 'Sucursal C', 'Plaza Principal 789', '+1 345-678-9012'),
(4, 'Sucursal D', 'Avenida Secundaria 012', '+1 456-789-0123'),
(5, 'Sucursal E', 'Callejón Oscuro 345', '+1 567-890-1234');

-- Inserts para la tabla Cliente
INSERT INTO Cliente (id, nombre, apellido) VALUES
(1, 'Luis', 'González'),
(2, 'Ana', 'Martínez'),
(3, 'Roberto', 'Jiménez'),
(4, 'Carla', 'Ruiz'),
(5, 'Mario', 'Castillo');

-- Inserts para la tabla Estilo
INSERT INTO Estilo (id, nombre, descripcion) VALUES
(1, 'Corte clásico', 'Corte de cabello tradicional.'),
(2, 'Corte moderno', 'Corte de cabello a la moda.'),
(3, 'Peinado formal', 'Peinado elegante para ocasiones especiales.'),
(4, 'Peinado casual', 'Peinado informal para el día a día.'),
(5, 'Barba y bigote', 'Recorte y cuidado de la barba y el bigote.');

-- Inserts para la tabla Contacto
INSERT INTO Contacto (id, mail, numeroTelefono) VALUES
(1, 'juan@example.com', '+1 123-456-7890'),
(2, 'maria@example.com', '+1 234-567-8901'),
(3, 'pedro@example.com', '+1 345-678-9012'),
(4, 'laura@example.com', '+1 456-789-0123'),
(5, 'carlos@example.com', '+1 567-890-1234');

-- Inserts para la tabla Cita
INSERT INTO Cita (id, FechaHora, Peluquero_id, cliente_id, sucursal_id, estado_id) VALUES
(1, '2023-03-24 09:00:00', 1, 1, 1, 3),
(2, '2023-03-25 10:00:00', 2, 2, 2, 3),
(3, '2023-02-26 11:00:00', 3, 3, 3, 3),
(4, '2023-02-27 12:00:00', 4, 4, 4, 3),
(5, '2023-02-28 13:00:00', 5, 5, 5, 2);

-- Inserts para la tabla Servicio
INSERT INTO Servicio (id, nombre, precio, descripcion) VALUES
(1, 'Corte de cabello', 200, 'Corte de cabello básico.'),
(2, 'Peinado', 150, 'Peinado sencillo.'),
(3, 'Tinte de cabello', 300, 'Tinte para cabello de cualquier color.'),
(4, 'Afeitado', 100, 'Afeitado clásico.'),
(5, 'Tratamiento capilar', 500, 'Tratamiento para hidratar y fortalecer el cabello.');

-- Inserts para la tabla CitaServicio
INSERT INTO CitaServicio (id, cita_id, servicio_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Inserts para la tabla EstiloCliente
INSERT INTO EstiloCliente (id, estilo_id, cliente_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Inserts para la tabla ContactoCliente
INSERT INTO ContactoCliente (id, contacto_id, cliente_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- queries
SELECT Sucursal.nombre AS Sucursal, 
       COUNT(CASE WHEN Cita.FechaHora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() THEN Cita.id END) AS CitasReservadas, 
       COUNT(CASE WHEN Cita.FechaHora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() AND Cita.Estado_id = 2 THEN Cita.id END) AS CitasCompletadas, 
       COUNT(CASE WHEN Cita.FechaHora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() AND Cita.Estado_id = 3 THEN Cita.id END) AS CitasCanceladas,
       COUNT(CASE WHEN Cita.FechaHora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() AND Cita.Estado_id = 3 THEN Cita.id END) / COUNT(CASE WHEN Cita.FechaHora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() THEN Cita.id END) * 100 AS PorcentajeCanceladas
FROM Cita
JOIN Sucursal ON Cita.Sucursal_id = Sucursal.id
GROUP BY Sucursal.nombre;

