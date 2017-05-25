<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="right_col" role="main" style="min-height: 3771px;">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>새글쓰기</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">

						
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br>
						<form id="demo-form2" data-parsley-validate="" method="post"
							class="form-horizontal form-label-left" novalidate="">
							
							<input type='hidden' name='files' id='c'>
							
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="first-name">Title<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="title" id="title" required="required"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="last-name">Content <span class="required">*</span>
								</label>

								<div class="col-md-6 col-sm-9 col-xs-12">
									<textarea id="con" class="form-control" name="content"></textarea>
								</div>

							</div>
							<div class="form-group">
								<label for="middle-name"
									class="control-label col-md-3 col-sm-3 col-xs-12">Writer*</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="write" class="form-control col-md-7 col-xs-12"
										type="text" name="writer">
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
        
                    
                  </ul>
                </div>
              </div>
            </div>







							<!-- Modal -->
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
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>
							<!--end Modal  -->



					

							<div class="ln_solid" ></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<a href="/store/list" class="btn btn-primary" type="button">Cancel</a>
									<button class="btn btn-primary" type="reset">Reset</button>
									<button type="submit" id="subBtn" class="btn btn-success">Submit</button>

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
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(
			function(event) {

				var filearr = new Array();
				
				$("#subBtn").on("click",function(e) {
							e.preventDefault();
							
							if ($("#write").val() == ""|| $("#title").val() == ""|| $("#con").val() == "") {
								alert("값을 모두 입력하세요^^");
							} else {
										$("#c").val(filearr);
										$("#demo-form2").submit();
									}
								
								
							});
						
				

				//write페이지에서 모달 버튼
				$("#fileBtn").click(function() {
					$("#myModal").modal("toggle");

				});
				
				//모달창에서 파일 등록하기 버튼
				$("#modalAddBtn").click(function(){
					
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
				    		console.log("upload completed........")
				    	
				    		
				    		//var str = "<li><img src='/file/display?fileName="+result+"'><button >삭제</button></li>";
				    		
				    		var str =  "<li><img src='/file/display?fileName="+result+"'>&nbsp;&nbsp;<a class='fa fa-close'></a></li>";
				    		//var str2 = "<input type='hidden' name='file' value='"+ result +"'>";
				    		$("#uploadedList").append(str);
				    		//$("#demo-form2").append(str2);
				    		filearr.push(result);
				    		
				    	}
				    
				    
				    });
				    
				    $("#myModal").modal("hide");
				    
				});
				
				//썸넬 들어가는 ul태크
				/* $(".uploadedList").on("click", "button", function(e){
				
				}); */
				
				
				
				
				
				
				
			});
</script>


</body>
</html>
