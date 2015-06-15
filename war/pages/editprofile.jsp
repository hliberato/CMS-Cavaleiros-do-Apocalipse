<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="javax.servlet.http.HttpSession"%>

<jsp:include page="header.jsp"/>
<title>Editar perfil</title>
<jsp:include page="header2.jsp"/>

<div class="row clearfix">
	<div class="col-md-12">	
		<div class="panel panel-default">
			<div class="panel-body">	
				<% 	HttpSession sessionIndex = request.getSession();
				if (session.getAttribute("author")==null){
				%>
				<div class="well well-md">
				  Voc� n�o est� logado, <a href="../../admin/login">fa�a login aqui.</a>
				</div>		
				<%}
				else{
				%>	
				<h3 style="text-align:center;">Editar perfil</h3>
				
				
				<form action="editprofile" method="post">
					<fieldset>
						<div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Nome</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="name" name="name" value="${sessionScope.author.name}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Email</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="email" name="email" value="${sessionScope.author.email}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Facebook</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="facebook" name="facebook" value="${sessionScope.author.facebook}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Twitter</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="twitter" name="twitter" value="${sessionScope.author.twitter}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Steam</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="steam" name="steam" value="${sessionScope.author.steam}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Instagram</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="instagram" name="instagram" value="${sessionScope.author.instagram}">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputLarge" class="col-md-2 control-label">Imagem de perfil</label>
					    	<div class="col-md-10">
					      	<input class="form-control input-md" type="text" id="profileImageURL" name="profileImageURL" value="${sessionScope.author.profileImageURL}">
					    	</div>
					    </div>
						
						<div class="form-group">
							<label for="textArea" class="col-md-2 control-label">Bio</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="3" id="bio" name="bio">${sessionScope.author.bio}</textarea>
										<span class="help-block">Texto que aparecer� na assinatura.</span>
								</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Salvar</button>
								<a href="panel" class="btn btn-default">Cancelar</a>
							</div>
						</div>
        			</fieldset>		
				</form>
				<%}
				%>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"/>