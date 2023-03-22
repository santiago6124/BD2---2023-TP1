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
