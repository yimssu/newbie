<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="right_col" role="main" style="min-height: 3392px;">

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					VIEW <small>${vo.regdate}</small>
				</h2>
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
				<ul class="list-unstyled timeline">
					<li>
						<div class="block">
							<div class="tags">
								<a class="tag"> <span>TITLE</span>
								</a>
							</div>
							<div class="block_content">
								<h2 class="title"></h2>
								${vo.title}
								<p class="excerpt"></p>
							</div>
						</div>
					</li>
					<li>
						<div class="block">
							<div class="tags">
								<a class="tag"> <span>CONTENT</span>
								</a>
							</div>
							<div class="block_content">
								<h2 class="title"></h2>
								${vo.content}
								<p class="excerpt"></p>
							</div>
						</div>
					</li>
					<li>
						<div class="block">
							<div class="tags">
								<a class="tag"> <span>WRITER</span>

								</a>
							</div>
							<div class="block_content">
								<h2 class="title"></h2>
								${vo.writer}
								<p class="excerpt"></p>
							</div>
						</div>
					</li>
					
				</ul>
				
				</br>
				
				
				<div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h4> FILE </h4>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="row">

                     
                      <div class="col-md-55">
               
                        <div class="imageFile">
                    
                          <ul class="fileList">
                         </ul>
                          
                        <!--  <div class="caption">
                         
                            <p>여기다가 파일이름 넣을끄야</p>
                          </div> -->
                             
                        
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
				
				
				
				
				
				<form id="a1" method="post">
				
					<input type="hidden" id="hsno" name="sno" value="${vo.sno}">
					<input type="hidden" id="hpage" name="page" value="${cri.page}">
					<input type="hidden" id="hkey" name="keyword"
						value="${cri.keyword}"> <input type="hidden" id="htype"
						name="type" value="${cri.type}">
					<button id="goList" class="btn btn-primary">목록</button>
					<button id="modBtn" class="btn btn-primary">수정</button>
					<button id="delBtn" class="btn btn-primary">삭제</button>

					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-primary" id="modalBtn">댓글쓰기</button>
				


			<!-------------- Modal ------------------->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Reply</h4>
								</div>


								<div class="modal-body">

									<form role="form">

										<div class="form-group">
											<label for="message-text" class="control-label">ReplyText*</label>
											<textarea class="form-control" id="newReplyText"></textarea>
										</div>
										<div class="form-group">
											<label for="recipient-name" class="control-label">Replyer*</label>
											<input type="text" class="form-control" id="newReplyWriter">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" id="replyAddBtn"
										class="btn btn-primary">Save</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
					<!-----------------end Modal  --------------->
					
					<!----------------- Modal2 ----------------->
					<div class="modal fade" id="myModal2" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Reply</h4>
								</div>


								<div class="modal-body">

									<form role="form">

										<div class="form-group">
											<label for="message-text" class="control-label">ReplyText*</label>
											<textarea class="form-control" id="newReplyText2" ></textarea>
										</div>
										<div class="form-group">
											<label for="recipient-name" class="control-label">Replyer*</label>
											<input type="text" class="form-control" id="newReplyWriter2">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" id="replyAddBtn2"
										class="btn btn-primary">Save</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
			<!----------------end Modal  -------------------->


				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					<i class="fa fa-align-left"></i> ReplyList
				</h2>
			
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<!-- start accordion -->
				<div class="accordion" id="accordion1" role="tablist"
					aria-multiselectable="true">
					<div class="panel">

						<div id="collapseOne1" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Rno</th>
											<th>ReplyContent
											
											</th>
											<th>Writer</th>
											<th>Regdate</th>
											<th></th>
										</tr>
									</thead>
									
									<tbody id="replies">
								
									</tbody>
									
																	
								</table>
								
								
								<ul class="pagination pagination-sm no-margin pull-right" >
								
									</ul>
									
				
				
							</div>
							
						
						</div>
						
					</div>

				</div>
				<!-- end of accordion -->
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
	$(document).ready(function() {
				
				var rno=0;
				var text=0;
				var page = 1;
				var sno = ${vo.sno};
				var snoData = {sno: ${vo.sno}};
				var deleteFileList = "dummy=";
				
				function refreshList() {
					
					
					//var j = 1;
					
					
					$.getJSON("/replies/" + sno +"/"+page, function(data) {
						
						//console.log(data);
						
						var str = "";
						
						//댓글 리스트 불러오기
						$(data).each(function() {
								
							for (var i = 0, len = data.list.length; i < len; i++) {
								
								console.log(data.list[i]);
								
							 	str += "<tr><td data-rno =" + data.list[i].rno +">"
										+ data.list[i].rno + "</td>" + "<td>" + data.list[i].replytext + "</td>"
										+ "<td>" + data.list[i].replyer + "</td>" + "<td>"
										+ data.list[i].regdate+ "</td>"+ "<td>" 
										
										+'<ul class="nav navbar-right panel_toolbox">'
										+'<li><a class="modify-link"><i class="fa fa-wrench"></i></a></li>'
										+'<li><a class="close-link"><i class="fa fa-close"></i></a></li>'
									    +'</ul>'
										+ "</td></tr>" 
										

									
							};
						
							$("#replies").html(str);
						
							// 댓글 페이징 하는거
							$(data.pageMaker).each(function(){
								
								var str2 = "";
								
								 if (data.pageMaker.prev) {
									str2 += "<li><a href='" + (data.pageMaker.start - 1)
											+ "'> << </a></li>";
								}
								for (var i = data.pageMaker.start, len = data.pageMaker.end; i <= len; i++) {
									var strClass = data.pageMaker.cri.page == i ? 'class=active' : '';
									str2 += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
								}
								if (data.pageMaker.next) {
									str2 += "<li><a href='" + (data.pageMaker.end + 1)
											+ "'> >> </a></li>";
								}
								
								$(".pagination").html(str2);
								 
						});
						
						});	
						
					}); 
				};
				
				refreshList();

				
				// 파일 미리보기 보여주기(파일 리스트 가지고오기)
			 	 function getFile(snoData){
					
					var fileList = $(".fileList");
					
					
					$.ajax({
						url: "/file/fileList",
						type: 'get',
						data: snoData,
						success: function(result){
							
							//console.log(fileList.contents());
							
							fileList.contents().remove();
							
							for(var i=0; i < result.length; i++){
								
								 var str="<li style='list-style-type: none'><img name='"+result[i]+"'src='/file/display?fileName="
										+result[i]+"'></li></br>"; 
								fileList.append(str);
							}
						}
					})
				};
				getFile(snoData);  
				
				
				/* 페이징 */
				$(".pagination").on("click","li a", function(e){
					e.preventDefault();
					page = $(this).attr("href");
					
					
					refreshList(page);
					
				
				});
				
				
					// 글 삭제 버튼
				$("#delBtn").on("click", function(e) {
					e.preventDefault();
					
								
				 	   $(".fileList img").each(function(i){
				 		 deleteFileList += "&thumbName=" + $(".fileList img")[i].name.replace("_", "_s_");
					});
				 	   
				 	   
					$.ajax({
						url: "/file/delete",
						type: "get",
						data: deleteFileList
					});
					
				
					$("#a1").submit();
					alert("삭제완료^^");
				});

	
				//글 수정 버튼
				$("#modBtn").on("click",function(e) {
							e.preventDefault();

							$("#a1").attr("action", "/store/modify").attr(
									"method", "get").submit();
						});

				// 글 목록 버튼
				$("#goList").on(
						"click",
						function(e) {
							e.preventDefault();
							$("#a1").attr("action", "/store/list").attr(
									"method", "get").submit();

						});

				//댓글쓰기 버튼
				$("#modalBtn").click(function() {
					$("#myModal").modal("toggle");
				});
				
				//댓글 리스트 불러오기
				$("#replies").on("click","tr td ul li .modify-link", function (e) {
					var replyerObj = $("#newReplyWriter2");
					var replytextObj = $("#newReplyText2");
					
					text = ($(this).parent().parent().parent().parent().children().eq(1).text());
					replyer = ($(this).parent().parent().parent().parent().children().eq(2).text());
					replytextObj.val(text);
					replyerObj.val(replyer);
					
					rno = ($(this).parent().parent().parent().parent().children().first().attr("data-rno"));
					//console.log(rno);
					$("#myModal2").modal("toggle");
				});
				
				
				//댓글 등록 버튼
				$("#replyAddBtn").on("click", function (e) {
					e.preventDefault();
					var replyerObj = $("#newReplyWriter");
					var replytextObj = $("#newReplyText");
					var replyer = replyerObj.val();
					var replytext = replytextObj.val();
					var sno = ${vo.sno};
					//console.log(replyer);
					//console.log(replytext);
					$.ajax({
						type:'post',
						url:'/replies/' + sno,
						headers: {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override":"POST"},
							dataType : 'text',
							data : JSON.stringify({sno:${vo.sno}, replyer:replyer, replytext:replytext}),
							success:function(result){
								//console.log("result: " + result);
									alert("등록완료^^");
									$("#myModal").modal('hide');
									replyerObj.val("");
									replytextObj.val("");
									refreshList();
									
									
								
							}
							
							
					});
					
					
				});
	
				
				//댓글 수정
				$("#replyAddBtn2").on("click",function (e) {
					e.preventDefault();
					var replyerObj = $("#newReplyWriter2");
					var replytextObj = $("#newReplyText2");
					var replyer = replyerObj.val();
					var replytext = replytextObj.val();
					
					//console.log(replyer);
					//console.log(replytext);
					$.ajax({
						type:'put',
						url:'/replies/' + rno,
						headers: {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override":"PUT"},
							dataType : 'text',
							data : JSON.stringify({rno:rno, replyer:replyer, replytext:replytext}),
							success:function(result){
								//console.log("result: " + result);
									alert("수정완료^^");
									$("#myModal2").modal('hide');
									replyerObj.val("");
									replytextObj.val("");
									refreshList();
									
									
								
							}
							
							
					});
					
				});
				
				
				//댓글 삭제
				  $("#replies").on("click","tr td ul li .close-link", function (e) {
					e.preventDefault();
					var rno = ($(this).parent().parent().parent().parent().children().first().attr("data-rno"));
					//console.log(rno);
					$.ajax({
						type:'delete',
						url:'/replies/' + rno,
						headers: {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override":"DELETE"},
							dataType : 'text',
							success:function(result){
								//console.log("result: " + result);
									alert("삭제완료^^");
									refreshList();
									
									
								
							} 
							
							
					});
					
				}); 

			});
</script>

</body>
</html>