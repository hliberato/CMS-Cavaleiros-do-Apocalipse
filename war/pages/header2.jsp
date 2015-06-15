	<link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/cda.css" rel="stylesheet">
    <link href="/static/css/redactor.css" rel="stylesheet"/>
    <link href="/static/css/hover.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>   
<body>
<div class="container">
	<!-- HEADER FOR MEDIUM AND LARGE DEVICES > 992PX -->
	<div class="hidden-xs hidden-sm">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">
						<a class="hvr-gallop" href="http://cavaleirosdoapocalipse.com.br/author/morte">
							<img class="morte" alt="Cavaleiros do Apocalipse" src="/static/img/morte.png">
						</a>
					</div>
					<div class="col-md-3">
						<a class="hvr-gallop" href="http://cavaleirosdoapocalipse.com.br/author/fome">
							<img class="fome" alt="Cavaleiros do Apocalipse" src="/static/img/fome.png">
							</a>
					</div>
					<div class="col-md-3">
						<a class="hvr-gallop" href="http://cavaleirosdoapocalipse.com.br/author/guerra">
							<img class="guerra" alt="Cavaleiros do Apocalipse" src="/static/img/guerra.png">
						</a>
					</div>
					<div class="col-md-3">
						<a class="hvr-gallop" href="http://cavaleirosdoapocalipse.com.br/author/peste">
							<img class="peste" alt="Cavaleiros do Apocalipse" src="/static/img/peste.png">
						</a>
					</div>
				</div>
				<div class="row menu" style="bottom:15px;position:relative;z-index: -1;">
					<div class="row">
						<div class="col-md-12">
							<img class="img-responsive logo" alt="Cavaleiros do Apocalipse" src="/static/img/logo.png">
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<!-- HEADER FOR SMALL DEVICES < 992PX -->
	<div class="hidden-md hidden-lg">
		<div class="row">
			<div class="col-md-12">
				<a href="http://cavaleirosdoapocalipse.com.br/">
					<img class="img-responsive logo" alt="Cavaleiros do Apocalipse" src="/static/img/header-small-device.png">
				</a>
			</div>
		</div>
		<br>
	</div>
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <% 	HttpSession sessionIndex = request.getSession();
			      		String section = "";
			      		if (session.getAttribute("section")!=null){
			      			section = (String)session.getAttribute("section");
			      		}
			      %>
			      <a class="navbar-brand" href="http://cavaleirosdoapocalipse.com.br/">
			      	Home
			      </a>
			    </div>
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li <%if (section.equals("filmes")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/filmes">Filmes</a> </li>
			        <li <%if (section.equals("seriesetv")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/seriesetv">Séries e TV</a></li>
			        <li <%if (section.equals("animesemangas")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/animesemangas">Animes e Mangás</a></li>
			        <li <%if (section.equals("leituraehq")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/leituraehq">Leitura e HQs</a></li>
			        <li <%if (section.equals("games")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/games">Games</a></li>
			        <li <%if (section.equals("analises")) out.println(" class=\"active\" ");%>>
			        	<a href="http://cavaleirosdoapocalipse.com.br/section/analises">Análises</a></li>
			        <li class="dropdown <%if (	section.equals("musica")||
			        							section.equals("tecnologia")||
			        							section.equals("gastronomia")||
			        							section.equals("humor"))out.println("active");%>">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Diversos<span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				         	<li>
				         		<a href="http://cavaleirosdoapocalipse.com.br/section/musica">Música</a></li>
				            <li>
				            	<a href="http://cavaleirosdoapocalipse.com.br/section/tecnologia">Tecnologia</a></li>
				            <li>
				            	<a href="http://cavaleirosdoapocalipse.com.br/section/gastronomia">Gastronomia</a></li>
				            <li>
				            	<a href="http://cavaleirosdoapocalipse.com.br/section/humor">Humor</a></li>
				          </ul>
			       	 	</li>
			      </ul>
			        <ul class="nav navbar-nav navbar-right">
			        	<li <%if (section.equals("sobre")) out.println(" class=\"active\" ");%>>
			        		<a href="http://cavaleirosdoapocalipse.com.br/sobre">Sobre os cavaleiros</a></li>
	     			</ul>
			    </div>
			</nav>
		</div>
	</div>
<div id="fb-root"></div>