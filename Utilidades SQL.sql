-- ADD LINK SERVER -----------------------------------------------------------------------------------------
EXEC sp_addlinkedserver
@server='DLLMSAPP',
@srvproduct='',
@provider='SQLNCLI',
@datasrc='192.168.0.144'

EXEC sp_addlinkedsrvlogin 'DLLMSAPP',
'false', NULL, 'DB_Reports', 'DL1report5'

select * from dllmsapp.dllms.dbo.clientm


-------------------------- SHA-1 ----------------------------------------------------------------------------------
UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA1', replace('TEXTOENCRIPT',' ',''))), 3, 40))

------------------------------Busca una Tabla dentro de la BBDD------------------------------------------------------

SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE '%log%'

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


------------------------ CURSOR X ------------------------------------------------------------------------------------------------
DECLARE curso CURSOR FOR
	SELECT id FROM tabla
OPEN curso
FETCH NEXT FROM curso INTO @id
WHILE @@FETCH_STATUS = 0
	BEGIN
				
		FETCH NEXT FROM curso INTO @id
	END 
CLOSE curso
DEALLOCATE curso

----------------------------Reiniciar id primario de una tabla---------------------------------------------------
DBCC CHECKIDENT (<nombre_tabla>, RESEED,0)
