<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp" />
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp" />
		<main class="container">
			<div class="row">
				<jsp:include page="pagedes.jsp" />
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
							<div class="small btn-group btn-group-sm">
								<a href="index" class="btn btn-outline-dark small fw-small">
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
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>