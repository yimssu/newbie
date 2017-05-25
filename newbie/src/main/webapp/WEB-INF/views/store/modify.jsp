<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="right_col" role="main" style="min-height: 3771px;">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>Modify</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">

						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br>
						<form id="a2" method="post" action = "/store/modify"
							class="form-horizontal form-label-left">

							<input type="hidden" id="hsno" name="sno" value="${mody.sno}">
							<input type="hidden" id="hpage" name="page"  value="${cri.page}">
							<input type="hidden" id="hkey" name="keyword" value="${cri.keyword}"> 
							<input type="hidden" id="htype" name="type"  value="${cri.type}">

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="first-name">Title<span class="required">*</span>
								</label>

								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="title"
										class="form-control col-md-7 col-xs-12" value="${mody.title}">

								</div>

							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="last-name">Content <span class="required">*</span>
								</label>

								<div class="col-md-6 col-sm-9 col-xs-12">
									<textarea class="form-control" name="content">${mody.content}</textarea>
								</div>

							</div>
							<div class="form-group">
								<label for="middle-name"
									class="control-label col-md-3 col-sm-3 col-xs-12">Writer*</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="middle-name" class="form-control col-md-7 col-xs-12"
										type="text" name="writer" value="${mody.writer}">
								</div>
							</div>


							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">


									<button id="modiBtn" class="btn btn-success">수정</button>
									<button class="btn btn-success" onclick="history.back()">취소</button>

								</div>
							</div>

						</form>
								
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous">
	
</script>




<script>
	$(document).ready(function() {	
		$("#modiBtn").on("click", function(e) {
			e.preventDefault();
			
			$("#a2").submit();
			alert("수정완료^^");

		});
			
	});
</script>


</body>
</html>
