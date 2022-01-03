<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String bookno=request.getParameter("bookno");
	String author=request.getParameter("author");
	String bookname=request.getParameter("bookname");
	
	pstmt=conn.prepareStatement("update bookinfo1229 set author=?, bookname=? where bookno=?");
	pstmt.setString(3, bookno);
	pstmt.setString(1, author);
	pstmt.setString(2, bookname);
	pstmt.executeUpdate();
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="bookinfoSelect.jsp";
</script>
</html>