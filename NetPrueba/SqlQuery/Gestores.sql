CREATE TABLE Gestores (
    gestor_id INT IDENTITY(1,1) PRIMARY KEY,
    gestor NVARCHAR(50)
);

INSERT INTO Gestores (gestor)
VALUES ('Gestor 01'), ('Gestor 02'), ('Gestor 03'), ('Gestor 04'), ('Gestor 05'),
       ('Gestor 06'), ('Gestor 07'), ('Gestor 08'), ('Gestor 09'), ('Gestor 10');