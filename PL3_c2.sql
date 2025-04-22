\c telpark

BEGIN;

INSERT INTO clientes VALUES (1, 'Fulanito', 'De Tal', 'fulanito.detal@gmail.com', 987654321, 'Madrid');
INSERT INTO vehiculos VALUES (1, '0000BBB', 'Renault', 'Espace', 'Rojo', 1);

COMMIT;