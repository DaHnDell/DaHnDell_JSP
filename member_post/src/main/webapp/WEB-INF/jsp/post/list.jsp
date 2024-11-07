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
			<h2 class="my-4 fw-bold">POSTS</h2>
            <table class="table table-hover text-center border border-dark">
                <thead>
                <tr>
                    <th style="width: 10%;">postNo</th>
                    <th>title</th>
                    <th style="width: 15%;">writer</th>
                    <th style="width: 15%;">date</th>
                    <th style="width: 10%;">view</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${posts}" var="p">
	                <tr>
	                    <td>${p}</td>
	                    <td class="text-truncate text-start"><a href="view?pno${p.pno}" class="text-decoration-none">${p.title}</a></td>
	                    <td>${p.writer}</td>
	                    <td>${p.regDate}</td>
	                    <td>${p.viewCnt}</td>
	                </tr>
                </c:forEach>
                </tbody>
			</table>
                <ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
		</main>
		<hr>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>