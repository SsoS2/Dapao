<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
   
    </div><!-- ./wrapper -->
	

</script>
	<script type="text/javascript">
	$(function() {
		var own_id = '${own_id}';
		/* 마우스이벤트  */
		$('.small-box-footer').hover(function() {
			$(this).css('color', 'cadetblue');
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css('color', 'white');
		});
		$('a').hover(function() {
			$(this).css("cursor", "pointer");
		});
		$('.info > a').hover(function() {
			$(this).css("color", "#2BBD26");
		}, function() {
			$(this).css('color', 'black');
		});

		/* 로그인해야 작동하게 */
		$('.small-box-footer').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				location.href = "/ent/entLogin";
				alert('로그인 이후 사용해주세요');
				return false;
			}
		});
		$('#coin').off("click").click(function(e) {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인이후 이용해주세요');
				e.preventDefault();
				location.href = "/ent/entLogin";
			}
		});
		$('.shop').off("click").click(function(e) {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인이후 이용해주세요');
				e.preventDefault();
				location.href = "/ent/entLogin";
			}
		});
		$('button[type=submit]').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인 이후 사용해주세요');
				location.href = "/ent/entLogin";
				return false;
			}
		});
	});
	</script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
    
    
  </body>
</html>