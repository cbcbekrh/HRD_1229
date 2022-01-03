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
	String lentno=request.getParameter("lentno");
	pstmt=conn.prepareStatement("delete from reservation1229 where lentno=?");
	pstmt.setString(1, lentno);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="reservationSelect.jsp";
</script>
</html>