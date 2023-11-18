<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 전체 구역 */
#container{


}


/* 광고 구역  */
#ad_section{
	width : 1350px;
	height : 300px;

}

.ad_img{

	width : 150px;
	height : 150px;
	
	 
}

/* 찜 구역 */
#love_section{


}


/* 인기물건 구역  */
#popular_section{


}
.title_text{

	margin-left: 10px;
}

#item_section{

 	width : 220px;
	height : 290px;
	float: left; 
	border: none;
	border: 3px solide red;
	padding-left : 10px;
	background-color: white;
	margin-bottom: 20px;
	margin-left: 15px;
}

/* 공통 */

.item_img{
	border: 1px solide black;
	width : 200px;
	height : 200px;
	padding-top: 20px;
}

.it_title{
	border: none;
	width : 200px;
	height : 25px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	text-align: center;
	font-weight: bold;
}

.it_price{
	border: none;
	width : 126px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	font-weight: bold;
	
}

.it_state{
	border: none; 
	width : 70px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;
}

#item_section{

	width : 200px;
	height: 300px;
	background-color: #FFF;
}

</style>
</head>
<body>

<div id="container">



<!-- 	
		<h1> /user/userMain.jsp</h1>
		<h1> 유저 메인페이지</h1>
-->

	<c:if test="${!empty us_id  && us_id.equals('admin') }">
		<c:redirect url="../admin/userList"/>
	</c:if>


	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
		<input type="hidden" value="${us_id }" name="login"> 
	</c:if>
	
	

	<div id="ad_section">
		<h2 class="title_text"> 인기 가게 둘러보기(광고) </h2>
		<c:forEach var="ad" items="${adList}">
			<fieldset>
				<form>
					<a href="../ent/shopMain?own_id=${ad.own_id }">
						<img src="/imgfile/${ad.ent_img }" name="ent_img" class="ad_img"> <br>
						<input type="text" value="${ad.ent_name }" name="ent_name">
					</a>
				</form>
			</fieldset>
		</c:forEach> 
	</div><!-- 2 ad_section -->
	<div id="love_section">
	 	<c:if test="${!empty us_id }">
			<h2 class="title_text"> 나의 찜 목록 </h2>
	 		<c:forEach var="love" items="${loveList}">
				<fieldset>
					<form action="">
						<a href="../item/itemDetail?it_no=${love.it_no }">
							<img src="/imgfile/${love.it_img }" name="it_img" width="150px" height="150px"> <br>
							<input type="text" value="${love.it_title }" name="it_title"> <br>
							<input type="text" value="${love.it_price }" name="it_price">
							<input type="text" value="${love.it_state }" name="it_state">
						</a>
					</form>
				</fieldset>
			</c:forEach> 
		</c:if>
	</div><!-- 3 love_section -->
	
	<div id="popular_section">
		<h2 class="title_text"> 인기 물건 둘러보기 </h2>
		<!-- 로그인 하지 않았을 때 -->
		<c:if test="${empty us_id }">
		 	<c:forEach var="item" items="${itemList}">
		 		<c:if test="${item.it_state != 2 && item.it_state != 3  }">
		 			<div id="item_section">
						<a href="../item/itemDetail?it_no=${item.it_no }">
							<img src="/imgfile/${item.it_img }" name="it_img"  class="item_img"> <br>
							<input type="text" value="${item.it_title }" name="it_title" class="it_title"> <br>
							<input type="text" value="${item.it_price }원" name="it_price" class="it_price">
							<input type="hidden" value="${item.it_state }" name="it_state">
							<!-- 글 상태 표시 -->
							<c:choose>
								<c:when test="${item.it_state == 0 }">
									<input type="text" value="판매중" class="it_state"> <br>
								</c:when>
								<c:when test="${item.it_state == 1 }">
									<input type="text" value="예약중" class="it_state"> <br>
								</c:when>
								<c:when test="${item.it_state == 2 }">
									<input type="text" value="판매완료" class="it_state"> <br>
								</c:when>
								<c:when test="${item.it_state == 3 }">
									<input type="text" value="삭제됨" class="it_state"> <br>
								</c:when>
								<c:otherwise>
									<input type="text" value="접근이상함" class="it_state"> <br>			
								</c:otherwise>
							</c:choose>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</c:if>	 
		<!-- 로그인 했을 때 -->
		<c:if test="${!empty us_id }">
		 	<c:forEach var="item" items="${itemList}">
		 		<c:if test="${item.it_state != 2 && item.it_state != 3 &&  us_id != item.us_id }">
					<a href="../item/itemDetail?it_no=${item.it_no }">
						<img src="/imgfile/${item.it_img }" name="it_img" width="150px" height="150px" > <br>
						<input type="text" value="${item.it_title }" name="it_title"> <br>
						<input type="text" value="${item.it_price }" name="it_price">
						<input type="hidden" value="${item.it_state }" name="it_state">
						<!-- 글 상태 표시 -->
						<c:choose>
							<c:when test="${item.it_state == 0 }">
								<input type="text" value="판매중"> <br>
							</c:when>
							<c:when test="${item.it_state == 1 }">
								<input type="text" value="예약중"> <br>
							</c:when>
							<c:when test="${item.it_state == 2 }">
								<input type="text" value="판매완료"> <br>
							</c:when>
							<c:when test="${item.it_state == 3 }">
								<input type="text" value="삭제됨"> <br>
							</c:when>
							<c:otherwise>
								<input type="text" value="접근이상함"> <br>			
							</c:otherwise>
						</c:choose>
					</a> 
				</c:if>
			</c:forEach> 
		</c:if>	
	</div>
	
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">체험단을 모집합니다</h4>
			</div>
			<div class="modal-body">
				가게상호명 <br>
				<h3 class="ent_name"></h3>
				체험단 내용<br>
				<h3 class="exp_content"></h3>
				체험단 유의 사항<br>
				<h3 class="exp_notice"></h3>
				신청인원/체험단모집인원<br>
				<h3 class="exp_psn_ch exp_psn"></h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='';">신청하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">
$(function(){
	
	  var login = $("input[name='login']").val(); ;
      console.log(login);

      if(login == 'success'){
          alert('로그인 성공');
      }
      
      // 위치파악 
      var latitude = 0.0;
   	  var longitude = 0.0;
      
       function showPosition(pos){

      	latitude = pos.coords.latitude;
      	longitude = pos.coords.longitude;

        
		 $.ajax({
	 			type : "post",
	 			url : "/item/location",
	 			data : {"latitude" : latitude , "longitude" : longitude} ,
	 			dataType : "JSON",
	 			error: function(){
	 				alert("위치 파악 실패");
	 			},
	 			success : function(){
 					console.log(${latitude}+"#333");
 					console.log(${longitude}+"#333");
	 				
	 			} // success 끝	
	 		}); // ajax 끝

      

   	
     if(navigator.geolocation){

         navigator.geolocation.getCurrentPosition(showPosition);
         

     }else{
         alert("브라우저가 Geolocation을 지원하지 않습니다.");

     } 
     
     $.ajax({
 		url : "${contextPath}/ad/modalShow",
 		dataType : "json",
 		success : function(data){
 			console.log(data);
 			if(data != null){
 				$('#myModal').modal("show");
 				$.each(data,function(index,exp){
 					$.each(exp.entList,function(idx,ent){
 						$('.ent_name').append(ent.ent_name);
 					})
 					$('.exp_content').append(exp.exp_content);
 					$('.exp_notice').append(exp.exp_notice);
 					$('.exp_psn_ch').append(exp.exp_psn_ch);
 					$('.exp_psn').append("/"+exp.exp_psn);
 				}
 			});
 		},
 		error : function(){
 			alert("@@@@@@@@@@@");
 		}
	});//ajax
 });//ready
</script>
	
	<%@ include file="../include/userFooter.jsp" %>
	
</div><!-- 1 container -->	
</body>
</html>