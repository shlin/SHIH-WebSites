<%
     password = Request("password")
     page = Request("page")

     IF PAGE = "" THEN
        PAGE = 1
     END IF

     Set conn = Server.CreateObject("ADODB.Connection")
     DBPath = Server.MapPath("news.mdb")
     conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath
     SET rs = Server.CreateObject("ADODB.Recordset")
     Rs.Open "Select * From news ORDER BY ID desc",conn,1,1

'    Rs("站務內容")
'    Rs("新增日期")

' 每頁顯示五筆
rs.pagesize=5
rs.absolutepage=page


%>

<html>
<head>
<title>news by junior</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
 <STYLE TYPE="text/css">
        <!-- body,th,td,input,select,textarea,select,checkbox {font:9pt 新細明體}
         a:link {font: 9pt "新細明"; text-decoration: none;color:none}
         a:visited      {font: 9pt "新細明"; text-decoration: none; color: 000099}
         a:active       {font: 9pt "新細明"; text-decoration: none; color: 00CC66}
         a:hover        {font: 9pt 新細明; text-decoration: underline; color: ff0000}
        -->
   </STYLE>
</head>

<body background="石塊地板.gif" marginheight=0 marginwidth=0 leftmargin=0 topmargin=0>
<Br>
 <tr> 
    <td colspan="14"> 
       <div align="center"><font size="6" face="標楷體">最新消息</font></div>
    </td>
  </tr>
<p align="center"><img src="Msic0008.gif" width="25" height="26"
alt="Msic0008.gif (5676 個位元組)">&nbsp; <blink><font color="#FF0000">一起來八卦一下吧！！！</font></blink><img
src="Msic0008.gif" width="25" height="26" alt="Msic0008.gif (5676 個位元組)"><br>
<img src="032x.gif" width="580" height="20" alt="032x.gif (21582 個位元組)"></p>
<div align="center"><table border=1 cellspacing=0 bordercolorlight="#5E5E00" bordercolordark="#FFFFEC" cellpadding="2" width="600" height="82">
  <tr bgcolor="#C1E0FF"> 
    <td height="11" colspan="2"> 
      <div align="right"><I><FONT SIZE=+2 COLOR=RED>NEWS</FONT></I> by junior　
         <select name="jump" onChange="location.href=this.options[this.selectedIndex].value;" >
             <option value="">跳其它頁</option>
              <%FOR J=1 to rs.pagecount%>
                   <%IF J <> cint(page) then %>
                       <%IF J < 10  then 
                             J = "0" & J
                         End IF%>
                        <option value="NEWS.asp?Page=<%=J%>">第 <%=J%> 頁
                   <%END IF
                NEXT %>
         </select>
        </div>
       <div align="center">
          目前在第 <font color=blue><%=CINT(PAGE)%></FONT> 頁 / 每頁 <font color=blue><%=RS.PageSize%></font> 筆 / 共 <font color=blue><%=rs.recordcount%></font> 筆 / <font color=blue><%=rs.pagecount%></font> 頁
      </div>
    </td>
  </tr>

<%
FOR I=1 TO RS.PAGESIZE%>
  <tr bgcolor="#E8F4FF">
    <td height="12" width="54" align="center"><%=Rs("新增日期")%></TD>
    <td height="24" width="300"><%=Rs("站務內容")%></td>
  </tr>
   <%RS.MOVENEXT
   IF RS.EOF THEN EXIT FOR
NEXT%>
  
</table>
</body>
</html>
<%RS.CLOSE%>