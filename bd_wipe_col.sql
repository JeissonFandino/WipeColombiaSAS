-- Active: 1651680895389@@127.0.0.1@3306@bd_wipe_col
SHOW DATABASES;
CREATE DATABASE bd_wipe_col;
USE bd_wipe_col;
CREATE TABLE rol(
    idrol INT(15) NOT NULL,
    rol VARCHAR(20) NOT NULL, 
    crearUsuarios ENUM("p", "b") NOT NULL,
    registrarProductos ENUM("p", "b") NOT NULL,
    generarReportes ENUM("p", "b") NOT NULL,
    facturar ENUM("p", "b") NOT NULL,
    buscar ENUM("p", "b") NOT NULL,
    bloquearVendedor ENUM("p", "b") NOT NULL,
    editarProductos ENUM("p", "b") NOT NULL,
    PRIMARY KEY(idrol)
);
CREATE TABLE tb_login(
    usuario VARCHAR(20) NOT NULL, 
    contraseña VARCHAR(20) NOT NULL, 
    idrol INT(15) NOT NULL,
    PRIMARY KEY(usuario), 
    FOREIGN KEY(idrol) REFERENCES rol(idrol) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE factura(
    id INT(15) NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL, 
    usuario VARCHAR(20) NOT NULL, 
    documentoCliente INT(15) NOT NULL,
    nombreCliente VARCHAR(30) NOT NULL,  
    telefonoCliente INT(20) NOT NULL, 
    idProducto INT(15) NOT NULL, 
    nombreProducto VARCHAR(50) NOT NULL, 
    descripcionProducto TEXT(255) NOT NULL,
    valorProducto INT(20) NOT NULL, 
    cantidadProducto INT(4) NOT NULL, 
    valorTotal INT(20) NOT NULL, 
    metodoPago VARCHAR(50) NOT NULL, 
    PRIMARY KEY(id),
    FOREIGN KEY(usuario) REFERENCES tb_login(usuario) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos(
    id INT(15) NOT NULL, 
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT(255) NOT NULL,
    valor INT(20) NOT NULL, 
    cantidad INT(4) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE cliente(
    documento INT(15) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono INT(20) NOT NULL, 
    PRIMARY KEY(documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE detalle(
    id INT(15) NOT NULL AUTO_INCREMENT,
    idProducto INT(15) NOT NULL,
    idFactura INT(15) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE detalle ADD FOREIGN KEY(idFactura) REFERENCES factura(id); 

ALTER TABLE detalle ADD FOREIGN KEY(idProducto) REFERENCES productos(id); 

ALTER TABLE factura ADD FOREIGN KEY(documentoCliente) REFERENCES cliente(documento); 




