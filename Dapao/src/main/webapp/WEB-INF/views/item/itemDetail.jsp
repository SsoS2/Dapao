<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>


		<div id ="uploadResult">
			<ul></ul>
		</div>



	<fieldset>
		<form action=""  method="post">
		
			<c:if test="${!empty us_id }">
				<input type="text" value="${us_id }" id="session_us_id">
				<input type="text" value="${us_state }" id="session_us_state">
			</c:if>

			<c:if test="${!empty us_id && itemVO.us_id != us_id}">
				<input type="button" value="신고하기" onclick="location.href='../admin/acWriteForm?it_no=${itemVO.it_no}&us_id=${itemVO.us_id }';"> <br>
			</c:if>
			
			<!-- 글 상태 표시 -->
			<c:choose>
				<c:when test="${itemVO.it_state == 0 }">
					<input type="text" value="판매중"> <br>
				</c:when>
				<c:when test="${itemVO.it_state == 1 }">
					<input type="text" value="예약중"> <br>
				</c:when>
				<c:when test="${itemVO.it_state == 2 }">
					<input type="text" value="판매완료"> <br>
				</c:when>
				<c:otherwise>
					alert("삭제된 글입니다.");
					<c:redirect url="../user/userLogin"/>				
				</c:otherwise>
			</c:choose>
			
			<input type="hidden" value="${itemVO.it_no }" name="it_no"> <br>

			
 			<input type="text" value="${itemVO.it_title }" name="it_title">
			<input type="text" value="${itemVO.it_price }" name="it_price"> <br>
			찜수 <input type="text" value="${itemVO.it_love }" name="it_love"> | 
			조회수 <input type="text" value="${itemVO.it_view }" name="it_view">  | 
			등록일 <input type="text" value="${itemVO.it_regdate }" name="it_regdate"> <br>
			
				
			판매자 <a href="/item/yourPage?us_id=${itemVO.us_id }" >
			<input type="text" value="${sellerVO.us_nickname }" name="us_id"> </a> <br>
			카테고리 <input type="text" value="${itemVO.it_cate }" name="it_cate"> <br>
			상품상태 <input type="text" value="${itemVO.it_con }" name="it_con"> <br>
			<input type="text" value="${sellerVO.us_addr }" name="us_addr"> <br> 
			
			<input type="hidden" value="${itemVO.us_id }" name="us_id"> <br>
			 
			<!-- 로그인을 하지 않았을시 -->
			<c:if test="${empty us_id && itemVO.it_state != 2 }">
				<input type="button" value="로그인하고 구매하기" id="login_buy">
			</c:if>
			<!-- 찜 & 판다톡 -->
			<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state != 2 }">
				<input type="button" value="찜" id="addLoveBtn"> 
				<input type="hidden" value="${love}" id="love_value"> 
				<input type="button" value="판다톡" id="panda"> 
			</c:if>
			<!-- 구매자도 판매자도 아닐때 -->
			<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state != 2 && tradeVO.us_id != us_id}">
				<input type="button" value="구매하기" id="purchase"> 
			</c:if>
			<!-- 구매자가 예약 글에 들어옴 -->
			<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state == 1 && tradeVO.us_id.equals(us_id)}">
				<input type="button" value="구매확정하기" id="userPurchaseOK"> 
				<input type="button" value="취소하기" id="userCancleOK"> 
			</c:if>
			<!-- 판매자 본인의 글에 들어옴 -->
			<c:if test="${!empty us_id && itemVO.us_id.equals(us_id) && itemVO.it_state == 1}">
				<input type="button" value="구매확정하기" id="sellerPurchaseOK"> 
				<input type="button" value="취소하기" id="sellerCancleOK"> 
			</c:if>
			<!-- 예약중인 글에 구매자나 판매가자 들어왔다면 -->
			<c:if test="${tradeVO.tr_no != 0 }">
				<input type="hidden" value="${tradeVO.tr_no }" name="tr_no">
			</c:if>
			<!-- 판매가 완료된 글이라면 -->
			<c:if test="${itemVO.it_state == 2  }">
				<input type="button" value="판매 완료"> 
			</c:if>
			
		
		</form>
	</fieldset>
	
	<form action="">
		상세 내용 <br>
		<textarea rows="10" cols="10">${itemVO.it_content}</textarea>
	</form>

	
	<br><hr><br>
	<a>판매자의 다른 상품도 보기</a>
	<table border="1">
		<c:forEach var="si" items="${sellerItemVO}">
			<input type="hidden" value="${si.it_no }" name="it_no"> <br>
			<tr>
				<td  id ="uploadSeller">
					<img src="/imgfile/${si.it_img }" width="150px" height="150px">
				</td>
				<td>
					<a href="../item/itemDetail?it_no=${si.it_no }"><input type="text" value="${si.it_title }" name="it_title"> </a>
				</td>
		</c:forEach>
	</table>	
	
	<br><hr><br>
	<a>비슷한 상품 둘러보기</a>
	<table border="1">
		<c:forEach var="sc" items="${sameCateVO}">
			<input type="hidden" value="${sc.it_no }" name="it_no">
			<tr>
				<td id ="uploadCate">
					<img src="/imgfile/${sc.it_img }" width="150px" height="150px">
				</td>
				<td>
					<a href="../item/itemDetail?it_no=${sc.it_no }">${sc.it_title }</a>
				</td>
			</tr>
		</c:forEach> 	
	</table>
	
	
<!-- 구매하기 버튼 클릭시 Modal -->
<div id="purchaseModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매하시겠습니까?</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="modalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- user구매확정하기 버튼 클릭시 Modal -->
<div id="userPurchaseOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매확정 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="userPurchaseOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- seller구매확정하기 버튼 클릭시 Modal -->
<div id="sellerPurchaseOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매확정 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="sellerPurchaseOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- user취소하기 버튼 클릭시 Modal -->
<div id="userCancleOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">취소 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="userCancleOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- seller취소하기 버튼 클릭시 Modal -->
<div id="sellerCancleOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">취소 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="sellerCancleOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>
	

	
	<%@ include file="../include/userFooter.jsp" %>
	

<script type="text/javascript">


$(document).ready(function(){
	
	//var path = "F:\\upload" + ${si.it_img };
	//console.log(path);
	//$("#img src").html(path);
	
	var str="";
	var love = ${love};
	console.log("love : " + love);
	
	// 처음 찜 여부 확인 
	if(love == 0){
		$('#addLoveBtn').attr("value","찜하기");
	}else{
		
		$('#addLoveBtn').attr("value","찜취소");
	}
	
	// 처음 예약중인 글일때 구매&취소 버튼 클릭여부 확인
	// 예약글인지 확인
	var it_state = ${itemVO.it_state };
	
	if(it_state == 1){
		
		// 구매자
		var buyer_state = ${tradeVO.tr_buy_state };
		
		if(buyer_state == 1){ // 구매확정을 이미 누름
			$('#userPurchaseOK').attr("value","구매확정완료");
			$('#userPurchaseOK').attr("disabled","disabled");
			$('#userCancleOK').attr("disabled","disabled");
		}else if(buyer_state == 2){ // 취소버튼을 이미 누름
			$('#userCancleOK').attr("value","취소하기완료");
			$('#userPurchaseOK').attr("disabled","disabled");
			$('#userCancleOK').attr("disabled","disabled");
		}
		
		// 판매자
		var seller_state = ${tradeVO.tr_sell_state }
		
		if(buyer_state == 1){ // 구매확정을 이미 누름
			$('#sellerPurchaseOK').attr("value","구매확정완료");
			$('#sellerPurchaseOK').attr("disabled","disabled");
			$('#sellerCancleOK').attr("disabled","disabled");
		}else if(buyer_state == 2){ // 취소버튼을 이미 누름

			$('#sellerCancleOK').attr("value","취소하기완료");
			$('#sellerPurchaseOK').attr("disabled","disabled");
			$('#sellerCancleOK').attr("disabled","disabled");
		}
		
	}
	
	// 구매확정하기 or 취소하기 버튼 클릭시
	
	// 구매자가 구매확정 버튼클릭
	$('#userPurchaseOK').click(function(){
		$('#userPurchaseOKModal').modal("show");
	});
	
	$('#userPurchaseOKModalYes').click(function(){
		var it_no = ${itemVO.it_no };
		var tr_no = $("input[name='tr_no']").val();
		
		$.ajax({
			type : "post",
			url : "/item/userPurchaseOk",
			data : {"it_no" : it_no, "tr_no" : tr_no} ,
			dataType : "JSON",
			error: function(){
				alert("구매확정하기 실패");
			},
			success : function(){
					alert("구매확정하기 완료");
					location.reload();
					
				
			} // success 끝	
		}); // ajax 끝
		
	});
		
	
	// 구매자가 취소하기 버튼클릭
	$('#userCancleOK').click(function(){
		$('#userCancleOKModal').modal("show");
	});
	
	$('#userCancleOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = $("input[name='tr_no']").val();
		
		$.ajax({
			type : "post",
			url : "/item/userPurchaseCancle",
			data : {"it_no" : it_no, "tr_no" : tr_no} ,
			dataType : "JSON",
			error: function(){
				alert("취소하기 실패");
			},
			success : function(){
					alert("취소하기 완료");
					location.reload();
					
			} // success 끝	
		}); // ajax 끝
	});


	// 판매자가 구매확정 버튼클릭
		$('#sellerPurchaseOK').click(function(){
			$('#sellerPurchaseOKModal').modal("show");
	});
	

	$('#sellerPurchaseOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = $("input[name='tr_no']").val();
		
		$.ajax({
			type : "post",
			url : "/item/sellerPurchaseOk",
			data : {"it_no" : it_no, "tr_no" : tr_no} ,
			dataType : "JSON",
			error: function(){
				alert("구매확정하기 실패");
			},
			success : function(){
					alert("구매확정하기 완료");
					location.reload();
					
				
			} // success 끝	
		}); // ajax 끝
		
	});
	
	// 판매자가 취소하기 버튼클릭
	$('#sellerCancleOK').click(function(){
		$('#sellerCancleOKModal').modal("show");
	});
	
	
	$('#sellerCancleOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = $("input[name='tr_no']").val();
		
		$.ajax({
			type : "post",
			url : "/item/sellerPurchaseCancle",
			data : {"it_no" : it_no, "tr_no" : tr_no} ,
			dataType : "JSON",
			error: function(){
				alert("취소하기 실패");
			},
			success : function(){
					alert("취소하기 완료");
					location.reload();
					
				
			} // success 끝	
		}); // ajax 끝
	});
	
	// 파일 확인
	
	var it_no=$("input[name='it_no']").val();
	//alert(it_no);
	
	// 물건 상세 사진 확인 -콜백함수
	$.getJSON("/item/itemFile",{it_no:it_no},function(data){ 
	
				//alert("실행");
				console.log("function");
				console.log(data);
				
				
				$(data).each(function(i,file){
					console.log("반복");
					if(file.image){
						console.log("if");
						var filePath = encodeURIComponent(file.uploadPath + "/s_" + file.uuid+"_"+file.fileName);
						console.log(filePath);
						//src="/display?fileName='filePath'"
						str += "<img src='/item/display?fileName="+filePath+"'>";		
					}else{
						console.log("else");
						var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);
						//str+="<li><a href='/item/download?fileName="+filePath"'>"+file.fileName+"</a></li>";
					}
				}); // data.each
				console.log("@@str : ");
				console.log(str);
				$("#uploadResult ul").html(str);
	});// getJSON 
	

	// 찜버튼 클릭 
	$('#addLoveBtn').on("click", function(){
		//alert("찜버튼클릭");
		
		var love_value = $("input[id='love_value']").val();
		var it_no = $("input[name='it_no']").val();
		
		$.ajax({
			type : "get",
			url : "/item/itemLove",
			data : {"love_value" : love_value, "it_no" : it_no},
			dataType : "JSON",
			error: function(){
				alert("찜실패");
			},
			success : function(result){
				console.log(result)
				if(result == 1){
					if( love_value == 0){ // 찜하기 
						
						console.log(result);
						$('#love_value').attr("value",1);
						$('#addLoveBtn').attr("value","찜취소");
						alert("찜완료");
						console.log(love_value);
						
					}else{ // 찜취소
								
						console.log(result);
						$('#love_value').attr("value",0);
						$('#addLoveBtn').attr("value","찜하기");
						alert("찜취소");
						console.log(love_value);
					} //else
				}
			} // success 끝	
		}); // ajax 끝

	});
	
	// 로그인하고 구매하기 버튼클릭
	$('#login_buy').click(function(){
		location.href='../user/userLogin';			
	});
	
	
	
	// 판다톡 버튼클릭
	$('#panda').click(function(){
		
		if($("input[name='session_us_id']").val() != null){
			var us_state = $("input[name='session_us_state']").val();
			
			if(us_state == 1){ // 정지
				alert('정지기간에는 판다톡 이용할 수 없습니다.');
			}else if(us_state == 0){ // 정상
				
				
			}else{// 탈퇴
				alert('정상적이지 않은 접근입니다.');
			}		
		}
	});
	
	// 구매하기 버튼클릭
	$('#purchase').click(function(){
		
		var us_state = ${us_state };
		var it_state = ${itemVO.it_state};
		
		if(us_state == 1){ // 정지
			alert('정지기간에는 예약할 수 없습니다.');
		}else if(us_state == 0){ // 정상
			
			if(it_state == 0){
				$('#purchaseModal').modal("show");
			}else if(it_state == 1){
				alert('이미 예약된 상품입니다.');
			}else if(it_state == 2){
				alert('이미 판매된 상품입니다.');
			}
			else{
				alert('정상적이지 않은 접근입니다.');
			}
			
		}else{// 탈퇴
			alert('정상적이지 않은 접근입니다.');
		}	
		
	});
	
	$('#modalYes').click(function(){
		
		$.ajax({
			type : "post",
			url : "/item/purchase",
			data : {"it_no" : it_no},
			error: function(){
				alert("결제 시도 실패");
			},
			success : function(result){
				console.log("success");
				if(result == 0){
					alert("코인이 부족합니다.");
					
				}else{ // 구매성공
						alert("결제성공. 거래가 끝나면 '구매확인' 버튼을 눌러주세요.");
						location.reload();
				} //else
			} // success 끝	
		}); // ajax 끝
	});
	
});


</script>	
	
	

</body>
</html>