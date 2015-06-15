<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>
<title>${p.title} | Cavaleiros do Apocalipse</title>

<meta property="og:url" content="http://cavaleirosdoapocalipse.com.br/post/${p.key.name}"> 
<meta property="og:title" content="${p.title}">
<meta property="og:site_name" content="Cavaleiros do Apocalipse">
<meta property="og:description" content="${p.subtitle}"> 
<meta property="og:image" content="${p.image}">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="800">
<meta property="og:image:height" content="418"> 
<meta property="og:type" content="article">
<meta property="article:author" content="${author.facebook}">
<meta property="article:section" content="${p.typeValue}">
<meta property="article:tag" content="<c:forEach var="tag" items="${p.tags}">${tag}, </c:forEach>">
<meta property="article:publisher" content="https://www.facebook.com/blogcavaleirosdoapocalipse"/>

<jsp:include page="header2.jsp"/>

<div class="row">
	<div class="col-md-8">
		<div class="row">
			<div class="col-md-12">
				<customTag:post	namekey="${p.key.name}"
								title="${fn:toUpperCase(p.title)}"
								sectionurl="${p.type}"
								section="${p.typeValue}"
								author="${p.author.name}"
								authorKey = "${p.author.key.name}"
								date="${p.formatedDate}"
								body="${p.body.value}"
								image="${p.image}"
								subtitle="${p.subtitle}"
								tags="${p.tags}">
				</customTag:post>			
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<customTag:profile	name="${author.name}"
							bio="${author.bio}"
							facebook="${author.facebook}"
							twitter="${author.twitter}"
							instagram="${author.instagram}"
							steam="${author.steam}"
							profileImageURL="${author.profileImageURL}"
							>
				</customTag:profile>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div id="disqus_thread"></div>
					</div>
				</div>
			</div>
		</div>		
	</div>
	<div class="col-md-4 column">
		<jsp:include page="lateral.jsp"/>
	</div>
</div>

<div id="fb-root"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES * * */
    var disqus_shortname = 'cavaleirosdoapocalipse';
    
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-62373383-1', 'auto');
  ga('send', 'pageview');

</script>
<jsp:include page="footer.jsp"/>