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
<%
	String seq="";
	pstmt=conn.prepareStatement("select seq_bookno.nextval from dual");
	rs=pstmt.executeQuery();
	if(rs.next()){
		seq=rs.getString(1);
	}

%>
<%
	
	String bookname="";
	String lentno=request.getParameter("lentno");
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String class1=request.getParameter("class1");
	System.out.println(indate);
	System.out.println(outdate);
	pstmt=conn.prepareStatement("select bookname from bookinfo1229 where bookno=?");
	pstmt.setString(1, bookno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		bookname=rs.getString("bookname");
	}else if(bookno==null || bookno.equals("")){
		bookno="";
	}else{
		bookno="";
		%>
		<script>
			alert("등록되어있지 않은 도서코드 입니다.");
		</script>
		<%
	}
	
	if(custname == null){
		custname="";
	}
	if(bookno == null){
		bookno="";
	}
	if(indate == null){
		indate="";
	}
	if(outdate == null){
		outdate="";
	}
%>
<h1>도서 대출 예약 정보 등록 화면</h1>
<form name="form" method="post" action="reservationUpdate.jsp">
<table border=1 id="t1">
<tr>
<th>대출번호</th>
<td><input id="in1" type="text" name="lentno" value=<%=lentno %>></td>
<th>고객성명</th>
<td><input id="in1" type="text" name="custname" value=<%=custname %>></td>
</tr>

<tr>
<th>도서코드</th>
<td><input id="in1" type="text" name="bookno" value="<%=bookno %>" onchange="changesubmit();"></td>
<th>도서이름</th>
<td><input id="in1" type="text" name="bookname" value="<%=bookname %>"></td>
</tr>

<tr>
<th>대출일자</th>
<td><input id="in1" type="date" name="outdate" value="<%=outdate %>" onchange="changesubmit();"></td>
<th>반납일자</th>
<td><input id="in1" type="date" name="indate" value="<%=indate %>" onchange="changesubmit();"></td>
</tr>

<tr>
<th>대출상태</th>
<td>
	<input type="radio" name="status" value="1" <%= outdate != "" ? "checked" : "" %>>대출
	<input type="radio" name="status" value="2" <%= indate != "" ? "checked" : "" %>>반납
</td>
<th>등급</th>
<td>
	<select id="sel1" name="class1">
		<option value="S" <%= class1.equals("S") ? "selected" : "" %>>S</option>
		<option value="A" <%= class1.equals("A") ? "selected" : "" %>>A</option>
		<option value="B" <%= class1.equals("B") ? "selected" : "" %>>B</option>
		<option value="C" <%= class1.equals("C") ? "selected" : "" %>>C</option>
	</select>
</td>
</tr>

<tr>
<td colspan=4 align=center>
	<input id="b1" type="submit" value="수정" onclick="check()">
	<input id="b1" type="reset" value="취소">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
		if(document.form.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		document.form.lentno.focus();
	}else if(document.form.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
		document.form.custname.focus();
	}else if(document.form.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();
	}else{
		form.action="reservationUpdateProcess.jsp";
	}
}

function changesubmit(){
		document.form.submit();
}

</script>

</html>