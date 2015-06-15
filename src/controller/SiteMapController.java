package controller;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PMF;

@Controller
@RequestMapping("/sitemap")
public class SiteMapController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public void sitemap(HttpServletRequest request, ModelMap model, HttpServletResponse response) throws IOException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Post.class);
		List<Post> posts =  (List<Post>) q.execute();
		
		response.setContentType("text/xml");
		response.getWriter().println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		response.getWriter().println("\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");
		for (Post post : posts) {
			response.getWriter().println("\n	<url>");
			response.getWriter().println("\n		<loc>");
			response.getWriter().println("http://www.cavaleirosdoapocalipse.com.br/post/"+post.getKey().getName());
			response.getWriter().println("\n		</loc>");
			response.getWriter().println("\n	</url>");
		}			
		response.getWriter().println("\n</urlset>");	
	}
}