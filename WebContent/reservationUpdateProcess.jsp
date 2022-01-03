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
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String class1=request.getParameter("class");
	
	pstmt=conn.prepareStatement("update reservation1229 set custname=?,bookno=?,outdate=?,indate=?,status=?,class=? where lentno=?");
	pstmt.setString(7, lentno);
	pstmt.setString(1, custname);
	pstmt.setString(2, bookno);
	pstmt.setString(3, outdate);
	pstmt.setString(4, indate);
	pstmt.setString(5, status);
	pstmt.setString(6, class1);
	pstmt.executeUpdate();
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="reservationSelect.jsp";
</script>
</html>