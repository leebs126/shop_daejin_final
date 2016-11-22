<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인페이지 설정 하기</title>
<script type="text/javascript">
function fn_modify_main_setting(){
	//alert("aaa");
	//체크된 항목을 가지고 온다.
	var chk_review_book=document.getElementById("chk_review_book");
	alert(chk_review_book.checked);
	var chk_brand_book=document.getElementById("chk_brand_book");
	var chk_writer_book=document.getElementById("chk_writer_book");
	var chk_bestseller=document.getElementById("chk_bestseller");
	var chk_newbook=document.getElementById("chk_newbook");
	var chk_steadyseller=document.getElementById("chk_steadyseller")
	var chk_discount_book=document.getElementById("chk_discount_book")
	
	var review_book_yn='n';
	var writer_book_yn='n';
	var brand_book_yn='n';
	var bestseller_yn ='n';
	var steadyseller_yn='n';
	var discount_book_yn='n';
	var newbook_yn='n';
	
	if(chk_review_book.checked==true){
		review_book_yn='y';
	}
	
	if(chk_writer_book.checked==true){
		writer_book_yn='y';
	}
	
	if(chk_brand_book.checked==true){
		brand_book_yn='y';
	}
	
	if(chk_bestseller.checked==true){
		bestseller_yn='y';
	}
	if(chk_newbook.checked==true){
		newbook_yn='y';
	}
	
	if(chk_steadyseller.checked==true){
		steadyseller_yn='y';
	}
	
	if(chk_discount_book.checked==true){
		discount_book_yn='y';
	}
	
    alert(discount_book_yn);
	
	//ajax로 설정값을 서버로 전송한다.
	$.ajax({
			type:"post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "http://localhost:8090/bookshop01/mypage/modifyMainSetting.do",
			data : {
				review_book:review_book_yn,
				 writer_book:writer_book_yn,
				brand_book:brand_book_yn,
				
				bestseller:bestseller_yn,
				newbook:newbook_yn,
				steadyseller:steadyseller_yn,
				discount_book:discount_book_yn
				
			},
			success : function(data, textStatus) {
				alert("설정이 수정되었습니다!!!");	
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	
	
	
	
}
</script>
</head>
<body>
<center>
 <h1>메인화면 설정하기</h1>
<table border="0" class="list_view" >
<c:forEach var="item" items="${myMainSettingList }">
   <c:choose>
     <c:when test="${item.goods_type=='bestseller' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>베스트셀러</td>
               <td width=40%><input type="checkbox" id="chk_bestseller"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>베스트셀러</td>
               <td width=40%><input type="checkbox" id="chk_bestseller" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='brand_book' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>브랜트별</td>
               <td width=40%><input type="checkbox" id="chk_brand_book"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>브랜트별</td>
               <td width=40%><input type="checkbox" id="chk_brand_book" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='writer_book' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>작가별</td>
               <td width=40%><input type="checkbox" id="chk_writer_book"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>작가별</td>
               <td width=40%><input type="checkbox" id="chk_writer_book" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='newbook' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>새로나온 도서</td>
               <td width=40%><input type="checkbox" id="chk_newbook"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>새로나온 도서</td>
               <td width=40%><input type="checkbox" id="chk_newbook" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='steadyseller' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>스테디셀러</td>
               <td width=40%><input type="checkbox" id="chk_steadyseller"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>스테디셀러</td>
               <td width=40%><input type="checkbox" id="chk_steadyseller" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='discount_book' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>할인되는 도서</td>
               <td width=40%><input type="checkbox" id="chk_discount_book"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>할인되는 도서</td>
               <td width=40%><input type="checkbox" id="chk_discount_book" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    <c:when test="${item.goods_type=='review_book' }">
        <c:choose>
          <c:when test="${item.show_yn=='y' }">
             <tr>
               <td width=60%>댓글많은 도서</td>
               <td width=40%><input type="checkbox" id="chk_review_book"  checked/> </td>
             </tr>
          </c:when>   
          <c:otherwise>
              <tr>
               <td width=60%>댓글많은 도서</td>
               <td width=40%><input type="checkbox" id="chk_review_book" /> </td>
             </tr>
          </c:otherwise>      
      </c:choose>
    </c:when>
    </c:choose>
</c:forEach>    
    <!-- <tr>
      <td>브랜드별 </td>
      <td><input type="checkbox" id="chk_brand_book" /> </td>
    </tr>
    <tr>
      <td>작가별</td>
      <td><input type="checkbox" id="chk_writer_book" /> </td>
    </tr>
    <tr>
      <td>베스트셀러</td>
      <td><input type="checkbox" id="chk_bestseller" /> </td>
    </tr>
    <tr>
      <td>새로 나온 도서</td>
      <td><input type="checkbox" id="chk_newbook" /> </td>
    </tr>
    <tr>
      <td>스테디셀러</td>
      <td><input type="checkbox" id="chk_steadyseller" /> </td>
    </tr>
    <tr>
      <td>할인되는 도서</td>
      <td><input type="checkbox" id="chk_discount_book" /> </td>
    </tr> -->
    <tr align=center>
      <td colspan=2>
        <input  type="button" value="변경하기"  onClick="fn_modify_main_setting()"/>
        <input  type="button" value="취소" />
      </td>
    </tr>
</table>
</center>
</body>
</html>