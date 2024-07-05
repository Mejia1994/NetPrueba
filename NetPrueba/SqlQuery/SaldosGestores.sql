CREATE TABLE SaldosGestores (
    saldo_gestor_id INT IDENTITY(1,1) PRIMARY KEY,
    gestor_id INT,
    saldo_id INT,
    FOREIGN KEY (gestor_id) REFERENCES Gestores(gestor_id),
    FOREIGN KEY (saldo_id) REFERENCES Saldos(saldo_id),
);
