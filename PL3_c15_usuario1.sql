-- Ejecutar desde usuario 1.
-- Este SQL no está pensado para ejecutarse directamente,
-- sino para ir copiando y pegando en la consola de PostgreSQL en su debido orden.
BEGIN;

CREATE TEMP TABLE IF NOT EXISTS vars_u1(
    nombre TEXT PRIMARY KEY,
    valor REAL NOT NULL
);
-- Secuencias 11-15
INSERT INTO vars_u1 VALUES ('z', (SELECT z FROM tabla3));
UPDATE vars_u1 SET valor = (SELECT (SELECT valor FROM vars_u1 WHERE nombre = 'z') - 100) WHERE nombre = 'z';
INSERT INTO vars_u1 VALUES ('y', (SELECT y FROM tabla2));
UPDATE vars_u1 SET valor = (SELECT (SELECT valor FROM vars_u1 WHERE nombre = 'z') / (SELECT valor FROM vars_u1 WHERE nombre = 'y')) WHERE nombre = 'y';
UPDATE tabla3 SET z = (SELECT valor FROM vars_u1 WHERE nombre = 'z');

-- Secuencia 18-21
INSERT INTO vars_u1 VALUES ('x', (SELECT x FROM tabla1));
UPDATE vars_u1 SET valor = (SELECT (SELECT valor FROM vars_u1 WHERE nombre = 'y') * (SELECT valor FROM vars_u1 WHERE nombre = 'z')) WHERE nombre = 'x';
UPDATE tabla1 SET x = (SELECT valor FROM vars_u1 WHERE nombre = 'x');
COMMIT;