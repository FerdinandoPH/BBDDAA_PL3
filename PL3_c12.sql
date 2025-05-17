-- Ejecutar como usuario1, usuario2 o usuario3
\c telpark

BEGIN;

INSERT INTO clientes VALUES(1, 'Mengano', 'Menganez', 'menganito@example.ex', 918856931, 'Cantabria');

INSERT INTO vehiculos VALUES(1, '6789HPT', 'Renault', 'Scenic', 'Rojo', 1);

UPDATE vehiculos WHERE vehiculoid = 1 SET matricula = '1234MMG';

INSERT INTO clientes VALUES(2, 'Zutano', 'Zutanez', 'zutanito@example.ex', 987651234, 'Madrid');

INSERT INTO vehiculos VALUES(2, '4567HPG', 'Seat', 'Panda', 'Blanco', 2);

COMMIT;

SELECT * FROM clientes;
SELECT * FROM vehiculos;
