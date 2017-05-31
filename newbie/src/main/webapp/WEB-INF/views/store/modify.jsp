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
							
							<input type='hidden' name='files' id='c'>

							<input type="hidden" id="hsno" name="sno" value="${mody.sno}">
							<input type="hidden" id="hpage" name="page"  value="${cri.page}">
							<input type="hidden" id="hkey" name="keyword" value="${cri.keyword}"> 
							<input type="hidden" id="htype" name="type"  value="${cri.type}">

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="first-name">Title<span class="required">*</span>
								</label>

								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="title" type="text" name="title"
										class="form-control col-md-7 col-xs-12" value="${mody.title}">

								</div>

							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="last-name">Content <span class="required">*</span>
								</label>

								<div class="col-md-6 col-sm-9 col-xs-12">
									<textarea id="con" class="form-control" name="content">${mody.content}</textarea>
								</div>

							</div>
							<div class="form-group">
								<label for="middle-name"
									class="control-label col-md-3 col-sm-3 col-xs-12">Writer*</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="write" class="form-control col-md-7 col-xs-12"
										type="text" name="writer" value="${mody.writer}">
								</div>
							</div>
							
							<div class="form-group">
								<label for="middle-name"
									class="control-label col-md-3 col-sm-3 col-xs-12">File*</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<button id="fileBtn" type="button"
										class="btn btn-round btn-default">Upload</button>

								</div>
							</div>


</br>
</br>


	<div class="col-md-9 col-sm-9" style="margin-left: 150px" >
              <div class="x_panel">
                <div class="x_title">
                  <h4 style="text-align:center"> 파일 미리보기</h4>
                
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <ul class="list-unstyled msg_list" id="uploadedList">
           
                    <ul class="fileUl"></ul>
						<ul class="newFileUl"></ul>
                    
                  </ul>
                </div>
              </div>
            </div>




					<!---------------- Modal ------------------->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">File Upload</h4>
										</div>


										<div class="modal-body">

											<form role="form">

									       
									            <input type="file" name="file" id='file'>
									        

											</form>
											

										</div>
										<div class="modal-footer">
											<button type="button" id="modalAddBtn"
												class="btn btn-success">Save</button>
											<button id="modClose" type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>
						<!-----------------end Modal  -------------->


							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">


									
									<button class="btn btn-primary" onclick="history.back()">Cancel</button>
									<button id="modiBtn" class="btn btn-success">Submit</button>	

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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<script>
	$(document).ready(function() {
		
		var filearr = new Array();
		var snoData = {sno: ${mody.sno}};
		var deleteFileList = "dummy=";
	//console.log(snoData);
	
	
		function listFile(snoData){
			
			
			$.ajax({
				url: "/file/fileList",
		    	type: "get",
		    	data: snoData,
		    	success: function(result){
		    		
		    		//console.log("받아오는result"+result);
		    		//result = 원본파일
		    		
		    		for(var i=0; i < result.length; i++){
					
						var thumName = result[i].replace("_", "_s_");
						
				
						var str=" <li><img name = '"+ thumName +"'src='/file/display?fileName="+thumName+"'>&nbsp;&nbsp;<a class='fa fa-close'></a></li>";
						 
						//$(".fileUl").append(str);
						$("#uploadedList").append(str);
						
						
		    		}
		    	}
			});
			
	};
	listFile(snoData);
	
	
	//수정하기 버튼
	$("#modiBtn").on("click", function(e) {
		e.preventDefault();
		
		if ($("#write").val() == ""|| $("#title").val() == ""|| $("#con").val() == "") {
			alert("값을 모두 입력하세요^^");
		} else {
		
		$("#c").val(filearr);
		$("#a2").submit();
		alert("수정완료^^");
		}
	});
	
	
	//write페이지에서 모달 버튼
	$("#fileBtn").click(function() {
		$("#myModal").modal("toggle");

	});
	
	
	
	//썸넬 들어가는 ul태크 x버튼
	  $("#uploadedList").on("click", "li a", function(e){
	
						 
				 var that = $(e.target);
				 
				 //섬넬 파일이름
 				var thumb =  that.prev()[0].name;

	
				//썸넬삭제
			 	$.ajax({
					url: "/file/delete",
					type: "get",
					data: {"thumbName": thumb},
					dataType:"text",
					success:function(result){
						
						alert("파일 삭제됨");
						
						//console.dir(that.closest("li").html());
						
						that.closest("li").remove();
						
		      		console.log("삭제된당");
		      		
				        } 
			    	}); 
			 	
		    });
	 
		
	
	
	 //모달창에서 파일 등록하기 버튼
		$("#modalAddBtn").click(function(){
			
			if($("#file").val() == ""){
				alert("파일을 선택해주세요^^")
			}else{
			
		    var formData = new FormData();
			var fileData = $("#file")[0].files[0];
		  
		    formData.append("file", fileData);
		
		    
			
		    $.ajax({
		    	url: "/file/upload",
		    	type: "post",
		    	data: formData,
		    	processData:false,
				contentType:false,
		    	success:function(result){
		    		//console.log("upload completed........")
		    	
		    		//result = 사진 썸넬 이름
		    		
		    		var str =  "<li id='file1'><img name = '"+ result +"'src='/file/display?fileName="+result+"'>&nbsp;&nbsp;<a class='fa fa-close'></a></li>";
		    	
		    		$("#uploadedList").append(str);
		   			
		    		filearr.push(result);
		    		$('#file').val('');
		    	}
		  
		    });
		    
		    $("#myModal").modal("hide");
		    
			}
		});
	 
	 
		//모달 취소버튼
	    $("#modClose").click(function(){
	    	$('#file').val('');
	    });
	
	
	});
	
</script>


</body>
</html>
