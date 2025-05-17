\c telpark

BEGIN;

INSERT INTO clientes VALUES(0, 'Fulano', 'Fualnez', 'fualnito@example.ex', 918856931, 'Madrid');
INSERT INTO vehiculos VALUES(0, '1234MMG', 'Audi', 'A3', 'Negro', 0);

SELECT * FROM clientes WHERE clienteid=0;
SELECT * FROM vehiculos WHERE vehiculoid=0;

SELECT * FROM pg_stat_activity WHERE state='idle' OR state='idle in transaction';