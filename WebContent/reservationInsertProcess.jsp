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
	String bookname=request.getParameter("bookname");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String class1=request.getParameter("class");
	
	pstmt=conn.prepareStatement("insert into reservation1229 values(?,?,?,?,?,?,?)");
	pstmt.setString(1, lentno);
	pstmt.setString(2, custname);
	pstmt.setString(3, bookno);
	pstmt.setString(4, outdate);
	pstmt.setString(5, indate);
	pstmt.setString(6, status);
	pstmt.setString(7, class1);
	pstmt.executeUpdate();
	
%>
</body>
<script>
	alert("등록 완료");
	location.href="reservationSelect.jsp";
</script>
</html>