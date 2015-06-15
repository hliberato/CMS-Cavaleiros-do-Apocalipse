<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="namekey" required="true"%>
<%@attribute name="title" required="true"%>
<%@attribute name="sectionurl" required="true"%>
<%@attribute name="section" required="true"%>
<%@attribute name="author" required="true"%>
<%@attribute name="authorKey" required="true"%>
<%@attribute name="date" required="true"%>
<%@attribute name="body" required="true"%>
<%@attribute name="image" required="true"%>
<%@attribute name="subtitle" required="true"%>
<%@attribute name="tags" required="true"%>

<div class="panel panel-default">
	<div class="panel-body">
		<h3>
			<a href="http://cavaleirosdoapocalipse.com.br/post/${namekey}">${title}</a>
		</h3>
		<h6>
			<a href="http://cavaleirosdoapocalipse.com.br/section/${sectionurl}">${section}</a> 
			| Por <a href="http://cavaleirosdoapocalipse.com.br/author/${authorKey}">${author}</a> | Em ${date}
		</h6>
		<br>
		<p>
			${subtitle}
		<p>
		<br>
			<img class="img-responsive" style="width:100%!important" alt="${title}" src="${image}">
		<br>
			${body}
		<br>
		<div class="row">
			<div class="col-md-12">
			Tags: 	<i><strong>
						<c:forEach var="tag" items="${tags}" varStatus="status">
							<c:set var="tagformat1" value="${fn:replace(tag,'[','')}" />
							<c:set var="tagformat2" value="${fn:replace(tagformat1,']','')}" />
							<a href="http://cavaleirosdoapocalipse.com.br/tag/${tagformat2}">
								${tagformat2}
							</a>
							<c:if test="${!status.last}">,</c:if>
						</c:forEach>
					</strong></i>			
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<div	class="fb-like" 
						data-href="http://cavaleirosdoapocalipse.com.br/post/${namekey}" 
						data-layout="button_count" 
						data-action="like" 
						data-show-faces="true" 
						data-share="true"></div>
			</div>
			<div class="col-md-3">
				<a	href="https://twitter.com/share" 
					class="twitter-share-button" 
					data-url="http://cavaleirosdoapocalipse.com.br/post/${namekey}"
					data-via="BlogCdA"
					data-text="${title}"
					data-hashtags="	<c:forEach var="tag" items="${tags}" varStatus="status">
										<c:set var="tagformat1" value="${fn:replace(tag,'[','')}" />
										<c:set var="tagformat2" value="${fn:replace(tagformat1,']','')}" />
										<c:set var="tagformat3" value="${fn:replace(tagformat2,' ','')}" />
										${tagformat3}
										<c:if test="${!status.last}">
											,
										</c:if>
									</c:forEach>"
					>Tweet</a>
			</div>
			<div class="col-md-3 col-md-offset-3">
				<a href="http://cavaleirosdoapocalipse.com.br/post/${namekey}#disqus_thread">COMENTÁRIOS</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES * * */
    var disqus_shortname = 'cavaleirosdoapocalipse';
    
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
</script>