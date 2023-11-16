<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../include/entHeader.jsp"%>

<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<style>
.box-body {
	display: flex;
	justify-content: center;
}
.item{
	width: 400px;
	height: 400px;
}
.carousel-inner>.item>img{
	width: 400px;
	height: 400px;
}
.users-list>li img{
	width: 400px;
	height: 300px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.review').slimScroll({
			height : '250px'
		});
		
	});
	
</script>
<div class="box box-success">
	<div class="box-header with-border"></div>
	<div class="ent_container">
		<div class="img_container">
			<div class="box-body">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<c:if test="${imgList[1] != null }">
							<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
						</c:if>
						<c:if test="${imgList[2] != null }">
							<li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
						</c:if>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="${pageContext.request.contextPath }/ent/download?imageFileName=${imgList[0]}" alt="First slide" width="400px" height="400px">
						</div>
						<c:if test="${imgList[1] != null }">
							<div class="item">
								<img src="${pageContext.request.contextPath }/ent/download?imageFileName=${imgList[1]}" alt="Second slide" width="400px" height="400px">
							</div>
						</c:if>
						<c:if test="${imgList[2] != null }">
							<div class="item">
								<img src="${pageContext.request.contextPath }/ent/download?imageFileName=${imgList[2]}" alt="Third slide" width="400px" height="400px">
							</div>
						</c:if>
					</div>
					<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="fa fa-angle-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="fa fa-angle-right"></span>
					</a>
				</div>
			</div>

			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>체험단 신청</h3>
				</div>
				<div class="icon">
					<i class="ion ion-person-add"></i>
				</div>
				<a href="#" class="small-box-footer">신청하기 <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">공지사항</a></li>
				<li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">가게 소개글</a></li>
				<li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">운영시간</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">${ent.ent_notice}</div>

				<div class="tab-pane" id="tab_2">${ent.ent_info}</div>

				<div class="tab-pane" id="tab_3">${ent.ent_ot}-${ent.ent_ct }</div>
			</div>

		</div>
		<div class="box box-success">
			<div class="box-header with-border">
				<i class="fa fa-map-marker"></i>
				<h3 class="box-title">가게 위치</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
				</div>
			</div>

			<div class="box-body no-padding">
				<div id="map" style="width: 500px; height: 400px;"></div>
			</div>
		</div>

		<div class="review_container">
			<div class="box box-success">
				<div class="box-header with-border">
					<i class="fa fa-comment"></i>
					<h3 class="box-title">리뷰</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="box-body no-padding">
					<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: auto;">
						<div class="box-body chat" id="chat-box" style="overflow: hidden; width: auto; height: auto;">
							<div class="review">
								<c:forEach items="${rlist }" var="rv">
									<div class="item">
										<img src="/resources/dist/img/user4-128x128.jpg" alt="user image">
										<p class="name">${rv.rv_buy_id }</p>
										<p class="message">${rv.rv_content }</p>
										<c:forEach begin="1" end="${rv.rv_star }" step="1">★</c:forEach>
									</div>
								</c:forEach>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="box box-success">
			<div class="box-header with-border">
				<i class="fa fa-search"></i>
				<h3 class="box-title">제품 소개</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
				</div>
			</div>

			<div class="box-body no-padding">
				<ul class="users-list clearfix">
					<c:forEach items="${plist }" var="prod">
						<li><img src="${pageContext.request.contextPath }/ent/download?imageFileName=${prod.prod_img }" width="300px" height="300px">
							<p>${prod.prod_name }</p> <span class="users-list-date">${prod.prod_price }원</span></li>
					</c:forEach>
				</ul>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a41c6623d85b187520b3d92f4b708850&libraries=services"></script>
​
<script type="text/javascript">
	var container = document.getElementById('map'), //지도를 담을 영역의 DOM 레퍼런스
	options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					'${ent.ent_addr}',
					function(result, status) {
						// 	geocoder.addressSearch(
						// 					'부산시 영도구 영선대로 34',
						// 					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${ent.ent_name}</div>'
									// 										content : '<div style="width:150px;text-align:center;padding:6px 0;">검색한 위치</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>

<%@ include file="../include/footer.jsp"%>