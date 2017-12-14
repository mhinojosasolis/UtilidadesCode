rem Nos devuelve el número de carácteres de una cadena
len(cadena)

rem Divide una cadena en varias usando un carácter separador.
split(cadena,separador)

rem Devuelve una subcadena de otra, empezando por inicio y de longitud longitud.
mid(cadena, inicio, longitud)

rem Elimina los espacios iniciales y finales de una cadena.
trim(cadena)

rem Busca la cadena2 dentro de cadena1 indicándonos la posición en la que se encuentra.
instr(cadena1, cadena2)

rem Reemplaza la cadena1 por la cadena2 en el texto.
replace(texto, cadena1, cadena2)

rem Devuelve los num caracteres de cadena empezando por la izquierda.
left(cadena, num)

rem Parseo a INT'
cInt(expression)

rem es similar a Cint en que aceptará nada más y tratar de convertirlo 
rem en un número de tipo individual. Esta función también devolverá un error por algo que no es numérico.'
cSng(expression)

rem Parse a doble'
cDbl(expression)

rem Parse a String'
CStr(expression)

rem ////////////////////TRABAJO CON FECHAS ////////////////////////////////////////
rem Fecha y Hora
<%= Now() %>

rem Únicamente la Fecha	
<%= Date() %>	

rem Únicamente la hora actual
<%= Time() %>	

rem Asignamos el valor de Now() en una variable, para modificarla con diversas funciones a continuación.
<% Dim Actual 
Actual = Now() %>

<%= FormatDateTime(Actual, 1) %>	'Muestra la fecha asignada en formato alfanumérico, incluyendo el nombre del día de la semana
<%= FormatDateTime(Actual, 2) %>	'Muestra la fecha asignada en formato numérico
<%= FormatDateTime(Actual, 3) %>	'Muestra hora, minutos, segundos y tiempo del meridiano de la fecha asignada
<%= FormatDateTime(Actual, 4) %>	'Hora y minutos únicamente de la fecha asignada
<%= Year(Actual) %>	'El año de la fecha asignada
<%= Month(Actual) %>	'Dato numérico del mes de la fecha asignada
<%= MonthName(Month(Actual)) %>	'Nombre del mes de la fecha asignada
<%= MonthName(Month(Actual), 1) %>	'Nombre corto del mes de la fecha asignada
<%= Day(Actual) %>	'Dato numérico del día de la fecha asignada
<%= WeekDay(Actual) %>	'Dato numérico del día de la semana de la fecha asignada
<%= WeekDayName(WeekDay(Actual)) %>	'Nombre del día de la semana de la fecha asignada
<%= WeekDayName(WeekDay(Actual), 1) %>	'Nombre corto del día de la semana de la fecha asignada
<%= Minute(Actual) %>	'Valor numérico del minuto de la fecha asignada
<%= Second(Actual) %>	'Valor numérico del segundo de la fecha asignada
<%= DateAdd("d", 1, Actual) %>	'Fecha y hora del día siguiente a la fecha asignada.
<%= DateAdd("d", -1, Actual) %>	'Fecha y hora del día anterior a la fecha asignada
<%= DateDiff("d", Actual, "3/9/2003") %>	'Días de diferencia entre 2 fechas. En este caso, los días hasta mi próximo cumpleaños.
<%= Day(Actual) & "/" & Month(Actual) & "/" & Year(Actual) %>	'Modificación de los valores de la fecha seleccionada para mostrarla en el formato dd/mm/aa
<%= WeekDayName(WeekDay(Actual)) & ", " & Day(Actual) & " " & MonthName(Month(Actual)) & ", " & Year(Actual) %>	'Otra modificación para mostrar la fecha seleccionada en el formato dd/mm/aa, incluyendo el nombre del día de la semana y el nombre del mes.
<% Dim Actual 
Actual = CDate("01/01/2001") %>	'Convierte una cadena de texto en un dato de fecha
<% = IsDate("01/01/2001") %>	'Función que retorna un valor booleano si el dato que manipula es una fecha.




rem /////////////////EJEMPLO DE FUNCIONES///////////////////



rem Funciones con cadenas

rem Abajo tienes una lista de las funciones más utilizadas para manipular cadenas. 

InStr() 

Sintaxis: InStr(CadenaABuscar, CadenaAEncontrar)
rem La función devolverá la posición de la primera ocurrencia de CadenaAEncontrar dentro de CadenaABuscar
rem La función devolverá 0 si la CadenaAEncontrar no se encuentra.

rem Ejemplo 1:

<%
Cadena1="michael"
Cadena2="wall"
If InStr(Cadena1,Cadena2)>0 then
Response.write("Cadena1 contiene Cadena2")
Else
Response.write("Cadena1 no contiene a Cadena2")
End if
%>


rem Ejemplo 2: 

<%
Cadena1="Me costó cuatro años de trabajo"
Cadena2="e"
Posicion= Instr(Cadena1,Cadena2)
response.write Posicion
%>

rem El resultado mostrado será: 2

rem También puedes establecer la posición de inicio de búsqueda (si se omite se produce la búsqueda desde el primera carácter).

rem Ejemplo 3: 

<%
Cadena1="Me costó cuatro años de trabajo"
Cadena2="c"
Posicion= Instr(6,Cadena1,Cadena2)
response.write Posicion
%> 

rem El resultado mostrado será: 10 


rem --------------------------------------------------------------------------------

Left()

Sintaxis: Left(Cadena, NumDeCaracteres) 
rem La función devolverá el número de caracteres estipulado. Empieza a contar desde la izquierda.

rem Ejemplo:

<%
Cadena1="michael"
response.write("Los 3 primeros caracteres de mi nombre son " & Left(Cadena1,2))
%>

rem El resultado mostrado será:

rem Los 3 primeros caracteres de mi nombre son mic 

rem Recuerda que el primer carácter se indexa como 0, así que m sería el carácter 0 y c el 2.


rem --------------------------------------------------------------------------------
Right()

Right realiza la misma función que Left, sólo que empieza a contar por la derecha.


rem --------------------------------------------------------------------------------

Len()

Sintaxis: Len(Cadena) 
rem Esta función simplemente devuelve la longitud de la cadena.

Ejemplo1:

<%
Cadena1="michael"
Response.write Len(Cadena1)
%>

rem El resultado mostrado será: 7

rem * Esta función indexa empezando desde el número 1.

rem Ejemplo2:

<%
Cadena1="michael"
Response.write Left(Cadena1,Len(Cadena1)-4)
%>

rem El ejemplo anterior, coge la cadena1, y toma un número de caracteres igual a su longitud menos 4.

rem El resultado mostrado será: mic




rem --------------------------------------------------------------------------------

Replace() 

rem Función que permite reemplazar caracteres en una cadena.

Sintaxis: Replace(CadenaABuscar, CadenaAEncontrar, Remplazo) 

rem CadenaABuscar es la cadena origen y la CadenaAEncontrar es la que se buscará en el origen. 

rem Todas las ocurrencias (CadenaAencontrar) encontradas en la cadena origen (CadenaABuscar) serán reemplazadas por Reemplazo

rem Ejemplo:
<% 
Cadena1="My_Name_is_Michael"
Response.write (Replace(Cadena1,"_"," "))
%>

rem El resultado mostrado será:
rem My Name is Michael


rem --------------------------------------------------------------------------------

LCase(), UCase()

rem Funciones que permiten convertir los caracteres de una cadena a mayúsculas y minúsculas.

rem Ejemplo 1:

<%
myName = "MICHAEL"
Response.Write(LCase(myName)) 
%> 

rem El resultado mostrado será: michael

rem Ejemplo2: 

<% 
myNAME = "michael"
Response.Write(UCase(myName)) 
%> 

rem El resultado mostrado será: MICHAEL 




rem --------------------------------------------------------------------------------
Mid()

Sintaxis: Mid(Cadena, Inicio, Longitud)

rem La función devolverá el número requerido de caracteres de una cadena a partir de un determinado carácter de inicio.
rem La longitud es opcional. Si se deja vacío este campo, la función devolverá todos los caracteres a partir de "inicio"

rem Ejemplo:

<%
Cadena1="michael"
Response.write Mid(Cadena1,3,3)
%>

rem El resultado mostrado será: cha 





rem -----------------------------------------------------------------------------------------------

rem funcion para convertir a csv
<%
sub Write_CSV_From_Recordset(RS)

    '
    ' Export Recordset to CSV
    ' http://salman-w.blogspot.com/2009/07/export-recordset-data-to-csv-using.html
    '
    ' This sub-routine Response.Writes the content of an ADODB.RECORDSET in CSV format
    ' The function closely follows the recommendations described in RFC 4180:
    ' Common Format and MIME Type for Comma-Separated Values (CSV) Files
    ' http://tools.ietf.org/html/rfc4180
    '
    ' @RS: A reference to an open ADODB.RECORDSET object
    '

    if RS.EOF then
    
        '
        ' There is no data to be written
        '
        exit sub
    
    end if

    dim RX
    set RX = new RegExp
        RX.Pattern = "\r|\n|,|"""

    dim i
    dim Field
    dim Separator

    '
    ' Writing the header row (header row contains field names)
    '

    Separator = ""
    for i = 0 to RS.Fields.Count - 1
        Field = RS.Fields(i).Name
        if RX.Test(Field) then
            '
            ' According to recommendations:
            ' - Fields that contain CR/LF, Comma or Double-quote should be enclosed in double-quotes
            ' - Double-quote itself must be escaped by preceeding with another double-quote
            '
            Field = """" & Replace(Field, """", """""") & """"
        end if
        Response.Write Separator & Field
        Separator = ","
    next
    Response.Write vbNewLine

    '
    ' Writing the data rows
    '

    do until RS.EOF
        Separator = ""
        for i = 0 to RS.Fields.Count - 1
            '
            ' Note the concatenation with empty string below
            ' This assures that NULL values are converted to empty string
            '
            Field = RS.Fields(i).Value & ""
            if RX.Test(Field) then
                Field = """" & Replace(Field, """", """""") & """"
            end if
            Response.Write Separator & Field
            Separator = ","
        next
        Response.Write vbNewLine
        RS.MoveNext
    loop

end sub

'
' EXAMPLE USAGE
'
' - Open a RECORDSET object (forward-only, read-only recommended)
' - Send appropriate response headers
' - Call the function
'

dim RS1
set RS1 = Server.CreateObject("ADODB.RECORDSET")
    RS1.Open "SELECT * FROM TABLE_NAME_HERE", "CONNECTION_STRING_HERE", 0, 1

Response.ContentType = "text/csv"

Response.AddHeader "Content-Disposition", "attachment;filename=export.csv"

Write_CSV_From_Recordset RS1
%>



rem  -----------------------------------------------------------

rem CONVERTIR RECORDSET EN CSV
Response.ContentType = "text/csv"
		Response.AddHeader "content-disposition", "inline; filename="&nombre&""&nom_periodo&".csv"

		miTabla = RS.GetRows
		'Response.Write "<table border='1'>"
		'Response.Write "<tr>"
		For Each Campo in RS.Fields
			'Response.Write "<td><b>" & Campo.Name & "</b></td>"
			Response.Write Campo.Name & ";"
		Next
		Response.Write vbNewLine
		RS.close
		set RS = nothing
		'Response.Write "</tr>"
		for I = 0 to UBound(miTabla,2)	
			'Response.Write "<tr>"
			for J = 0 to Ubound(miTabla, 1)
				'Response.Write "<td>" & miTabla(J, I) & "</td>"
				Response.Write miTabla(J, I) & ";"

			next
			Response.Write vbNewLine
			Response.Flush
			
			'Response.Write "</tr>"
		next
		'Response.Write "</table>"


rem ----------------------------------------------------------

rem CONVIERTE REORDSET EN EXCEL
Response.AddHeader "content-disposition", "inline; filename="&nombre&""&nom_periodo&".xls"

if sql <> "" then
	set RS = cnn.execute(sql)
	paso = "false"

	If RS.EOF And RS.BOF Then
		paso = "false"
	Else
		paso = "true"
	End If
	if paso = "true" then
		miTabla = RS.GetRows
		Response.Write "<table border='1'>"
		Response.Write "<tr>"
		For Each Campo in RS.Fields
			Response.Write "<td><b>" & Campo.Name & "</b></td>"
		Next
		RS.close
		set RS = nothing
		Response.Write "</tr>"
		for I = 0 to UBound(miTabla,2)	
			Response.Write "<tr>"
			for J = 0 to Ubound(miTabla, 1)
				Response.Write "<td>" & miTabla(J, I) & "</td>"
			next
			Response.Flush
			Response.Write "</tr>"
		next
		Response.Write "</table>"
	else
		Response.Write "<table border='1'><tr><td>Sin Información para esta opción.</td></tr></table>"
	end if

end if