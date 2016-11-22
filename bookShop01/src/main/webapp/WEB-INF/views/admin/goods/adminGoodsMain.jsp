<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
function search_goods_list(search_period){
	temp=calcPeriod(search_period);
	var date=temp.split(",");
	beginDate=date[0];
	endDate=date[1];
	//alert("beginDate:"+beginDate+",endDate:"+endDate);
	//return ;
	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
    
	i_beginDate.name="beginDate";
	i_beginDate.value=beginDate;
	i_endDate.name="endDate";
	i_endDate.value=endDate;
	
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="/bookshop01/admin/goods/adminGoodsMain.do";
    formObj.submit();
}


function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}

function fn_send_mail(){
	var t_mail_receiver=document.getElementById("t_mail_receiver");
	var t_mail_title=document.getElementById("t_mail_title");
	var t_mail_message=document.getElementById("t_mail_message");
	var chk_mail_yn=document.frmGoods.chk_mail_yn;
	var h_goods_fileName=document.frmGoods.h_goods_fileName;
	
	var _mail_receiver=t_mail_receiver.value;
	var _mail_title=t_mail_title.value;
	var _mail_message=t_mail_message.value;
	var _goods_fileName=null;
	//alert(chk_mail_yn.length);
	var _goods_id=null;
	for(var i=0; i<chk_mail_yn.length;i++){
		if(chk_mail_yn[i].checked==true){
			_goods_id=chk_mail_yn[i].value;
			_goods_fileName=h_goods_fileName[i].value;
		}
	}
	
	//alert(_goods_id);
	//alert(_mail_message);
	
	//메일로 보낼 html 문서를 작성한다.
	
	var  _mail_content="<html><body>";
	_mail_content+="<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>";
	_mail_content+="<h1> 제품소개 <h1><br />";
	_mail_content+=_mail_message+"<br>";
	// alert(_mail_message);
 	 _mail_content+="<a href='http://localhost:8090/bookshop01/goods/goodsDetail.do?goods_id="+_goods_id+"'>";
 	_mail_content+="<img  src='http://localhost:8090/bookshop01/fileDownload.do?goods_id="+_goods_id+"&fileName="+_goods_fileName+"'/> </a><br>";
 	_mail_content+="</a>";
 	_mail_content+="<a href='http://localhost:8090/bookshop01/goods/goodsDetail.do?goods_id="+_goods_id+"'>상품보기</a>";
 	_mail_content+="</body></html>";
	
 	//alert(_mail_message);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "http://localhost:8090/bookshop01/mail/adminSendMail.do",
		data : {
			mail_receiver:_mail_receiver,
			mail_title:_mail_title,
			mail_content:_mail_content
		},
		success : function(data, textStatus) {
			alert(data);
			
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
	<H3>제품 조회</H3>
	<form  method="post"  >	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<TR >
					<TD>
						<input type="radio" name="r_search"  checked/> 등록일로조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search" />상세조회 &nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR >
					<TD>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_goods_list('today')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_goods_list('one_week')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_goods_list('two_week')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_goods_list('one_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_goods_list('two_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_goods_list('three_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_goods_list('four_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</TD>
				</TR>
				<tr>
				  <td>
				    <select name="search_condition" disabled >
						<option value="전체" checked>전체</option>
						<option value="제품번호">제품번호</option>
						<option value="제품이름">제품이름</option>
						<option value="제조사">제조사</option>
					</select>
					<input  type="text"  size="30"  disabled/>  
					<input   type="button"  value="조회" disabled/>
				  </td>
				</tr>
				<tr>
				  <td>
					조회한 기간:<input  type="text"  size="4" value="${beginYear}" />년
							<input  type="text"  size="4" value="${beginMonth}"/>월	
							 <input  type="text"  size="4" value="${beginDay}"/>일	
							 &nbsp; ~
							<input  type="text"  size="4" value="${endYear }" />년 
							<input  type="text"  size="4" value="${endMonth }"/>월	
							 <input  type="text"  size="4" value="${endDay }"/>일							 
				  </td>
				</tr>
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
</form>	
<DIV class="clear"></DIV>
<form name="frmGoods" >
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td width=10>제품번호</td>
				<td>제품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>제품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
   <c:choose>
     <c:when test="${empty new_goods_list }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${new_goods_list }">
			 <TR>       
				<TD>
				  <strong>${item.goods_id }</strong>
				  <input  type="checkbox" name="chk_mail_yn" value="${item.goods_id}" />
				  <input  type="hidden" value="${item.goods_fileName }"  name="h_goods_fileName"/>
				</TD>
				<TD >
				 <a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
				    <strong>${item.goods_title } </strong>
				 </a> 
				</TD>
				<TD>
				<strong>${item.goods_writer }</strong> 
				</TD>
				<TD >
				   <strong>${item.goods_publisher }</strong> 
				</TD>
				<td>
				  <strong>${item.goods_sales_price }</strong>
				</td>
				<td>
				 <strong>${item.goods_credate }</strong> 
				</td>
				<td>
				    <c:set var="pub_date" value="${item.goods_published_date}" />
					   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					<strong>
					   <c:out value="${arr[0]}" />
					</strong>
				</td>
				
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
           <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="${pageContext.request.contextPath}/admin/goods/adminGoodsMain.do?chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/goods/adminGoodsMain.do?chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${pageContext.request.contextPath}/admin/goods/adminGooodsMain.do?chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
     
<%--              <c:choose>
        <c:when test="${totWrite >100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${chapter >1 && page==1 }">
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp; -- </a>
	         </c:if>
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
	         <c:if test="${page ==10 }">
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; >></a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totWrite ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="x" begin="1" end="10" step="1" >
	        <a href="#">${x } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totWrite< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totWrite/10 +1}" step="1" >
	        <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter}&pageNum=${page}">${page } </a>
	      </c:forEach>
        </c:when>
        <c:otherwise>
          </c:otherwise>
        --%>     
           </td>
        </tr>
         
  				<%-- <td>
					<STRONG><a href="#"> 이전</a>  </STRONG>
					<c:forEach var=1 begin=1 end=10>
							
					</c:forEach>
				</TD>	 --%>		   
		</TBODY>
	</TABLE>
</form>	
	<DIV class="clear"></DIV>
	<br><br><br>
<H3>제품 등록</H3>
<DIV id="search">
	<form action="${pageContext.request.contextPath}/admin/goods/addNewGoodsForm.do">
		<input   type="submit" value="제품 등록하기">
	</form>
</DIV>
<br><br><br><br><br><br>
<H3>메일 보내기</H3>
<DIV id="send_mail">
	<table>
	   <tr>
	     <td>받는 사람</td>
	     <td><input type="text" size="30"  id="t_mail_receiver" /> </td>
	  </tr>
	  <tr>
	     <td>메일 제목</td>
	     <td><input type="text" size="60"  id="t_mail_title"  /> </td>
	  </tr>
	  <tr>
	   <td>메일 메시지</td>
	   <td>
          <textarea cols="50" rows="20"  id="t_mail_message" >메시지를 입력하세요!!!</textarea>	   
	   </td>
	  </tr>
	  <tr align="center">
	    <td colspan="2">
	      <input  type="button" value="메일 보내기" onClick="fn_send_mail()" />
	     </td>
	  </tr>
	</table>
</DIV>

</body>
</html>