<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"/>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"/>
		<hr>
		<main class="container">
			<div class="clearfix my-4">
				<h2 class="fw-bold text-big"><i class="fa-solid fa-book text-primary"></i> POSTS</h2>
				<a href="write?${pageDto.criteria.qs2}" class="btn btn-outline-dark btn-warning float-end fw-bold">WRITE POST</a>
			</div>
            <table class="table table-hover text-center border round">
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
                	<c:if test="${p == null}"></c:if>
	                <tr>
	                    <td>${p.pno}</td>
	                    <td class="text-truncate text-start">
	                    	<a href="view?pno=${p.pno}&${pageDto.criteria.qs2}" class="text-decoration-none">${p.title}</a>
	                    	<c:if test = "${p.attachFlag}">
	                    		${p.attachFlag ? '<i class="fa-solid fa-paperclip text-primary"></i>' : '' }
	                    	</c:if> 
                    	</td>
	                    <td>${p.writer}</td>
	                    <td>${p.regDate}</td>
	                    <td>${p.viewCnt}</td>
	                </tr>
                </c:forEach>
                </tbody>
			</table>
			${pageDto}
                <ul class="pagination justify-content-center">
					<c:if test="${pageDto.dblPrev}">
						<li class="page-item"><a class="page-link link-outline-secondary link-warning" href="list?page=${pageDto.startPage- 1}&${pageDto.criteria.qs}"><i class="fa-solid fa-angles-left text-primary"></i></a></li>
					</c:if>					
					<c:if test="${pageDto.prev}">
						<li class="page-item"><a class="page-link link-outline-secondary link-warning" href="list?page=${pageDto.criteria.page-1}&${pageDto.criteria.qs}"><i class="fa-solid fa-angle-left text-primary"></i></a></li>
					</c:if>					
					<c:forEach begin ="${pageDto.startPage}" end="${pageDto.endPage}" var="page">
						<li class="page-item ${page == pageDto.criteria.page ? 'active' : ''}"><a class="page-link link-outline-secondary link-dark" href="list?page=${page}&${pageDto.criteria.qs}">${page}</a></li>
					</c:forEach>
					<c:if test="${pageDto.next}">
						<li class="page-item"><a class="page-link link-outline-secondary link-warning" href="list?page=${pageDto.criteria.page+1}&${pageDto.criteria.qs}"><i class="fa-solid fa-angle-right text-primary"></i></a></li>
					</c:if>
					<c:if test="${pageDto.dblNext}">	
						<li class="page-item"><a class="page-link link-outline-secondary link-warning" href="list?page=${pageDto.endPage+1}&${pageDto.criteria.qs}"><i class="fa-solid fa-angles-right text-primary"></i></a></li>
					</c:if>
				</ul>
		</main>
		<hr>
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>