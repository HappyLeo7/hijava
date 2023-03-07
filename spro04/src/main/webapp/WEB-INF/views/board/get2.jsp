<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">게시글 조회</div>
			<div class="panel-body">
				<!--                             <div class="row"> -->
				<!--                                 <div class="col-lg-6"> -->
				
					<div class="form-group">
						<label>번호</label> <input class="form-control" name="bno"
						value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title"
						value='<c:out value="${board.title}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name="content" readonly>${board.content}</textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
						value="${board.writer}" readonly>
<!-- 						<p class="help-block">Example block-level help text here.</p> -->
					</div>
					
					<button data-oper='modify' class="btn btn-default">
									게시글 수정</button>
					<button data-oper='list' class="btn btn-default">게시글 목록</button>

					<form id='operForm' action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" value="${board.bno}">
						<input type="hidden" id="pageNum" name="pageNum"
								value="${cri.pageNum }">
						<input type="hidden" id="amount" name="amount" 
								value="${cri.amount }">
						<input type="hidden" id="type" name="type" value="${cri.type }">
						<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }">
					</form>
			</div>
			<!-- 댓글 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 댓글
							<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글추가</button>
						</div>
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-rno="12">
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong>
											<small class="pull-right text-muted">2023-01-17 13:09</small>
										 </div>
										 <p>댓글 내용 들어갈곳</p>
									</div>
									</li>
							</ul>
						</div>
						
						<div class="panel-footer">
						</div>
					</div>
				</div>
			</div>
			<!-- /댓글 -->
			
			
			
			
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">댓글 쓰기</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>댓글</label>
									<input class="form-control" name="reply" value="new reply!!">
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" name="replyer" value="new replyer">
								</div>
								<div class="form-group">
									<label>작성일자</label>
									<input class="form-control" name="replyDate" value="">
								</div>
							</div>
							<div class="modal-footer">
								<button id="modalModBtn" type="button" class="btn btn-warning"
									data-dismiss="modal">수정</button>
								<button id="modalRemoveBtn" type="button" class="btn btn-danger"
									data-dismiss="modal">삭제</button>
								<button id="modalRegisterBtn" type="button" class="btn btn-primary"
									data-dismiss="modal">등록</button>
								<button id="modalCloseBtn" type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<!-- 								<button type="button" class="btn btn-primary">Save changes</button> -->
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>


<!-- get 타입 -->
<!-- 
<script>
console.log("------------------");
console.log("reply JS test");
console.log("-----------------");
const bnoValue='<c:out value="${board.bno}"/>';
replyService.add({reply:"JS TEST", replyer:"tester", bno:bnoValue},
function(result){
alert("RESULT : "+result);
}
);


//되는코드
console.log(" ---- getList test ---- ");
replyService.getList({bno:bnoValue, page:1}, function(list){
   for(var i = 0, len=list.length || 0; i<len; i++){
      console.log(list[i]);
   }
});

//안되는코드
/* console.log("----getList test----");
replyService.getList({bno:bnoValue,	page:1}, function(list){
	for(var i =0, len=list.lenght || 0; i<len; i++){
		console.log(list[i]);
	}
}); */






console.log("--- remove test ---")
replyService.remove(10, function(result){
	console.log(result);
	if(result=="success"){
		alert("삭제 성공!");
	}
}, function(err){
	alert("삭제 실패#");
}
);

replyService.update(
		{
			rno:7, bno:bnoValue,reply:"update771237777 test by get.jsp"
		},function(result){
			alert("수정 완료!")
		});

/* 
replyService.get(7, function(data){
	console.log("==============get data ============>"+data);
})
*/
replyService.get(8, function(data) {
    console.log("==============get data ============>"+data);
 });

</script> 
-->



<!-- 처리완료 모달  -->
<script>
	$(document).ready(function(){
		console.log(replyService);		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
		})
		
	}) 

	

</script> 
<!-- /처리완료 모달 -->

<!-- 댓글 script -->
<script>
	$(document).ready(function(){
		const bnoValue='<c:out value="${board.bno}"/>';
		var replyUl =$(".chat");
		//페이지 1
		showList(1);
		
		 /* 오류코드
		 function showList(page){
			replyService.getListPage({bno:bnoValue, page:page||1}, function(replyCnt, list){
				//댓글페이지 페이지넘버
				console.log("replyCnt : " +replyCnt);
				console.log("list : " +list);
				
				if(page==-1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str="";
				if(list==null||list.length==0){
					replyUl.html("");
					return ;
				}
				for(var i=0, len=list.length||0;i<len;i++){
					str +="<li class'left clearfix' data-rno='"+list[i].rno+"'>";
					str +="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str +=" <p>"+list[i].reply+"</p></div></li>";
				}
				replyUl.html(str);	
			}); //end function
					
		 	//댓글의 페이지출력
			showReplyPage(replyCnt);
		} //end showList  */
	      
		/*정상코드1
		function showList(page){
	        		  console.log("페이지!!11:"+page);
	          replyService.getList({bno:bnoValue, page:page||1}, 
	                function(replyCnt, list){
	             
	        		  console.log("페이지!!22:"+page);
	                console.log("replyCnt : " + replyCnt);
	                console.log("list : " + list);
	                console.log(list);
	          
	                if(page==-1){
	                   pageNum = Math.ceil(replyCnt/10.0);
	                   showList(pageNum);
	                   return;
	                }
	          
	                  var str="";
	                   if(list==null||list.length==0){
	                         replyUl.html("");
	                         return;
	                   };
	                   
	                   for(var i=0, len=list.length||0;i<len;i++){
	                      str += "<li class'left clearfix' data-rno='"+list[i].rno+"'>";
	                      str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
	                      str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
	                      str += " <p>"+list[i].reply+"</p></div></li>";
	                      };
	                   replyUl.html(str);
	                   // 댓글의 페이지 출력
	                   showReplyPage(replyCnt);
	                }); //end function
	       }; //end showList 
	       */
	      function showList(page){
	          replyService.getList({bno:bnoValue, page:page||1}, 
	                function(replyCnt, list){
	             
	                console.log("replyCnt : " + replyCnt);
	                console.log("list : " + list);
	                console.log(list[9]);
	                console.log(list[11]);
	                if(page==-1){
	                   pageNum = Math.ceil(replyCnt/10.0);
	                   showList(pageNum);
	                   return;
	                }
	          
	                  var str="";
	                   if(list==null||list.length==0){
	                         replyUl.html("");
	                         return;
	                   };
	                   
	                   for(var i=0, len=list.length||0;i<len;i++){
	                      str += "<li class'left clearfix' data-rno='"+list[i].rno+"'>";
	                      str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
	                      str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
	                      str += " <p>"+list[i].reply+"</p></div></li>";
	                      };
	                   replyUl.html(str);
	                   // 댓글의 페이지 출력
	                   showReplyPage(replyCnt);
	                }); //end function
	       }; //end showList

	       
		
		//댓글 모달창 띄우기
		var modal = $("#myModal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide(); //가장가까운조상을 찾는다 closest
			modal.find("button[id !='modalCloseBtn']").hide()
			modalRegisterBtn.show();
			$("#myModal").modal("show");
		});
		
		//댓글을 클릭하면 모달창이 뜨면서 수정할수 있게한다.
		modalRegisterBtn.on("click",function(e){
			var reply={
					reply: modalInputReply.val(),
					replyer: modalInputReplyer.val(),
					bno: bnoValue
			};
			replyService.add(reply,function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
			});
			showList(-1);
		});
		
		//댓글 클릭시 수정 삭제 모달창이 뜬다.
		$(".chat").on("click","li",function(e){
			var rno=$(this).data("rno");
			console.log("***** rno ******>>>>"+rno);
			replyService.get(rno,function(reply){
				modalInputReply.val(reply.reply);			
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("rno", reply.rno);
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalInputReplyDate.closest("div").show();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				//화면에 띄어줌
				$(".modal").modal("show");
			});
		});
		
		
		modalModBtn.on("click",function(e){
		var reply = {rno: modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result){
			alert( "rno : "+result+"번 수정");
			modal.modal("hide");
			showList(pageNum);
		});
	}); 
		
		
		modalRemoveBtn.on("click",function(e){
			var rno = modal.data("rno");
			
			replyService.remove(rno, function(result){
				alert("rno : "+result+"번 삭제");
				showList(pageNum);
				
			});
			
		});
		//댓글 페이지
		/*
		var pageNum=1;
		var replyPageFooter=$(".panel-footer");
		*/
		
	     var pageNum = 1;
	      var replyPageFooter = $(".panel-footer");

		
		/*
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum/10.0)*10;
			var startNum =endNum -9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum*10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum*10 <= replyCnt){
				next=true;
			}
			var str="<ul class='pagination pull-right'>";
			if(prev){
				str +="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>이전</a></li>";
			}
			for(var i=startNum;i<=endNum;i++){
				var active = pageNum==i ? "active" : "";
				str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str +="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
			}
			str += "</ul></div>";
			console.log(str);
			replyPageFooter.html(str);
	
		}*/
		
		
		/////////정상코드////
		function showReplyPage(replyCnt){
	         var endNum = Math.ceil(pageNum / 10.0) * 10
	         var startNum = endNum - 9;
	         
	         var prev = startNum != 1;
	         var next = false;
	         
	         if(endNum * 10 >= replyCnt){
	            endNum = Math.ceil(replyCnt/10.0);
	         }
	         if(endNum * 10 <= replyCnt){
	            next=true;
	         }
	         
	         var str = "<ul class='pagination pull-right'>";
	         
	         /* 댓글-이전 페이지 */
	         if(prev){
	            str += "<li class='page-item'><a class='page-link' href='" 
	            + (startNum - 1) + "'> 이전</a></li>";
	         }
	         /* 댓글-다음 페이지 */
	         for(var i=startNum; i<=endNum; i++){
	            var active = pageNum==i ? "active":"";
	            str += "<li class='page-item "+ active +"'><a class='page-link' href='" +i+ "'>"+i+"</a></li>";
	         }
	            
	         if(next){
	            str += "<li class='page-item'><a class='page-link' href='" 
	            + (endNum + 1) + "'> 다음</a></li>";
	         }
	         
	         str += "</ul></div>";
	         console.log(str);
	         replyPageFooter.html(str);
	      }
	////////////
		
		// 페이지 넘어가는 구간
		/*
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum....페이지넘기는콘솔체크 : "+targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
			*/
		     replyPageFooter.on("click", "li a", function(e){
		         e.preventDefault();
		         console.log("Page Click!!");
		         var targetPageNum = $(this).attr("href");
		         console.log("Target Page Num => " + targetPageNum);
		         pageNum = targetPageNum;
		         showList(pageNum);

		})
	});
</script>
<!-- /댓글 script -->


<%@include file="../includes/footer.jsp"%>
