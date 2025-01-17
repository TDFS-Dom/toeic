<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>


<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/home.js"></script>


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<!-- Search -->

	<div class="container">

		<div class="row">

			<br>
			<div class="span12">
				<div class="navbar  pull-right">
					<div id="size">
						<form name="myform">

							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End search -->

	<div class="container" id="resultsearch">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<!--Carousel
  ==================================================-->
		<!-- slide 1 là để cứng. 2 slide còn lại dùng for each. load từ database lên -->
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">

				<div class="active item">
					<div class="container">
						<div class="row">

							<div class="span6">
								<div class="carousel-caption">
									<h1>Đào tạo chất lượng</h1>
									<p class="lead">Chúng tôi cung cấp cho các bạn những kiến
										thức tốt nhất.</p>
									<c:if test="${pageContext.request.userPrincipal.name == null}">
										<a class="btn btn-large btn-primary openModalFunction" href="#"
											 id="modal1">Tham gia</a>
									</c:if>
									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<a class="btn btn-large btn-primary openModalFunction" href="#"
											 id="modal1">Xem ngay</a>
									</c:if>
								</div>
							</div>

							<div class="span6">
								<img
									src="${pageContext.request.contextPath}/resources/file/images/slide/aaa.jpg"
									alt="img not found aab" />
							</div>
						</div>
					</div>
				</div>

				<c:forEach items="${listslidebanner}" var="list">
					<div class="item">
						<div class="container">
							<div class="row">

								<div class="span6">
									<div class="carousel-caption">
										<h1>${list.getSlidename()}</h1>
										<p class="lead">${list.getSlidecontent()}</p>

										<c:if test="${pageContext.request.userPrincipal.name == null}">
											
											<c:if test="${list.getSlideimage() == 'slide2'}">
													<a class="btn btn-large btn-primary openModalFunction" id="modal2">Tham gia</a>
											</c:if>
											<c:if test="${list.getSlideimage() == 'slide3'}">
													<a class="btn btn-large btn-primary doExam ">Tham gia</a>
											</c:if>
											
										</c:if>
										<c:if test="${pageContext.request.userPrincipal.name != null}">

											<c:choose>
												<c:when test="${list.getSlideimage() == 'slide2'}">
													<a class="btn btn-large btn-primary openModalFunction"  id="modal2">Xem ngay</a>
												</c:when>

												<c:otherwise>
													<a class="btn btn-large btn-primary  doExam">Xem ngay</a>
												</c:otherwise>
											</c:choose>

										</c:if>
									</div>

								</div>

								<div class="span6">
									<img
										src="${pageContext.request.contextPath}/resources/file/images/slide/${list.getSlideimage()}.jpg">
								</div>

							</div>
						</div>
					</div>


				</c:forEach>

			</div>
			<!-- Carousel nav -->
			<a class="carousel-control left " href="#myCarousel"
				data-slide="prev"><i class="icon-chevron-left"></i></a> <a
				class="carousel-control right" href="#myCarousel" data-slide="next"><i
				class="icon-chevron-right"></i></a>
			<!-- /.Carousel nav -->

		</div>
		<!-- /Carousel -->
	</div>


	<!-- /.Row View -->



	<!--Footer
==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->


	<!-- Start Modal -->

	<div class="modal fade" id="openModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">DANH SÁCH LOẠT BÀI HƯỚNG DẪN</h4>
				</div>

				<div class="modal-body">

					<div class="media">
						<a class="pull-left"><img src="" id="image1" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name1" name="name1"></a>
							</h3>
						</div>
					</div>

					<div class="media">
						<a class="pull-left"><img src="" id="image2" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name2" name="name2"></a>
							</h3>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Thoát</button>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal -->

</body>
</html>