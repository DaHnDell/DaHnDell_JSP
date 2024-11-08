<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="container-fluid">
       <div class="container clearfix p-2">
           <a href="../index" class="float-start"><img src="${pageContext.request.contextPath}/images/biglogo.png" alt="LOGO" class="img-fluid border-warning" width="250"></a>
           <h1 class="text-center fw-bold p-3">TJ UI BOARD DEV LAYOUT</h1>
       </div>
</header>
<div class="border border-warning">	
	<nav class="navbar bg-dark navbar-expand-sm">
	    <ul class="navbar-nav container justify-content-start">
	        <li class="mx-3 nav-item"><a class="nav-link text-warning" href="../index">Main Page</a></li>
	        <li class="mx-3 nav-item"><a class="nav-link text-warning" href="mypage.html">My Page</a></li>
	        <li class="mx-3 nav-item"><a class="nav-link text-warning" href="post.html?category=1">Notice-For-All</a></li>
	        <li class="mx-3 nav-item dropdown">
	            <a class="nav-link dropdown-toggle text-warning" href="#" role="button" data-bs-toggle="dropdown">Board</a>
	            <ul class="dropdown-menu">
	                <li class="dropdown-item"><a href="post/list">Free</a></li>
	                <li class="dropdown-item"><a href="post.html?category=3">Libraries</a></li>
	                <li class="dropdown-item"><a href="gallery.html">Gallery</a></li>
	            </ul>
	        </li>
	    </ul>
	</nav>
</div>