<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"/>
<title>Login</title>
<jsp:include page="header2.jsp"/>

	<div class="row clearfix">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3 style="text-align:center;">Login</h3>
					
					<form method="post" action="login">
						<fieldset>
							<div class="form-group">
						    	<label for="inputLarge" class="col-md-2 control-label">Login</label>
						    	<div class="col-md-10">
						      	<input class="form-control input-lg" type="text" name="login" id="login">
						    	</div>
						    </div>
						    <div class="form-group">
						    	<label for="inputLarge" class="col-md-2 control-label">Password</label>
						    	<div class="col-md-10">
						      	<input class="form-control input-lg" type="password" name="password" id="password">
						    	</div>
						    </div>
							<div class="form-group">
								<div class="col-md-10 col-md-offset-2">
									<button type="submit" class="btn btn-primary">Login</button>
									<a href="panel" class="btn btn-default">Cancelar</a>
								</div>
							</div>
	        			</fieldset>		
					</form>
					${mensagem}
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>