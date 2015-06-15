<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>
<title>Cavaleiros do Apocalipse</title>
<jsp:include page="header2.jsp"/>

<div class="row">
	<div class="col-md-8">
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
    totalPages: ${tagCounter},
    visiblePages: 5,
    first: '<<',
    prev: '<',
    next: '>',
    last: '>>',
    href: '/tag/${tagKey}/page/{{number}}',
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
    }
});
</script>
<jsp:include page="footer.jsp"/>