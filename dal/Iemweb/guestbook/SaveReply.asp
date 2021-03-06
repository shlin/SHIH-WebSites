<%
' 依階層插入兩個全形的空白,版面排版須要(在 book.asp 內我限定只有到第2階能有回應)
IF Request.Form("replylevel") = "2" Then
   SPACES = "　　"
END IF

' 取得各欄位的資料
Name = Request.Form("Name")
Sex = Request.Form("Sex")
Job = Request.Form("Job")
Email = Request.Form("Email")
HomePage = Request.Form("HomePage")
messagebody = SPACES & Request.Form("messagebody")
icq = Request.Form("icq")
security = Request.Form("security")

' 如果 HTML 語法關閉 則使用此敘述
messagebody = Replace(messagebody,"<" , "&lt;")

' 於執行斷行時,<br>一樣會被加一,算入是否大於 80 字元,為了不加一,所以用`字,先代替<br>
messagebody = Replace(messagebody,vbCrLf , "`" & SPACES)

' textarea 自動斷行的判斷仍未研究出來,所以只好用程式碼 Parse_text 來指行斷行處理,
parse_text(messagebody)


'如果沒填 e-mail
If Email="" Then
    Email=" "
End If

'如果沒填 icq
If icq="" Then
    icq=" "
End If

Homepage = trim(HomePage)
'如果沒填 HTTp
If len(trim(HomePage))  = 0 or mid(HomePage,1,4) <> "http" Then
    HomePage ="http://" & Homepage
End If

' 將張貼者的個人資料寫入他的瀏覽器內
Domain = Request.ServerVariables("SERVER_NAME")

Response.Cookies("Name") = Name
Response.Cookies("Name").Domain = Domain
Response.Cookies("Name").Expires = date()+30

Response.Cookies("sex") = sex
Response.Cookies("sex").Domain = Domain
Response.Cookies("sex").Expires = date()+30

Response.Cookies("Email") = Email
Response.Cookies("Email").Domain = Domain
Response.Cookies("Email").Expires = date()+30

Response.Cookies("HomePage") = HomePage
Response.Cookies("HomePage").Domain = Domain
Response.Cookies("HomePage").Expires = date()+30

Response.Cookies("icq") = icq
Response.Cookies("icq").Domain = Domain
Response.Cookies("icq").Expires = date()+30

' 國外免費 WEBHOSTME 的開啟語法如下:
'Set Conn = Server.CreateObject ("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
'Conn.ConnectionString = "Data Source=" & Server.MapPath ("/cgi-bin/BOARD/GBOOK.mdb")
'Conn.Open 


' 開啟資料庫
Set conn = Server.CreateObject("ADODB.Connection")
DBPath = Server.MapPath("GBook.mdb")
conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath
Set rs = Server.CreateObject("ADODB.Recordset")
Set rs2 = Server.CreateObject("ADODB.Recordset")

RS2.OPEN "GUESTBOOK",CONN,1,1
RS2.MOVELAST
TotalID = rs2("messageid")     ' 取得 messageid 欄位的最後一個值
RS2.CLOSE

SortSql = "Select *From guestbook where Messageid=" & Request.Form("Messageid")
rs.Open SortSql, conn, 1,3

' 回應數加一,並取出被回應者的資料
rs("replytotal") = rs("replytotal") + 1
replytotal = rs("replytotal")
messageid = rs("messageid")
replyid = rs("replyid")
' replyparent = rs("replyparent")
Sort = rs("Sort")
rs.update

' 儲存回應者的資料
rs.AddNew
rs("messageid") = TotalId - 1       ' 使用 messageid 欄位的最後一個值來減 1
rs("replyid") = replyid
rs("replyparent") = messageid

' 將 SORT 處理為階層,用來直接排序---最近張貼的再第一次
IF ReplyTotal = 0 THEN
   rs("sort") = replyid
ELSE
   rs("sort") = Sort & "." & replytotal
END IF

' 寫入資料
rs("Name") = Name
rs("Sex") = Sex
rs("Job") = Job
rs("Email") = Email
rs("HomePage") = HomePage
rs("messagebody") = messagebody
rs("icq") = icq
rs("security") = security
rs.update
rs.close
SET CONN = NOTHING

Response.Redirect "book.asp" ' 返回『友言板』

Function Parse_text(m_output)
  '上一次位置、目前累計長度、實際位置、總長度
  Dim old_pos, tmp_Len, i, tot_Len,temp_Memo,temp2_Memo
  old_pos = 0   '上一次位置
  tmp_Len = 0   '記錄邏輯上的長度
  TOT_LEN = Len(Trim(m_output))
  temp_Memo = ""
  temp2_Memo = "" 

 ' i 代表字串中實際的位置
  For i = 1 To tot_Len

      If Len(Hex(Asc(Mid(m_output, i, 1)))) > 2 and Mid(m_output,i,1) <> "`" Then
         tmp_Len = tmp_Len  + 2         '將長度加2
      ElseIf Mid(m_output,i,1) = "`" then
         temp_Memo =  Mid(m_output,old_pos+1,i-old_pos)
         '還原計數值,因為 <BR> 也會被算入,所以將<BR>將換為"`",以避免被加一
         old_pos = i
         tmp_Len = 0
      ELSE
         tmp_Len = tmp_Len + 1         '否則加 1
      End If

      '如果大於等於 80 字元，準備輸出結果
      If tmp_Len >=  80  Then
         temp_Memo = Mid(m_output,old_pos+1,i-old_pos) & "<br>" & SPACES
        ' 還原計數值
         old_pos = i
         tmp_Len = 0
      End If
         temp2_Memo = temp2_Memo & temp_Memo
         temp_Memo = ""
  Next

  '將其餘的字元(如果還有的話)一併輸出
   messagebody = Replace(TEMP2_MEMO ,"`", "<br>") & Mid(m_output,old_pos+1,tot_Len-old_pos+2)

End Function
%>