<%IF Request.Cookies("HomePage") = "" THEN
     Response.Cookies("HomePage") = "http://"
  END IF%>
<html>
<head>
<title>訪客留言板</title>
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
<body background="石塊地板.gif">
<form action="SaveReply.asp" method="post" name="reply">
  <div align="center"><center>
      <table border="0">
        <tr>
          <td></td>
          <td align=left>
              <font size=5 color=000099>訪客回應</font>
          </td>
        </tr>
        <tr>
          <td><img src="./images/BUTTOM-B.GIF"> 您的姓名：</td>
          <td colspan="2">
            <input type="text" size="20" name="Name" maxlength="8" value=<%=Request.Cookies("Name")%>>
          </td>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16"> 您的性別：</td>
          <td>
            <select name="Sex" size="1">
              <option>男</option>
              <option>女</option>
            </select>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16"> 您的職業：</td>
          <td colspan="2">
            <select name="Job" size="1">
              <option>SoHo一族</option>
              <option>學生</option>
              <option>教師</option>
              <option>上班族</option>
              <option>無聊人士</option>
              <option>路人甲</option>
              <option>無業遊民</option>
              <option>資訊業</option>
              <option>地痞流氓</option>
              <option>公務員</option>
              <option>服務業</option>
              <option>軍警</option>
              <option>作家</option>
              <option>農業</option>
              <option>工業</option>
              <option>商業</option>
              <option>其它</option>
            </select>
          </td>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16"> ICQ 號碼：</td>
          <td colspan="2">
            <input type="text" size="12" name="icq" maxlength="12" value="<%=trim(Request.Cookies("icq"))%>">
          </td>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16"> 電子郵件：</td>
          <td colspan="2">
            <input type="text" size="37" name="Email"  value="<%=Trim(Request.Cookies("Email"))%>">
          </td>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16"> 網頁位址：</td>
          <td colspan="2">
              <input type="text" size="37" name="HomePage" value="<%=Request.Cookies("HomePage")%>">
          </td>
        </tr>
        <tr> 
          <td><img src="./images/BUTTOM-B.GIF" width="16" height="16">留言性質：</td>
          <td colspan="2">
            <select name="security" size="1">
              <option value="No">公開留言</option>
              <option value="Yes">留給站長</option>
            </select>
          </td>
        </tr>
        <tr> 
          <td colspan="3"><img src="./images/BUTTOM-B.GIF" width="16" height="16"> 回應內容： <FONT COLOR=RED>( ENTER 換行 )</FONT>
          </td>
        </tr>
        <tr> 
          <td colspan="3" height="98"> 
            <textarea name="messagebody" rows="6"  cols="50"></textarea>
          </td>
        </tr>
        <tr> 
          <td colspan="3" align=center>
             <input type="hidden" name="ReplyLevel" value="<%=Request.Querystring("ReplyLevel")%>">
             <input type="hidden" name="messageid" value="<%=Request.Querystring("Messageid")%>">
             <input type="submit" value="確定送出">
             <input type="button" value="返回留言板" onclick="location.href='book.asp'">
          </td>
        </tr>
      </table>
      <tr><FONT COLOR=RED>"ICQ 號碼"和"網頁位址"可以不用填寫</tr>
    </center></div>
</form>
</body>
</html>
<script language="vbscript">
<!-- 
<%IF Trim(Request.Cookies("name")) = "" THEN
   RESPONSE.WRITE "document.reply.elements(0).focus()"
  ELSE
   RESPONSE.WRITE "document.reply.elements(7).focus()"
  END IF
%>

FUNCTION reply_ONSUBMIT()
   IF DOCUMENT.reply.name.VALUE="" Or DOCUMENT.reply.messagebody.VALUE="" Then
      ALERT("抱歉!! 須有您的姓名、回應內容..." & CHR(13) & "才能留言...麻煩一下囉!!")
      reply_ONSUBMIT = FALSE
   Else
      reply_ONSUBMIT = TRUE
   End If
END FUNCTION
-->
</script>