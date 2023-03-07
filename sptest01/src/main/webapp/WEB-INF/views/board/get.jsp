<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- header -->
<%@include file="../includes/header.jsp" %>
<!--  -->


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                           <!--  <div class="row"> -->
                                <div class="col-lg-6">
                                  <!--   <form role="form" action="/board/register" method="POST"> -->
                                        <div class="form-group">
                                            <label>번호</label>
                                            <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly">
                                           <!--  <p class="help-block">Example block-level help text here.</p> -->
                                        </div>
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input class="form-control" name="title" value='<c:out value="${board.title }"/>' readonly="readonly">
                                           <!--  <p class="help-block">Example block-level help text here.</p> -->
                                        </div>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="5" name="content" readonly="readonly">${board.content }</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly="readonly" >
                                          <!--   <p class="help-block">Example block-level help text here.</p> -->
                                        </div>
                                        <button data-oper="modify" class="btn btn-default">행복 수정</button>
                                        <button data-oper="list" class="btn btn-default" >목록</button>
                                        
                                    <!-- </form> -->
                                    
                                    <form id="operForm" action="/board/modify" method="get">
                                    	<input type="hidden" id="bno" name="bno" value="${board.bno }">
                                    	<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum }">
                                    	<input type="hidden" id="amount" name="amount" value="${cri.amount }">
                                    	
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <!-- /.col-lg-6 (nested) -->
                            <!-- </div> -->
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<script>
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove(); //bno를 제거하고 리스트로가야한다
			operForm.attr("action","/board/list");
			operForm.submit();
		})
	})
</script>


<!-- footer -->            
<%@include file="../includes/footer.jsp"%>
<!--  -->
