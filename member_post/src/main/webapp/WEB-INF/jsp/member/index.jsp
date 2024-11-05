<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<main class="container">
			<div class="row">
				<div class="col-md-9">
				    <div class="p-3">
				        <h1>index</h1>
				    </div>
				</div>
				<div class="col-md-3 ">
					<div class="p-4 d-grid gap-2">
					<%
	                   	Object o = session.getAttribute("member");
                   		if(o == null){
                   	%>
						<a href="signin" class="btn btn-sm btn-primary p-3 small fw-bold">
							<strong> log - in </strong>
						</a>
						<div class="small btn-group btn-group-sm">
							<a href="signup" class="btn btn-outline-dark small fw-small">
								<i> register new </i>
							</a> <a href="signup.html"
								class="btn btn-outline-dark small fw-small"> <i> query
									account </i>
							</a>
						</div>
					<%
                   		}
                   		else {
                   			Member m = (Member) o;
					%>
						<div class="container mx-auto">
							<p>
								welcome, <strong><a href="mypage.html"
									class="b-2 text-decoration-none"><%=m.getName()%></a></strong>!
							</p>
							<div class="small btn-group btn-group-sm bg-color-primary">
								<a href="signout" class="btn btn-outline-dark small fw-small">
									<i> log - out </i>
								</a> <a href="mypage.html"
									class="btn btn-outline-dark small fw-small"> <i> my -
										page </i>
								</a>
							</div>

						</div>
					<%
						}
                   	%>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="../common/footer.jsp" />
	</div>
       <div class="layer-popup">
          <img src="https://image.yes24.com/momo/scmfiles/AdvertFiles/202410/2575682_241011091003.jpg" alt="팝업">
              <p class="clearfix">
                  <span> 오늘은 그만 보기 <input type="checkbox"></span>
                  <a href="#"> 닫기 </a>
              </p>
       </div>
	<script>
	if(!$.cookie("layer")){
		$(".layer-popup").show();
	}	
	
	
	// 레이어 팝업 내의 닫기 버튼 클릭시 이벤트
		$(".layer-popup a").click(function(){
			event.preventDefault();
			const checked = $(this).prev().find("input:checkbox").prop("checked");
			console.log(checked);
			if(checked){
				$.cookie('layer', 'yes', {expires:1});
			}
			$(".layer-popup").hide();
		})
	</script>
</body>
</html>