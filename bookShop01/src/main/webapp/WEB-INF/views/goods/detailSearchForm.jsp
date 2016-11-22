<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상세 검색 화면</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $("#begin_pub_date").datepicker();
    $("#end_pub_date").datepicker();
    
    $("#begin_pub_date" ).datepicker( "option", "dateFormat","yy-mm-dd");
    $("#end_pub_date" ).datepicker( "option", "dateFormat","yy-mm-dd");

  } );
  </script>
</head>
<body>
<h1>상세 검색창</h1>
<form name="frmDetailSearch" action="${pageContext.request.contextPath}/goods/detailSeach.do">
<table>
 <tr>
   <td>제목</td>
   <td >
    <input type="text" size="30"  name="goods_title" />
   </td>
 </tr>
 <tr>
   <td>저자</td>
   <td >
    <input type="text" size="30"  name="goods_writer" />
   </td>
 </tr>
 <tr>
   <td>출판사</td>
   <td >
    <input type="text" size="30"  name="goods_publisher" />
   </td>
 </tr>
 <tr>
   <td>출간일</td>
   <td >
    <input type="text" size="10" id="begin_pub_date" name="begin_pub_date" /> 부터
    <input type="text" size="10" id="end_pub_date" name="end_pub_date" /> 까지
   </td>
 </tr>
 <tr align="center">
   <td colspan="2"> 
     <input type="submit" value="찾기" />
     <input type="reset" value="초기화" />
    </td>
 </tr> 
</table>
</form>
</body>
</html>