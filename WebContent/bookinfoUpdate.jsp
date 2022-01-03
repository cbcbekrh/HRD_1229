<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
	String bookno=request.getParameter("bookno");
	pstmt=conn.prepareStatement("select * from bookinfo1229 where bookno=?");
	pstmt.setString(1, bookno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String author=rs.getString("author");
		String bookname=rs.getString("bookname");
	
	
%>
<section>
<br><h1>도서 정보 등록 화면</h1>
<form name="form" method="post" action="bookinfoUpdateProcess.jsp">
<table border=1 id="t1">
<tr>
<th id="th1">도서코드</th>
<td><input id="in1" type="text" name="bookno" value="<%=bookno %>"></td>
</tr>

<tr>
<th id="th1">저자</th>
<td><input id="in1" type="text" name="author" value="<%=author %>"></td>
</tr>

<tr>
<th id="th1">도서이름</th>
<td><input id="in1" type="text" name="bookname" value="<%=bookname %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b1" type="button" value="수정" onclick="check()">
	<input id="b1" type="reset" value="취소">
</td>
</tr>
<%} %>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.bookno.value==""){
		alert("도서코드를 입력하세요.");
		document.form.bookno.focus();
	}else if(document.form.author.value==""){
		alert("저자를 입력하세요.");
		document.form.author.focus();
	}else if(document.form.bookname.value==""){
		alert("북네임을 입력하세요.");
		document.form.bookname.focus();
	}else{
		document.form.submit();
	}
}
</script>
</html>