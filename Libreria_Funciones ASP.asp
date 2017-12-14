rem Nos devuelve el n�mero de car�cteres de una cadena
len(cadena)

rem Divide una cadena en varias usando un car�cter separador.
split(cadena,separador)

rem Devuelve una subcadena de otra, empezando por inicio y de longitud longitud.
mid(cadena, inicio, longitud)

rem Elimina los espacios iniciales y finales de una cadena.
trim(cadena)

rem Busca la cadena2 dentro de cadena1 indic�ndonos la posici�n en la que se encuentra.
instr(cadena1, cadena2)

rem Reemplaza la cadena1 por la cadena2 en el texto.
replace(texto, cadena1, cadena2)

rem Devuelve los num caracteres de cadena empezando por la izquierda.
left(cadena, num)

rem Parseo a INT'
cInt(expression)

rem es similar a Cint en que aceptar� nada m�s y tratar de convertirlo 
rem en un n�mero de tipo individual. Esta funci�n tambi�n devolver� un error por algo que no es num�rico.'
cSng(expression)

rem Parse a doble'
cDbl(expression)

rem Parse a String'
CStr(expression)

rem ////////////////////TRABAJO CON FECHAS ////////////////////////////////////////
rem Fecha y Hora
<%= Now() %>

rem �nicamente la Fecha	
<%= Date() %>	

rem �nicamente la hora actual
<%= Time() %>	

rem Asignamos el valor de Now() en una variable, para modificarla con diversas funciones a continuaci�n.
<% Dim Actual 
Actual = Now() %>

<%= FormatDateTime(Actual, 1) %>	'Muestra la fecha asignada en formato alfanum�rico, incluyendo el nombre del d�a de la semana
<%= FormatDateTime(Actual, 2) %>	'Muestra la fecha asignada en formato num�rico
<%= FormatDateTime(Actual, 3) %>	'Muestra hora, minutos, segundos y tiempo del meridiano de la fecha asignada
<%= FormatDateTime(Actual, 4) %>	'Hora y minutos �nicamente de la fecha asignada
<%= Year(Actual) %>	'El a�o de la fecha asignada
<%= Month(Actual) %>	'Dato num�rico del mes de la fecha asignada
<%= MonthName(Month(Actual)) %>	'Nombre del mes de la fecha asignada
<%= MonthName(Month(Actual), 1) %>	'Nombre corto del mes de la fecha asignada
<%= Day(Actual) %>	'Dato num�rico del d�a de la fecha asignada
<%= WeekDay(Actual) %>	'Dato num�rico del d�a de la semana de la fecha asignada
<%= WeekDayName(WeekDay(Actual)) %>	'Nombre del d�a de la semana de la fecha asignada
<%= WeekDayName(WeekDay(Actual), 1) %>	'Nombre corto del d�a de la semana de la fecha asignada
<%= Minute(Actual) %>	'Valor num�rico del minuto de la fecha asignada
<%= Second(Actual) %>	'Valor num�rico del segundo de la fecha asignada
<%= DateAdd("d", 1, Actual) %>	'Fecha y hora del d�a siguiente a la fecha asignada.
<%= DateAdd("d", -1, Actual) %>	'Fecha y hora del d�a anterior a la fecha asignada
<%= DateDiff("d", Actual, "3/9/2003") %>	'D�as de diferencia entre 2 fechas. En este caso, los d�as hasta mi pr�ximo cumplea�os.
<%= Day(Actual) & "/" & Month(Actual) & "/" & Year(Actual) %>	'Modificaci�n de los valores de la fecha seleccionada para mostrarla en el formato dd/mm/aa
<%= WeekDayName(WeekDay(Actual)) & ", " & Day(Actual) & " " & MonthName(Month(Actual)) & ", " & Year(Actual) %>	'Otra modificaci�n para mostrar la fecha seleccionada en el formato dd/mm/aa, incluyendo el nombre del d�a de la semana y el nombre del mes.
<% Dim Actual 
Actual = CDate("01/01/2001") %>	'Convierte una cadena de texto en un dato de fecha
<% = IsDate("01/01/2001") %>	'Funci�n que retorna un valor booleano si el dato que manipula es una fecha.




rem /////////////////EJEMPLO DE FUNCIONES///////////////////



rem Funciones con cadenas

rem Abajo tienes una lista de las funciones m�s utilizadas para manipular cadenas. 

InStr() 

Sintaxis: InStr(CadenaABuscar, CadenaAEncontrar)
rem La funci�n devolver� la posici�n de la primera ocurrencia de CadenaAEncontrar dentro de CadenaABuscar
rem La funci�n devolver� 0 si la CadenaAEncontrar no se encuentra.

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
Cadena1="Me cost� cuatro a�os de trabajo"
Cadena2="e"
Posicion= Instr(Cadena1,Cadena2)
response.write Posicion
%>

rem El resultado mostrado ser�: 2

rem Tambi�n puedes establecer la posici�n de inicio de b�squeda (si se omite se produce la b�squeda desde el primera car�cter).

rem Ejemplo 3: 

<%
Cadena1="Me cost� cuatro a�os de trabajo"
Cadena2="c"
Posicion= Instr(6,Cadena1,Cadena2)
response.write Posicion
%> 

rem El resultado mostrado ser�: 10 


rem --------------------------------------------------------------------------------

Left()

Sintaxis: Left(Cadena, NumDeCaracteres) 
rem La funci�n devolver� el n�mero de caracteres estipulado. Empieza a contar desde la izquierda.

rem Ejemplo:

<%
Cadena1="michael"
response.write("Los 3 primeros caracteres de mi nombre son " & Left(Cadena1,2))
%>

rem El resultado mostrado ser�:

rem Los 3 primeros caracteres de mi nombre son mic 

rem Recuerda que el primer car�cter se indexa como 0, as� que m ser�a el car�cter 0 y c el 2.


rem --------------------------------------------------------------------------------
Right()

Right realiza la misma funci�n que Left, s�lo que empieza a contar por la derecha.


rem --------------------------------------------------------------------------------

Len()

Sintaxis: Len(Cadena) 
rem Esta funci�n simplemente devuelve la longitud de la cadena.

Ejemplo1:

<%
Cadena1="michael"
Response.write Len(Cadena1)
%>

rem El resultado mostrado ser�: 7

rem * Esta funci�n indexa empezando desde el n�mero 1.

rem Ejemplo2:

<%
Cadena1="michael"
Response.write Left(Cadena1,Len(Cadena1)-4)
%>

rem El ejemplo anterior, coge la cadena1, y toma un n�mero de caracteres igual a su longitud menos 4.

rem El resultado mostrado ser�: mic




rem --------------------------------------------------------------------------------

Replace() 

rem Funci�n que permite reemplazar caracteres en una cadena.

Sintaxis: Replace(CadenaABuscar, CadenaAEncontrar, Remplazo) 

rem CadenaABuscar es la cadena origen y la CadenaAEncontrar es la que se buscar� en el origen. 

rem Todas las ocurrencias (CadenaAencontrar) encontradas en la cadena origen (CadenaABuscar) ser�n reemplazadas por Reemplazo

rem Ejemplo:
<% 
Cadena1="My_Name_is_Michael"
Response.write (Replace(Cadena1,"_"," "))
%>

rem El resultado mostrado ser�:
rem My Name is Michael


rem --------------------------------------------------------------------------------

LCase(), UCase()

rem Funciones que permiten convertir los caracteres de una cadena a may�sculas y min�sculas.

rem Ejemplo 1:

<%
myName = "MICHAEL"
Response.Write(LCase(myName)) 
%> 

rem El resultado mostrado ser�: michael

rem Ejemplo2: 

<% 
myNAME = "michael"
Response.Write(UCase(myName)) 
%> 

rem El resultado mostrado ser�: MICHAEL 




rem --------------------------------------------------------------------------------
Mid()

Sintaxis: Mid(Cadena, Inicio, Longitud)

rem La funci�n devolver� el n�mero requerido de caracteres de una cadena a partir de un determinado car�cter de inicio.
rem La longitud es opcional. Si se deja vac�o este campo, la funci�n devolver� todos los caracteres a partir de "inicio"

rem Ejemplo:

<%
Cadena1="michael"
Response.write Mid(Cadena1,3,3)
%>

rem El resultado mostrado ser�: cha 





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
		Response.Write "<table border='1'><tr><td>Sin Informaci�n para esta opci�n.</td></tr></table>"
	end if

end if