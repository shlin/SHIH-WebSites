<%@ LANGUAGE="VBSCRIPT"%>
<%Response.Buffer = True%>

<%'���o�q download.asp ���U�ҭn�U�����ɦW
   fileid  = Request("fileid")

  ' �N "�H�����"  �s�J "�n�J�̸��" ��ƪ� ���� "�H�����" ���
    Set conn = Server.CreateObject ("ADODB.Connection")
    DBPath = Server.MapPath("download.mdb")
    conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath

    SET rs   = Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * From download Where (fileid=" & fileid & ")",conn,2,3

  ' �U���H����� + 1 �æs�J��Ʈw
	RS("hits") = RS("hits") + 1
	RS.Update

  ' ��}...�q��Ʈw�����o USER ���U�ҭn�U�����ɮ�
	Response.Redirect RS("filename")

	rs.Close
	Set rs = Nothing
	Conn.Close
	Set Conn = Nothing
%>