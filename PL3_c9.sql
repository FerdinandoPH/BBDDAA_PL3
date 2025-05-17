-- Ejecutar como usuario2
\c telpark

SELECT * FROM clientes WHERE clienteid=0;
SELECT * FROM vehiculos WHERE vehiculoid=0;

\q

-- ver como SU
SELECT * FROM pg_stat_activity WHERE state='idle' OR state='idle in transaction';