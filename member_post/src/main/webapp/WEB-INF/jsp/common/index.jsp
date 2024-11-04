<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>TJ ACADEMY UI LAYOUT</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="C:\Users\tj\Desktop\DaHnDellStudio\08\layout\images\favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.17/jquery.bxslider.min.js" integrity="sha512-LaBO0tZh1+6Ebk+EnHt/WsGM0UnmkCXfQ1rfhGmpa5MXUdslNuSSELBRcteHKz4k4ny+Op10Ax2fPoTNq+VcUg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        body {background-color: #eee;}
    </style>
</head>
<body>
    <div class="wrap">
        <header class="container-fluid">
            <div class="container clearfix p-2">
                <a href="index" class="float-start"><img src="images\biglogo.png" alt="LOGO" class="img-fluid" width="250"></a>
                <h1 class="text-center fw-bold p-3">TJ UI BOARD DEV LAYOUT</h1>
            </div>
        </header>
        <nav class="navbar bg-dark navbar-expand-sm">
            <ul class="navbar-nav container justify-content-start">
                <li class="mx-3 nav-item"><a class="nav-link text-white" href="index.html">Main Page</a></li>
                <li class="mx-3 nav-item"><a class="nav-link text-white" href="mypage.html">My Page</a></li>
                <li class="mx-3 nav-item"><a class="nav-link text-white" href="post.html?category=1">Notice-For-All</a></li>
                <li class="mx-3 nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Board</a>
                    <!-- a 태그가 없으면 focusable 상태가 안됨, 즉 tab 키를 이용해서 이동 불가 -->
                    <ul class="dropdown-menu">
                        <!-- Board 를 통해 클릭한 값을 쿼리스트링을 통해 구분짓는다. -->
                        <li class="dropdown-item"><a href="post.html?category=2">Free</a></li>
                        <li class="dropdown-item"><a href="post.html?category=3">Libraries</a></li>
                        <li class="dropdown-item"><a href="gallery.html">Gallery</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <main class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="p-3">
                        <h1>index</h1>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <div class="p-4 d-grid gap-2">
                        <!-- afterlogin -->
                        <div class="container mx-auto">
                            <p>welcome, <strong><a href="mypage.html" class="b-2 text-decoration-none">id</a></strong>!</p>
                            <div class="small btn-group btn-group-sm">
                                <a href="index.html" class="btn btn-outline-dark small fw-small"> <i> log - out </i> </a> 
                                <a href="mypage.html" class="btn btn-outline-dark small fw-small"> <i> my - page </i> </a> 
                            </div>
                        </div>
                        <!-- beforelogin -->
                        <a href="signin" class="btn btn-sm btn-primary p-3 small fw-bold"> <strong> log - in </strong> </a> 
                        <div class="small btn-group btn-group-sm">
                            <a href="signup" class="btn btn-outline-dark small fw-small"> <i> register new </i> </a> 
                            <a href="signup.html" class="btn btn-outline-dark small fw-small"> <i> query account </i> </a> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="bg-warning text-center p-4">
            <p><strong>All rights reserved &copy; copyright</strong></p>
            <address><i>Seoul, Guro district Digital road-306 DaryeungPostTower:2 2nd floor TJ Academy</i></address>
        </footer>
    </div>

</body>
</html>