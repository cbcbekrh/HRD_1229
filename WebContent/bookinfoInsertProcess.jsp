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
	
	pstmt=conn.prepareStatement("insert into bookinfo1229 values(?,?,?)");
	pstmt.setString(1, bookno);
	pstmt.setString(2, author);
	pstmt.setString(3, bookname);
	pstmt.executeUpdate();
	
%>
</body>
<script>
	alert("등록 완료");
	location.href="bookinfoSelect.jsp";
</script>
</html>