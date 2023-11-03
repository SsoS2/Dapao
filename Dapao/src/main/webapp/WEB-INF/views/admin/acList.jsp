<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

	<h1>/admin/acList.jsp</h1>
<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">신고 리스트</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고자</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">피신고자</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고사유</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">상품번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고일</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">처리결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="ac_no">${vo.ac_no }</a></td>
						<td>${vo.us_id }</td>
						<td>${vo.ac_own_id+vo_ac_us_id }</td>
						<td>${vo.ac_cate }</td>
						<td>${vo.ac_item }</td>
						<td>${vo.ac_regdate}</td>
						<c:choose>
							<c:when test="${vo.ac_state eq '0' }">
								<td><button type="button" class="acState" value="${vo.ac_state }">접수</button></td>
							</c:when>
							<c:when test="${vo.ac_state eq '1' }">
								<td><button type="button" class="acState" value="${vo.ac_state }">처리</button></td>
							</c:when>
						</c:choose>
						<td>${vo.ac_result}</td>
						</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">

			<c:if test="${pageVO.prev }">
				<li><a href="/admin/acList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/acList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/acList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>

<!-- Modal -->
<div id="myLargeModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">신고</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">신고번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="us_id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">피신고자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">상품번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_item"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고사유</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_cate"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_content"><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<select name="ac_result" class="btn btn-default" aria-label="Small select example">
					<option selected>정지기간</option>
					<option value="정지7일">정지7일</option>
					<option value="정지30일">정지30일</option>
					<option value="정지100일">정지100일</option>
					<option value="영구정지">영구정지</option>
				</select>
				<button type="button" class="btn btn-default" name="ac_result" class="ac_result">정지</button>
				<button type="button" class="btn btn-default" name="update" class="delete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		$('.ac_no').click(function() {
			$('#myLargeModal').modal("show");

			$.ajax({
				url : "/admin/acInfo",
				data : {
					"ac_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=ac_no]').val(data.ac_no)
					$('input[name=us_id]').val(data.us_id)
					if(data.ac_own_id == null || data.ac_own_id == ""){
						$('input[name=id]').val(data.ac_us_id)
					}
					if(data.ac_us_id == null || data.ac_us_id == ""){
						$('input[name=id]').val(data.ac_own_id)
					}
					$('input[name=ac_item]').val(data.ac_item)
					$('input[name=ac_cate]').val(data.ac_cate)
					$('input[name=ac_content]').val(data.ac_content)
				},
				error : function() {
					console.log("오류");
				}
			});// ac_no click ajax
		});// ac_no click
		$('ac_result').click(function(){
			
		});
		// 접수 버튼 클릭시 
		$('.acState').click(function(){
			var state = $(this).text();
			console.log("state : "+state);
			
			if(state == '접수'){
				$.ajax({
					url:"/admin/acHandling",
					data:{"ac_no" : $('input[name=ac_no]').val()},
					dataType:"json",
					success:function(data){
						console.log("성공결과 : "+data);
						alert("처리되었습니다.")
						location.replace("/admin/acList");
					},
					error:function(){
						console.log("에러");
					}
				});// 접수버튼 클릭시 ajax
			}// if
		}) // 접수 버튼 클릭시
	});//ready
</script>


<%@include file="../include/footer.jsp"%>