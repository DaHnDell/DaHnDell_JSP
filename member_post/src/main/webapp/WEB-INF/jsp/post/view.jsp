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
				
				<ul class="list-group attach-result">
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
			replyService.list(pno, function(data) {
				console.log(data);
				let str="";
				for(let i in data){
					str += makeLi(data[i]);
				}
				$(".replies").append(str);
			});
			replyService.write({content:'abcd'});

			function makeLi(reply) {
                return `<li class="list-group-item" data-rno="\${reply.rno}">
                            <input type="checkbox" class="form-check-input float-sm-end">
                            <a href="#" class="text-decoration-none text-success">
                                <p class="text-black fw-bold mt-3 text-truncate">\${reply.content}</p>
                                <div class="clearfix text-secondary">
                                    <span class="float-start">\${reply.writer}</span>
                                    <span class="float-end small small small">\${moment(reply.regDate, 'yyyy/MM/DD-HH:mm:ss').fromNow()}</span>
                                    <a class=" float-end small small small text-danger mx-2">DEL</a>
                                </div>
                            </a>
                        </li>`;
            }
			
			$("#btnWriteReply").click(function(){
				$("#replyModal").modal("show");
			})
			
			$(function(){
				$("#btnReplySubmit").click(function(){
					const writer = $("#replyWriter").val();
					const content = $("#replyContent").val();;
					const reply = {pno, writer, content};
					replyService.write(reply, function(data){
						$("#replyModal").modal("hide");
						$("#replyWriter").val("");
						$("#replyContent").val("");
						
						location.reload();
					});
				});
				// $("#replyModal").modal("show")
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
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>