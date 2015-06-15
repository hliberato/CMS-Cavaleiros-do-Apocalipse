<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>
<title>Cavaleiros do Apocalipse</title>
<jsp:include page="header2.jsp"/>
<div class="row">
	<div class="col-md-8">
		<div class="hidden-xs hidden-sm hidden-md">
			<div class="panel panel-default">
				<center>
					<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
						<!-- header -->
						<ins class="adsbygoogle"
						     style="display:inline-block;width:728px;height:90px"
						     data-ad-client="ca-pub-4620351167026231"
						     data-ad-slot="4993578104"></ins>
						<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
						</script>
				</center>
			</div>		
		</div>
		<div class="hidden-xs hidden-sm">
			<div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
				  <li data-target="#carousel-example-generic1" data-slide-to="0" class="active"></li>
				  <li data-target="#carousel-example-generic1" data-slide-to="1"></li>
				  <li data-target="#carousel-example-generic1" data-slide-to="2"></li>
				  <li data-target="#carousel-example-generic1" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<c:forEach var="p" items="${listEvidencePosts}" varStatus="status">
						<div class="item <c:if test="${status.first}">active</c:if>">
				        	<a href="http://cavaleirosdoapocalipse.com.br/post/${p.key.name}">
								<img class="img-rounded" src="${p.image}" style="width:100%;">
							</a>					
				        </div>
			        </c:forEach>
				</div>
			</div>
			<br>
		</div>		
		<c:forEach var="p" items="${listPosts}">
			<customTag:posthome	namekey="${p.key.name}"
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
			</customTag:posthome>
		</c:forEach>
		 <center><ul id="pagination-demo" class="pagination-lg"></ul></center>
	</div>
	<div class="col-md-4 column">
		<jsp:include page="lateral.jsp"/>
	</div>
</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-62373383-1', 'auto');
  ga('send', 'pageview');

</script>
<script>
$('#pagination-demo').twbsPagination({
	startPage: 1,
    totalPages: ${postCounter},
    visiblePages: 5,
    first: '<<',
    prev: '<',
    next: '>',
    last: '>>',
    href: '/page/{{number}}',
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
    }
});
</script>
<script>
   $('.carousel').carousel({
       interval: 3000
   })
</script>
<jsp:include page="footer.jsp"/>