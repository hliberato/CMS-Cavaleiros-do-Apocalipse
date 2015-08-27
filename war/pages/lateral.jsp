<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="panel panel-default">

<div class="row">
	<div class="col-md-12">
		<a href="http://cavaleirosdoapocalipse.com.br/post/${postResumao.key.name}">
			<img class="img-rounded img-responsive" src="${postResumao.image}">
		</a>
	</div>
</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
		<!-- Lateral 1 -->
		<ins class="adsbygoogle"
		     style="display:block"
		     data-ad-client="ca-pub-4620351167026231"
		     data-ad-slot="3436766509"
		     data-ad-format="auto"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="row">
		<div class="col-md-12 menu">
			<h3 style="text-align: center">Facebook</h3>
		</div>
		<div class="col-md-12">
			<br>
			<div 	class="fb-page" 
				data-href="https://www.facebook.com/blogcavaleirosdoapocalipse" 
				data-width="360" 
				data-hide-cover="false" 
				data-show-facepile="true" 
				data-show-posts="false">
		</div>
		</div>
	</div>	
</div>
<div class="panel panel-default">
	<div class="row">
		<div class="col-md-12 menu">
			<h3 style="text-align: center">Twitter</h3>
		</div>
		<div class="col-md-12">
			<br>
			<a 	class="twitter-timeline" 
				href="https://twitter.com/BlogCdA" 
				data-widget-id="584937610650484736">
					Tweets by @BlogCdA
			</a>
		</div>
	</div>	
</div>
<div class="panel panel-default">	
	<div class="row">
		<div class="col-md-12 menu">
			<h3 style="text-align: center">Tags</h3>
		</div>
		<div class="panel-body">
			<div class="col-md-12">
				<br>
				<div class="list-group">
					<c:forEach var="t" items="${topTags}">					
						<a href="http://cavaleirosdoapocalipse.com.br/tag/${t.tag}" class="list-group-item">
							${t.tag}
						</a>
					</c:forEach>
				</div>
			</div>
		</div>	
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Laterai 2 -->
				<ins class="adsbygoogle"
				     style="display:block"
				     data-ad-client="ca-pub-4620351167026231"
				     data-ad-slot="4773898908"
				     data-ad-format="auto"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
		</div>
	</div>
</div>

<div class="panel panel-default">	
	<div class="row">
		<div class="col-md-12 menu">
			<h3 style="text-align: center">Busque no site</h3>
		</div>
		<div class="panel-body">
			<br>
			<gcse:search></gcse:search>	
		</div>	
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<center>
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- lateral grande -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:300px;height:600px"
			     data-ad-client="ca-pub-4620351167026231"
			     data-ad-slot="8631702105"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
			</center>
		</div>
	</div>
</div>
<script>
  (function() {
    var cx = '005223875291987216678:9pwb8ta3n9i';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>