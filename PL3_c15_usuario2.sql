-- Ejecutar desde usuario 2.
-- Este SQL no está pensado para ejecutarse directamente,
-- sino para ir copiando y pegando en la consola de PostgreSQL en su debido orden.
BEGIN;

CREATE TEMP TABLE IF NOT EXISTS vars_u2(
    nombre TEXT PRIMARY KEY,
    valor REAL NOT NULL
);
-- Secuencias 1-3
INSERT INTO vars_u2 VALUES ('y', (SELECT y FROM tabla2));
INSERT INTO vars_u2 VALUES ('z', (SELECT z FROM tabla3));
UPDATE vars_u2 SET valor = (SELECT (SELECT y FROM tabla2) / (SELECT z FROM tabla3)) WHERE nombre = 'y';


-- Secuencia 7

UPDATE tabla2 SET y = (SELECT valor FROM vars_u2 WHERE nombre = 'y');

-- Secuencia 16 y 17
UPDATE vars_u2 SET valor = (SELECT (SELECT y FROM vars_u2 WHERE nombre = 'y') + 100) WHERE nombre = 'z';
UPDATE tabla3 SET z = (SELECT valor FROM vars_u2 WHERE nombre = 'z');

-- Secuencia 22
COMMIT;