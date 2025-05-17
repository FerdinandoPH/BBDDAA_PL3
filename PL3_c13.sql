\c telpark

BEGIN;

INSERT INTO clientes VALUES(3, 'Pepe', 'Perez', 'pepito@example.ex', 918856931, 'Madrid');
INSERT INTO vehiculos VALUES(3, '0000PSS', 'Audi', 'A3', 'Blanco', 0);

SELECT * FROM clientes WHERE clienteid=0;
SELECT * FROM vehiculos WHERE vehiculoid=0;

SELECT * FROM pg_stat_activity WHERE state='idle' OR state='idle in transaction';