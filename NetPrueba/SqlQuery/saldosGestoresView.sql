create view saldosGestoresView as
SELECT sg.gestor_id, g.gestor, s.saldo
FROM dbo.SaldosGestores sg
         inner join dbo.Gestores g on g.gestor_id = sg.gestor_id
         inner join dbo.Saldos s on s.saldo_id = sg.saldo_id;