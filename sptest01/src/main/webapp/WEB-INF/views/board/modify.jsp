<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- header -->
<%@include file="../includes/header.jsp"%>
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
			<div class="panel-heading">Basic Form Elements</div>
			<div class="panel-body">
				<!--  <div class="row"> -->
				<div class="col-lg-6">
					<form role="form" action="/board/modify" method="POST">
						<input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<div class="form-group">
							<label>번호</label> <input class="form-control" name="bno"
								value='<c:out value="${board.bno }"/>' readonly="readonly">
							<!--  <p class="help-block">Example block-level help text here.</p> -->
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
								value='<c:out value="${board.title }"/>'>
							<!--  <p class="help-block">Example block-level help text here.</p> -->
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name="content">${board.content }</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
								value='<c:out value="${board.writer }"/>' readonly="readonly">
							<!--   <p class="help-block">Example block-level help text here.</p> -->
						</div>



						<div class="form-group">
							<label>등록일자</label> <input class="form-control" name="regDate"
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate}"/>'
								readonly="readonly">
						</div>

						<div class="form-group">
							<label>수정일</label> <input class="form-control" name="updateDate"
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>'
								readonly>
						</div>
						<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
						<button type="submit" data-oper="list" class="btn btn-info">목록</button>
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

<!-- 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log("operation =========" + operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove").attr("method", "POST");

			} else if (operation === 'modify') {
				formObj.attr("action", "/board/modify").attr("method", "POST");
			} else if (operation === 'list') {
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone;
				var amountTag = $("input[name='amount']").clone;

				formObj.empty();
				formObj.attr(PageNumTag);
				formObj.attr(amountTag);

			}
			formObj.submit();

		})
	})
</script>


<!-- footer -->
<%@include file="../includes/footer.jsp"%>
<!--  -->
