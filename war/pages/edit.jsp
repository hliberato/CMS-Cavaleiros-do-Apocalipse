<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.Util" %>
<%@ page import="model.Post" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%String json = Util.listarTags();%>

<jsp:include page="header.jsp"/>
<title>Editar post</title>
<jsp:include page="header2.jsp"/>

<script type="text/javascript">
$(document).ready(
	function()
	{
		$('#redactor').redactor();
	}
);
</script>
<script>
  $(function() {
    var availableTags = <%out.println(json);%>;
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
 
    $( "#tags" )
      // don't navigate away from the field on tab when selecting an item
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        minLength: 0,
        source: function( request, response ) {
          // delegate back to autocomplete, but extract the last term
          response( $.ui.autocomplete.filter(
            availableTags, extractLast( request.term ) ) );
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
  });
</script>
	<div class="row clearfix">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<%@page import="javax.servlet.http.HttpSession"%>
					<% 	HttpSession sessionIndex = request.getSession();
						if (session.getAttribute("author")==null){
					%>
						<p>
							Você não está logado, faça <a href="../../admin/login">login aqui.</a>
						</p>
					<%}
					else{
					%>
						<h3 style="text-align:center;">Editar Post</h3>						

						<form action="../edit" method="post">
							<input type="hidden" id=key name="key" value="${post.key.name}"/>
							<fieldset>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Sessão</label>
									<div class="col-md-10">
							      		<select name="type" class="form-control input-md">
							      			<%Post post = (Post) request.getAttribute("post");%>
							      			<option></option>
											<option value="filmes"			<%if (post.getType().equals("filmes")) out.println("selected");%>>Filmes</option>
											<option value="seriesetv"		<%if (post.getType().equals("seriesetv")) out.println("selected");%>>Séries e TV</option>
											<option value="animesemangas"	<%if (post.getType().equals("animesemangas")) out.println("selected");%>>Animes e Mangás</option>											
											<option value="leituraehq"		<%if (post.getType().equals("leituraehq")) out.println("selected");%>>Leitura e HQs</option>
											<option value="games"			<%if (post.getType().equals("games")) out.println("selected");%>>Games</option>
											<option value="analises"		<%if (post.getType().equals("analises")) out.println("selected");%>>Análises</option>
											<option value="musica"			<%if (post.getType().equals("musica")) out.println("selected");%>>Música</option>
											<option value="tecnologia"		<%if (post.getType().equals("tecnologia")) out.println("selected");%>>Tecnologia</option>
											<option value="gastronomia"		<%if (post.getType().equals("gastronomia")) out.println("selected");%>>Gastronomia</option>
											<option value="humor"			<%if (post.getType().equals("humor")) out.println("selected");%>>Humor</option>										
										</select>
							    	</div>
								</div>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Título</label>
									<div class="col-md-10">
							      		<input class="form-control input-md" type="text" id="title" name="title" value="${post.title}">
							    	</div>
								</div>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Subtítulo</label>
									<div class="col-md-10">
							      		<input class="form-control input-md" type="text" id="subtitle" name="subtitle" value="${post.subtitle}">
							    	</div>
								</div>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Imagem</label>
									<div class="col-md-10">
							      		<input class="form-control input-md" type="text" id="image" name="image" value="${post.image}">
							    	</div>
								</div>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Destaque</label>
									<div class="col-md-10">
							      		<input class="form-control input-md" style="width: 30px;" type="checkbox" id="evidence" value="yes" name="evidence" <%if (post.getEvidence() != null && post.getEvidence().equals("yes")) out.println("checked");%>>
							    	</div>
								</div>
								<div class="form-group">
									<label for="textArea" class="col-md-2 control-label">Corpo</label>
									<div class="col-md-10">
										<textarea id="redactor" name="body">${post.body.value}
										</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="inputLarge" class="col-md-2 control-label">Tags</label>
									<div class="col-md-10">
							      		<input class="form-control input-md" id="tags" type="text" name="tags" value="${tag}">
							    	</div>
								</div>
								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button type="submit" class="btn btn-primary">Salvar</button>
										<a href="../panel" class="btn btn-default">Cancelar</a>
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