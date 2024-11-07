<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp" />
	<style type="text/css">
		.layer-popup {width: 420px; position: absolute; top:150px; left:calc(50% - 210px); display: none;}
	    .layer-popup img {display: block;}
	    .layer-popup p { background-color: darkgray; color: aliceblue; margin: 0; padding:  8px; font-size: 13px;}
	    .layer-popup p input { vertical-align: middle;}
	    .layer-popup p a { color: aliceblue; text-decoration: none; float: right;}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<jsp:include page="../common/header.jsp" />
<body>
    <main class="container">
        <h1>list</h1>
        ${posts}
    </main>
	<jsp:include page="../common/footer.jsp" />
</body>

<%-- 	
	<c:forEach begin="2" end="9" var = "i" step = "2">
		${i} 단
		<c:forEach begin="1" end="9" var = "j" step = "3">
			<h1>${i} * ${j} = ${i*j}</h1>
		</c:forEach>
	</c:forEach> 
--%>

<%-- 	<c:forEach items="${posts}" var = "post" varStatus="stat" begin = "3" end = "10" step = "2">
		<p>${stat} // ${post.title}</p>
		<h3>${stat.index} // ${stat.count} // ${post.title}</h3>
		<p>${posts[stat.index] == post}</p>
	</c:forEach> --%>