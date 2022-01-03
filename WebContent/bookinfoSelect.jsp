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
	pstmt=conn.prepareStatement("select count(bookno) from bookinfo1229");
	rs=pstmt.executeQuery();
	if(rs.next()){
		int c=rs.getInt(1);	
%>
<section>
<br><h2>학사정보 목록</h2>
<div id="div2">총 <%=c %>권의 도서정보가 있습니다.</div>
<hr>
<%} %>
<table border=1 id="t5">
<tr>
<th>no</th>
<th>도서코드</th>
<th>저자</th>
<th>도서명</th>
<th>삭제</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select * from bookinfo1229");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String bookno=rs.getString("bookno");
		String author=rs.getString("author");
		String bookname=rs.getString("bookname");
		no++;
	

%>

<tr>
<td><%=no %></td>
<td><a href="bookinfoUpdate.jsp?bookno=<%=bookno %>"><%=bookno %></a></td>
<td><%=author %></td>
<td><%=bookname %></td>
<td><a href="bookinfoDelete.jsp?bookno=<%=bookno %>" onclick="if(!confirm('정말 삭제하시겠습니까?')) return false;">삭제</a></td>
</tr>




<%} %>
</table>
<div id="div3"><input type="button" value="도서 정보 추가" onclick="location.href='bookinfoInsert.jsp'"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>