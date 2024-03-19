USE project_module3;

CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(50),
    contrasena VARCHAR(70),
    saldo DECIMAL(10, 2)
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(5)
);

CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

INSERT INTO Usuario (user_id, nombre, correo_electronico, contrasena, saldo)
VALUES
    (1, 'Juan Pérez', 'juan@example.com', 'contraseña1', 1000.00),
    (2, 'María López', 'maria@example.com', 'contraseña2', 2000.00),
    (3, 'Carlos Martínez', 'carlos@example.com', 'contraseña3', 1500.00),
    (4, 'Ana Rodríguez', 'ana@example.com', 'contraseña4', 1800.00),
    (5, 'Luisa García', 'luisa@example.com', 'contraseña5', 2200.00),
    (6, 'Pedro Sánchez', 'pedro@example.com', 'contraseña6', 1900.00),
    (7, 'Laura Fernández', 'laura@example.com', 'contraseña7', 2500.00),
    (8, 'Pablo González', 'pablo@example.com', 'contraseña8', 2300.00),
    (9, 'Sofía Pérez', 'sofia@example.com', 'contraseña9', 2700.00),
    (10, 'Daniel Ramírez', 'daniel@example.com', 'contraseña10', 2100.00);
    
    
INSERT INTO Moneda (currency_id, currency_name, currency_symbol)
VALUES
    (1, 'Dólar', 'USD'),
    (2, 'Euro', 'EUR'),
    (3, 'Libra esterlina', 'GBP'),
    (4, 'Yen', 'JPY'),
    (5, 'Peso mexicano', 'MXN'),
    (6, 'Franco suizo', 'CHF'),
    (7, 'Dólar canadiense', 'CAD'),
    (8, 'Yuan chino', 'CNY'),
    (9, 'Rupia india', 'INR'),
    (10, 'Dólar australiano', 'AUD');
    

INSERT INTO Transaccion (transaction_id, sender_user_id, receiver_user_id, importe, currency_id)
VALUES
    (1, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 1),
    (2, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 2),
    (3, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 3),
    (4, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 4),
    (5, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 5),
    (6, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 6),
    (7, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 7),
    (8, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 8),
    (9, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 9),
    (10, FLOOR(RAND() * 10) + 1, FLOOR(RAND() * 10) + 1, ROUND(RAND() * 1000, 2), 10);


SELECT m.currency_name
FROM Usuario u
JOIN Transaccion t ON u.user_id = t.sender_user_id OR u.user_id = t.receiver_user_id
JOIN Moneda m ON t.currency_id = m.currency_id
WHERE u.user_id = 1;


SELECT *
FROM Transaccion;

SELECT *
FROM Transaccion
WHERE sender_user_id = 2 OR receiver_user_id = 2
ORDER BY importe DESC;

UPDATE Usuario
SET correo_electronico = 'correo_modificado@modulo3.com'
WHERE user_id = 5;

SELECT correo_electronico
FROM Usuario
WHERE user_id = 5;

DELETE FROM Transaccion
WHERE transaction_id = 9;

SELECT *
FROM Transaccion;


