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
<section>
<h2>도서 예약정보 조회</h2>
<%
	pstmt=conn.prepareStatement("select count(lentno) from reservation1229");
	rs=pstmt.executeQuery();
	if(rs.next()){
		String c=rs.getString(1);	
%>
<div id="div2">총 <%=c %>권의 도서 예약 정보가 있습니다.</div> <%} %>
<hr>
<table border=1 id="t5">
<tr>
<th>no</th>
<th>대출번호</th>
<th>고객성명</th>
<th>도서코드</th>
<th>도서명</th>
<th>대출일자</th>
<th>반납일자</th>
<th>대출상태</th>
<th>등급</th>
<th>삭제</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select a.lentno,a.custname,a.bookno,b.bookname,to_char(outdate,'yyyy-mm-dd')as outdate,to_char(indate,'yyyy-mm-dd')as indate,a.status,a.class from bookinfo1229 b,reservation1229 a where a.bookno=b.bookno");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String lentno=rs.getString("lentno");
		String custname=rs.getString("custname");
		String bookno=rs.getString("bookno");
		String bookname=rs.getString("bookname");
		String outdate=rs.getString("outdate");
		String indate=rs.getString("indate");
		String status=rs.getString("status");
		String class1=rs.getString("class");
		no++;	
	

%>

<tr>
<td><%=no %></td>
<td><a href="reservationUpdate.jsp
	?lentno=<%=lentno %>
	&custname=<%=custname %>
	&bookno=<%=bookno %>
	&bookname=<%=bookname %>
	&outdate=<%=outdate %>
	&indate=<%=indate %>	
	&status=<%=status %>
	&class1=<%=class1 %>"><%=lentno %></a></td>
<td><%=custname %></td>
<td><%=bookno %></td>
<td><%=bookname %></td>
<td><%=outdate %></td>
<td><%=indate %></td>
<td><%=status %></td>
<td><%=class1 %></td>
<td><a href="reservationDelete.jsp?lentno=<%=lentno %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false">삭제</a></td>
</tr>
<%} %>
</table>
<div id="div3"><input type="button" value="도서 정보 추가" onclick="location.href='reservationInsert.jsp'"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>