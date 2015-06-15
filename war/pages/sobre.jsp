<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>
<title>Sobre os Cavaleiros | Cavaleiros do Apocalipse</title>
<jsp:include page="header2.jsp"/>

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-body">
              	<blockquote>
					<h3>Sobre os Cavaleiros</h3>
				</blockquote>
				<p style="text-align:justify">
					A idéia de criar um site de notícias partiu do principio onde o programador Henrique 
					queria praticar fazer páginas de web para que o escritor e ilustrador Lucas pudesse 
					redigir todas as suas críticas sobre filmes. A união com Maurício, um grande conhecedor 
					de games e séries e com Alberto, um brilhante entendedor sobre toda a cultura nerd em 
					geral acabou criando a fantástica idéia de montar um site focado para todas as noticias 
					mais interessantes que existem no dia a dia: <strong>Games, Filmes, Séries, Músicas, HQs, Animes, 
					Mangás, Livros,</strong> tudo lançado em uma panela elétrica para que possamos preparar um ótimo 
					prato recheado de improbabilidades. Foi assim que surgiu o site <strike>4 tartarugas do esgoto, 
					4 estações do ano, 4 estrelas do cruzeiro do 
					sul, 4 personagens do Metal Slug</strike>, <strong>4 Cavaleiros do Apocalipse!</strong>
				</p>				
				<img class="img-responsive" src="/static/img/LOGO_CAVALEIROS.png">
			</div>
		</div>
	</div>
		
	<div class="col-md-4 column">
		<jsp:include page="lateral.jsp"/>
	</div>
</div>
<jsp:include page="footer.jsp"/>