<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">

			<div class="x_title">
				<h2>
					NEWBIE table <small>2017.05.08</small>
				</h2>
				
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Sno</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Regdate</th>
							<th>Updatedate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.sno}</td>
								<td><a class="sview" href="${list.sno}">${list.title}</a></td>
								<td>${list.writer}</td>
								<td>${list.regdate}</td>
								<td>${list.updatedate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<form id='f1' action="/store/list" method="get">
					<input type='hidden' id='hpage' name='page' value="${pageMaker.current}"> <input
						type='hidden' id='hsno' name='sno'> <select name="type">
						<option value='x' ${cri.type eq 'x' ? "selected" : "" }>---------------</option>
						<option value='n' ${cri.type eq 'n' ? "selected" : "" }>Title</option>
						<option value='c' ${cri.type eq 'c' ? "selected" : "" }>Writer</option>
					</select> <input type="text" name="keyword" value="${cri.keyword }">
					<button id="searchBtn">검색</button>
				</form>

				<form id="write" action="/store/write" method="get">
					<button id="regBtn" class="btn btn-primary">글등록</button>
				</form>


				<ul class="pagination pagination-sm no-margin pull-right">
					<c:if test="${pageMaker.prev }">
						<li><a href="${pageMaker.start -1 }"> << </a></li>
					</c:if>

					<c:forEach begin="${pageMaker.start }" end="${pageMaker.end }"
						var="idx">
						<li class='${idx == pageMaker.current?"active":"" }'><a
							href="${idx}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li><a href="${pageMaker.end +1 }"> >> </a></li>
					</c:if>
				</ul>

			</div>
		</div>
	</div>


</div>
/page content footer content
<footer>
	<div class="pull-right">
		Gentelella - Bootstrap Admin Template by <a
			href="https://colorlib.com">Colorlib</a>
	</div>
	<div class="clearfix"></div>
</footer>
/footer content
</div>
</div>


jQuery
<script src="../vendors/jquery/dist/jquery.min.js"></script>
Bootstrap
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
FastClick
<script src="../vendors/fastclick/lib/fastclick.js"></script>
NProgress
<script src="../vendors/nprogress/nprogress.js"></script>
Chart.js
<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
gauge.js
<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
bootstrap-progressbar
<script
	src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
iCheck
<script src="../vendors/iCheck/icheck.min.js"></script>
Skycons
<script src="../vendors/skycons/skycons.js"></script>
Flot
<script src="../vendors/Flot/jquery.flot.js"></script>
<script src="../vendors/Flot/jquery.flot.pie.js"></script>
<script src="../vendors/Flot/jquery.flot.time.js"></script>
<script src="../vendors/Flot/jquery.flot.stack.js"></script>
<script src="../vendors/Flot/jquery.flot.resize.js"></script>
Flot plugins
<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
DateJS
<script src="../vendors/DateJS/build/date.js"></script>
JQVMap
<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
bootstrap-daterangepicker
<script src="../vendors/moment/min/moment.min.js"></script>
<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

Custom Theme Scripts
<script src="../build/js/custom.min.js"></script>



<script>
	$(document).ready(function(event) {

		$(".pagination li a").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").submit();
		});

		$(".sview").on("click", function(e) {
			e.preventDefault();
			$("#hsno").val($(this).attr("href"));
			$("#f1").attr("action", "/store/view").submit();
		});
		
		$("#searchBtn").on("click" , function (e) {
			e.preventDefault();
			$("#hpage").val("1");
			$("#f1").submit();
			
		});

	});
</script>

<script>
	var result = '${param.msg}';

	if (result == "success") {

		alert("글이 등록되었습니다^^");

		history.pushState(null, null, "/store/list");

	};

	window.onpopstate = function(e) {
		history.go(1);
	};
</script>

</body>
</html>