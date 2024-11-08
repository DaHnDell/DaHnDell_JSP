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
		<hr>
		<main class="container">
			<div class="clearfix my-4">
				<h2 class="fw-bold text-big"><i class="fa-solid fa-book-open"></i> POST VIEW</h2>
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

             <div class="text-center my-5">
             		<c:if test="${post.writer == member.id}">
             		<a href="modify?pno=${post.pno}" class="btn btn-outline-dark"> ALTER </a>
             		<a href="remove?pno=${post.pno}" class="btn btn-outline-danger border-dark" onclick="return confirm('Delete this post?')"> DELETE </a>
             		</c:if>
                    <a href="list" class="btn btn-outline-warning border-dark">RETURN</a>
             </div>
            </div>
		</main>
		<hr>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>