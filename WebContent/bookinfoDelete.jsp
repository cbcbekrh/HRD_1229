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
	pstmt=conn.prepareStatement("delete from bookinfo1229 where bookno=?");
	pstmt.setString(1, bookno);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="bookinfoSelect.jsp";
</script>
</html>