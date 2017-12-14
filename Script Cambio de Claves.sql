declare @claveencriptada as varchar(100)
set @claveencriptada = upper(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('sha1', '12345678')), 3, 40))

UPDATE BASE_personal
SET
      PASSWORD = @claveencriptada
      where rut_funcionario IN('admin','1-9','2-7','3-5','0-0','4-5')
