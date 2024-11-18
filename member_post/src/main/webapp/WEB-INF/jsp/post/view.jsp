<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp" />
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment-with-locales.min.js" integrity="sha512-4F1cxYdMiAW98oomSLaygEwmCnIP38pb4Kx70yQYqRwLVCs3DbRumfBq82T08g/4LJ/smbFGFpmeFlQgoDccgg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<hr>
		<main class="container">
			<div class="clearfix my-4">
				<h2 class="fw-bold text-big"><i class="fa-solid fa-book-open text-primary"></i> POST VIEW </h2>
				<a href="/write" class="btn btn-outline-dark btn-warning float-end fw-bold">POST</a>
			</div>
            <div class="my-3 col-md-9 mx-auto">
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-font text-primary"></i><b> Title </b></label>
                <input type="text" class="form-control" id="title" placeholder="input title" name="title" value="${post.title}"  disabled>
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen text-primary"></i><b> Writer </b></label>
                <input type="text" class="form-control" id="writer" placeholder="writer" name="writer" value="${post.writer}" disabled>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square text-primary"></i><b> Content </b></label>
                <textarea rows="15" type="text" class="form-control" id="title" placeholder="input content" name="content" disabled>${post.content}</textarea>
                
                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check text-primary"></i><b> Date written </b></label>
                <input type="text" class="form-control" id="regdate" placeholder="regdate" name="regdate" value="${post.regDate}" disabled>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature text-primary"></i><b> Altered date </b></label>
                <input type="text" class="form-control" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updateDate}" disabled>
				<label class="form-label mt-3"><i class="fa-solid fa-paperclip text-primary"></i><b> Attach </b></label>
                <input type="file" id="attach" name="files" class="d-none" multiple>
				
				<ul class="list-group attach-result justify-content-center">
					<c:if test="${empty post.attachs}">
					<li class="list-group-item">no attachs.</li>
					</c:if>
					<c:forEach items="${post.attachs}" var="a">
						<li class="list-group-item"><a href="${cp}download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">${a.origin}</a></li>
					</c:forEach>
					<div class="clearfix my-2">
						<label class="form-label float-start"><i class="fa-regular fa-comment-dots text-primary"></i> <b>Reply</b> </label>
						<button type="button" class="btn btn-primary btn-sm float-end" id="btnWriteReply"> Write Reply </button>						
					</div>
					<ul class="replies">
					</ul>
				</ul>
             <div class="text-center mt-5 mb-2">
             		<c:if test="${post.writer == member.id}">
             		<a href="modify?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-dark"> ALTER </a>
             		<a href="remove?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-danger border-dark" onclick="return confirm('Delete this post?')"> DELETE </a>
             		</c:if>
                    <a href="list?${criteria.qs2}" class="btn btn-outline-warning border-dark">RETURN</a>
             </div>
            </div>
		</main>
		<script src="${cp}js/reply.js"></script>
		<script>
			moment.locale("ko");
			const pno = '${post.pno}';
			// 목록 조회
			function list(){
				replyService.list(pno, function(data) {
					let str="";
					for(let i in data){
						str += makeLi(data[i]);
					}
					$(".replies").html(str);
				});
				// replyService.write({content:'abcd'});
			}
			list();
			
			// 단일 리스트 문자열 생성
			function makeLi(reply) {
                return `<li class="list-group-item" data-rno="\${reply.rno}">
                                <p class="text-black fw-bold mt-3 text-truncate">\${reply.content}</p>
                                <div class="clearfix text-secondary">
                                    <span class="float-start">\${reply.writer}</span>
                                    <span class="float-end small small small">\${moment(reply.regDate, 'yyyy/MM/DD-HH:mm:ss').fromNow()}</span>
                                    <a class=" float-end small small small text-danger mx-2 btn-reply-remove" href="#">DEL</a>
                                </div>
                        </li>`;
            }
			
			// li 클릭 시 이벤트
			$(".replies").on("click", "li", function(){
				//console.log($(this).data("rno"));
				const rno = $(this).data("rno");
				replyService.view(rno, function(data){
					$("#replyModal").find(".modal-footer div button").hide().filter(":gt(0)").show();
					// jQuery에서는 특히 setter 시에는 무조건 체이닝 가능.
					$("#replyModal").data("rno", rno).modal("show");
					$("#replyContent").val(data.content);
					$("#replyWriter").val(data.writer);
					console.log(data);
				})
			});
			
			// 삭제 시 이벤트
			$(".replies").on("click", "li .btn-reply-remove", function(){
				if(! confirm("삭제하시겠습니까?")){
					return false;
				}
				const rno = $(this).closest("li").data("rno");
				//console.log($(this).data("rno"))
				replyService.remove(rno, function(data){
					alert("삭제 되었습니다.");
					list();
				});
				return false; // 기본 이벤트도 안하고, 이벤트 전달도 안하고, 기본 이벤트도 없엔다.
				// 하지만 false 키워드는 매우 강력한 키워드이므로 남발 불가임. 
				// 따라서 preventDefault를 사용하는것이 좋음.
			});
			
			// 댓글 쓰기 버튼 클릭시
			$("#btnWriteReply").click(function(){
				$("#replyModal").find(".modal-footer div button").hide().filter(":eq(0)").show();
				$("#replyModal").modal("show");
				$("#replyContent").val("");
				$("#replyWriter").val("${member.id}");
			})
			
			$(function(){
				// 댓글 작성(반영) 버튼 클릭시
				$("#btnReplySubmit").click(function(){
					const writer = $("#replyWriter").val();
					const content = $("#replyContent").val();;
					const reply = {pno, writer, content};
					replyService.write(reply, function(data){
						$("#replyModal").modal("hide");
						list();
					});
				});
				
				// 댓글 삭제(반영) 버튼 클릭시
				$("#btnReplyRemoveSubmit").click(function(){
					const rno = $("#replyModal").data("rno");
					replyService.remove(rno, function(data){
						$("#replyModal").modal("hide");
						list();
					});
				});
				
				// 최소한 모달이 rno 값을 알고 있어야 함.
				// 댓글 수정(반영) 버튼 클릭시
				$("#btnReplyModifySubmit").click(function(){
					if($("#replyWriter").val() != "${member.id}") {
                        alert("본인의 댓글만 수정 가능합니다.");
                        return;
                    }
					const content = $("#replyContent").val();
					console.log(content);
					const rno = $("#replyModal").data("rno")
					console.log(rno)
					const reply = {rno, content};
					replyService.modify(reply, function(data){
						$("#replyModal").modal("hide");
						location.reload();
					});
				});
			})
		</script>
		<hr>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="replyModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h4 class="modal-title"> Write Reply </h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <div class="modal-body">
	      	<label for="replyContent" class="mb-4">content</label>
	      	<input type="text" class="form-control mb-3" id="replyContent">
	      	<label for="replyWriter" class="mb-4">writer</label>
	      	<input type="text" class="form-control mb-3" id="replyWriter" readonly value ="${member.id}">
	      </div>
	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning btn-outline-dark" id="btnReplySubmit">Post</button>
	        <button type="button" class="btn btn-warning btn-outline-dark" id="btnReplyModifySubmit">Modify</button>
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" id="btnRemoveSubmit">Remove</button>
	      </div>
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
	    </div>
	  </div>
	</div>
</body>
</html>