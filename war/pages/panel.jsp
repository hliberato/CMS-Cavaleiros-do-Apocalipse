<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="javax.servlet.http.HttpSession"%>

<jsp:include page="header.jsp"/>
<title>Painel de controle</title>
<jsp:include page="header2.jsp"/>

<div class="row clearfix">
	<div class="col-md-12">	
		<div class="panel panel-default">
		  <div class="panel-body">
	
	<% 	HttpSession sessionIndex = request.getSession();
		if (session.getAttribute("author")==null){
	%>
		<p>
			Você não está logado, <a href="../../admin/login">faça login aqui.</a>
		</p>	
	<%}
	else{
	%>	
		<h3 style="text-align:center;">Administração</h3>
		<br>
		<div class="row">
			<div class="col-md-3">
				<h5 style="text-align:center;">Bem vindo <strong>${sessionScope.author.login}!</strong></h5>
				<div class="list-group">
				  <a href="../../admin/editprofile" class="list-group-item">
				    <h6 class="list-group-item-heading">Editar perfil</h6>
				  </a>
				  <a href="../../admin/add" class="list-group-item">
				    <h6 class="list-group-item-heading">Adicionar post</h6>
				  </a>
				  <a href="../../admin/logout" class="list-group-item">
				    <h6 class="list-group-item-heading">Logout</h6>
				  </a>
				</div>
			</div>
			<div class="col-md-9">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th>Destaque</th>
								<th>Data</th>
								<th>Titulo</th>
								<th>Tags</th>
								<th>Sessão</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${posts}">
								<tr class="active">
									<td>${p.evidence}</td>
									<td>${p.date}</td>
									<td>${p.title}</td>
									<td>${p.tags}</td>
									<td>${p.type}</td>
									<td><a href="../../admin/edit/${p.key.name}">Editar</a></td>
									<td><a href="../../admin/delete/${p.key.name}">Excluir</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<center><ul id="pagination-demo" class="pagination-lg"></ul></center>
			</div>
		</div>
	<%}
	%>	
		</div>
	</div>
</div>
</div>
<script>
$('#pagination-demo').twbsPagination({
	startPage: 1,
    totalPages: ${postCounter},
    visiblePages: 5,
    first: '<<',
    prev: '<',
    next: '>',
    last: '>>',
    href: '/admin/panel/{{number}}',
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
    }
});
</script>
<jsp:include page="footer.jsp"/>