<%@attribute name="name" required="true"%>
<%@attribute name="bio" required="true"%>
<%@attribute name="facebook" required="true"%>
<%@attribute name="twitter" required="true"%>
<%@attribute name="instagram" required="true"%>
<%@attribute name="steam" required="true"%>
<%@attribute name="profileImageURL" required="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<div class="hidden-xs hidden-sm">
			<div class="row author">
				<div class="col-md-12">
					<h4 style="margin-top: 4px; margin-bottom: 1px;">Sobre o autor</h4>
				</div>			
			</div>	
			<div class="row">
				<div class="col-md-3">
					<img class="img-rounded img-responsive" src="${profileImageURL}">
				</div>
				<div class="col-md-9">				
					<h3 style="margin-top:1px;">${name}</h3>
					<p>${bio}
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: right;">
					<c:if test="${not empty  facebook}">
						<a href="${facebook}"><i class="fa fa-facebook-official fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  twitter}">			
						<a href="${twitter}"><i class="fa fa-twitter-square fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  steam}">	
						<a href="${steam}"><i class="fa fa-steam-square fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  instagram}">	
						<a href="${instagram}"><i class="fa fa-instagram fa-2x"></i></a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="hidden-md hidden-lg">
			<div class="row author">
				<div class="col-md-12">
					<h4 style="margin-top: 4px; margin-bottom: 1px;">Sobre o autor</h4>
				</div>			
			</div>	
			<div class="row">
				<div class="col-md-3" style="text-align: center;">
					<img class="img-rounded" style="width: 120px;height: auto;" src="${profileImageURL}">
				</div>
				<div class="col-md-9" style="text-align: center;">				
					<h3 style="margin-top:1px;">${name}</h3>
					<p>${bio}
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: right;">
					<c:if test="${not empty  facebook}">
						<a href="${facebook}"><i class="fa fa-facebook-official fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  twitter}">			
						<a href="${twitter}"><i class="fa fa-twitter-square fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  steam}">	
						<a href="${steam}"><i class="fa fa-steam-square fa-2x"></i></a>
					</c:if>
					<c:if test="${not empty  instagram}">	
						<a href="${instagram}"><i class="fa fa-instagram fa-2x"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>