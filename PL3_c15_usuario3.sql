-- Ejecutar desde usuario 3.
-- Este SQL no está pensado para ejecutarse directamente,
-- sino para ir copiando y pegando en la consola de PostgreSQL en su debido orden.
BEGIN;

CREATE TEMP TABLE IF NOT EXISTS vars_u3(
    nombre TEXT PRIMARY KEY,
    valor REAL NOT NULL
);

-- Secuencias 4-6

INSERT INTO vars_u3 VALUES ('x', (SELECT x FROM tabla1));


UPDATE vars_u3 SET valor = (SELECT (SELECT valor FROM vars_u3 WHERE nombre = 'x') + 20) WHERE nombre = 'x';

UPDATE tabla1 SET x = (SELECT valor FROM vars_u3 WHERE nombre = 'x');

-- Secuencias 8-10

INSERT INTO vars_u3 VALUES ('y', (SELECT y FROM tabla2));

UPDATE vars_u3 SET valor = (SELECT (SELECT valor FROM vars_u3 WHERE nombre = 'y') * 20 + (SELECT valor FROM vars_u3 WHERE nombre = 'x')) WHERE nombre = 'y';

UPDATE tabla2 SET y = (SELECT valor FROM vars_u3 WHERE nombre = 'y');

-- Secuencia 23


COMMIT;