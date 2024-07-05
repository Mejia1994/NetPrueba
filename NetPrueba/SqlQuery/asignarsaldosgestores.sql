CREATE OR ALTER PROCEDURE [dbo].[asignarsaldosgestores]
AS
BEGIN
    DECLARE @saldosorden TABLE
                         (
                             saldo    DECIMAL(10, 2),
                             saldo_id INT
                         );

    DELETE FROM dbo.[SaldosGestores];

    INSERT INTO @saldosorden (saldo, saldo_id)
    SELECT saldo, saldo_id
    FROM dbo.saldos
    ORDER BY saldo DESC;

    DECLARE @totalsaldos INT = (SELECT COUNT(*) FROM @saldosorden);
    DECLARE @totalgestores INT = (SELECT COUNT(*) FROM dbo.gestores);
    DECLARE @iteracion INT = CEILING(CAST(@totalsaldos AS FLOAT) / @totalgestores);

    DECLARE @cursorGestores CURSOR;
    DECLARE @gestor_id INT;

    SET @cursorGestores = CURSOR FOR
        SELECT gestor_id FROM dbo.gestores;

    OPEN @cursorGestores;

    FETCH NEXT FROM @cursorGestores INTO @gestor_id;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            DECLARE @flag INT = 0;

            WHILE @flag < @iteracion
                BEGIN

                    DECLARE @saldo_id INT;
                    SELECT TOP 1 @saldo_id = saldo_id FROM @saldosorden ORDER BY saldo DESC;

                    INSERT INTO dbo.SaldosGestores (gestor_id, saldo_id)
                    VALUES (@gestor_id, @saldo_id);

                    DELETE FROM @saldosorden WHERE saldo_id = @saldo_id;

                    SET @flag = @flag + 1;
                END;

            FETCH NEXT FROM @cursorGestores INTO @gestor_id;
        END;

    CLOSE @cursorGestores;
    DEALLOCATE @cursorGestores;

    SELECT gestor_id, gestor, saldo
    FROM saldosGestoresView;
END;


