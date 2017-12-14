

------------------------------Busca un Objeto dentro de la BBDD------------------------------------------------------
SELECT
      so.name,
     sc.text
FROM
     sysobjects so 
INNER JOIN syscomments sc ON 
      so.id = sc.id
WHERE
      upper(sc.text) LIKE '%id_eval_version%';
      
 ----------------------------------Busca en el modelo en nombre de campo descrito-----------------------------------------------------     
      SELECT t.name AS table_name,
SCHEMA_NAME(schema_id) AS schema_name,
c.name AS column_name
FROM sys.tables AS t
INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE '%id_eval_version%'
ORDER BY schema_name, table_name;

----------------------------------Catalogo e Indices----------------------------------------------------------------------------------------------------------

DBCC SHOW_STATISTICS ('tbl_revision',PK_tbl_revision)
WITH STAT_HEADER


SELECT NAME,indid,rowmodctr
FROM sys.sysindexes s
WHERE s.id= OBJECT_ID('tbl_revision');