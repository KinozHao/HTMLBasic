<head>
    <title>Title</title>
</head>
<body>
<%
dim input1
input1 =request.querystring("username")
dim input2
input2 =request.querystring("userpass")

'Response.write(input1)
'Response.write(input2)
'Response.end
dim connAdress
connAdress="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath("Data2.mdb")

'Response.write(connAdress)
'Response.end

dim conn
set conn=Server.CreateObject("ADODB.Connection")
conn.open connAdress


 
dim sql
sql=" selcet * from stu where username='"& input1 &"' and userpass='"& input2 &"' "
 
dim rs 
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
 
if rs.eof then
	Response.write("error secrect")
else
	Response.write("sign in saccess")
end if


rs.close
conn.close
set conn=nothing
%>
</body>
</html>