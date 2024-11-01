<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>TJ ACADEMY UI LAYOUT</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="images\favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.17/jquery.bxslider.min.js" integrity="sha512-LaBO0tZh1+6Ebk+EnHt/WsGM0UnmkCXfQ1rfhGmpa5MXUdslNuSSELBRcteHKz4k4ny+Op10Ax2fPoTNq+VcUg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        body {background-color: gainsboro;}
    </style>
</head>
<body>
    <div class="wrap">
        <header class="container-fluid">
            <div class="container clearfix p-2">
                <a href="index.html" class="float-start"><img src="images\biglogo.png" alt="LOGO" class="img-fluid" width="250"></a>
                <h1 class="text-center fw-bold p-3">TJ UI BOARD DEV LAYOUT</h1>
            </div>
            <nav class="navbar bg-dark navbar-expand-sm">
                <ul class="navbar-nav container justify-content-start">
                    <li class="mx-3 nav-item"><a class="nav-link text-white" href="index.html">Main Page</a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-white" href="mypage.html">My Page</a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-white" href="post.html?category=1">Notice-For-All</a></li>
                    <li class="mx-3 nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Board</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item"><a href="post.html?category=2">Free</a></li>
                            <li class="dropdown-item"><a href="post.html?category=3">Libraries</a></li>
                            <li class="dropdown-item"><a href="gallery.html">Gallery</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        <main class="container">
            <hr>
            <h2 class="text-center fw-bold"> SIGN-UP </h2>
            <hr>
            <form class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4 col-xxl-3 mx-auto card p-3">
                <input type="text" class="form-control my-3" id="id" placeholder="Enter ID" name = id>
                <input type="password" class="form-control my-3" id="pw" placeholder="Enter PW" name = pw>
                <input type="text" class="form-control my-3" id="name" placeholder="Enter NAME" name = name>
                <input type="email" class="form-control my-3" id="email" placeholder="Enter EMAIL" name = email>
                <input type="text" class="form-control my-3" id="address" placeholder="Enter Detailed ADDRESS" name = address>
                <div class="input-group my-3">
                    <input type="text" class="form-control" placeholder="Enter ROAD_NAME">
                    <button class="btn btn-outline-dark" type="button" id="search">Search</button>
                </div>
                <input type="text" class="form-control my-3" id="roadaddress" placeholder="Select after search" name = roadAddress readonly>
                <ul class="list-group">
                </ul>
                <button class="btn btn-outline-dark"> REGISTER </button>
            </form>
            <hr>
        </main>
        <footer class="bg-warning text-center p-4">
            <p><strong>All rights reserved &copy; copyright</strong></p>
            <address><i>Seoul, Guro district Digital road-306 DaryeungPostTower:2 2nd floor TJ Academy</i></address>
        </footer>
    </div>
    <script>
        $("#search").click(function(){
            const keyword = $(this).prev().val();
            if(!keyword) alert("Input Right Address");
            const data = {
                keyword,
                confmKey : 'devU01TX0FVVEgyMDI0MTAyOTEyMTYxNjExNTIwMDE=',
                currentPage : 1,
                countPerPage : 5,
                resultType : 'json'
            };
            console.log(data, keyword);

            $.ajax({
                url :"https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do",
                type : 'get',
                data,
                dataType : 'jsonp',
                crossDomain : true,
                success : function(data) {
                    console.log(data);
                    function appendLi(){
                        let str = ``;
                        $(data.results.juso).each(function(){
                            str += `<li class="list-group-item"><a class="small text-truncate" href = "#">` 
                                    + this.jibunAddr 
                                    + "</a></li>";
                            $(".list-group").append(str);
                        })
                        $(".list-group").on("click", "a", function() {
                                $("#roadaddress").val($(this).text().trim());
                                $(this).closest("ul").empty();
                        });
                    }
                    appendLi();
                },
                error : function(xhr, msg) {
                    console.log(xhr);
                }
            })
        });
    </script>
</body>
</html>