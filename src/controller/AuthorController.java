package controller;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Author;
import model.Post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PMF;
import util.Util;

@Controller
@RequestMapping("/author")
public class AuthorController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{author}", method = RequestMethod.GET)
	public String section(@PathVariable String author, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Author a = pm.getObjectById(Author.class, author);
			Query q = pm.newQuery(Post.class);
			q.setOrdering("date desc");
			q.setRange(0, 6);
			q.setFilter("author == authorParam");
			q.declareParameters("Author authorParam");
			List<Post> listPosts = (List<Post>) q.execute(a);
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("authorKey", a.getKey().getName());
			model.addAttribute("author", a);
			model.addAttribute("authorCounter", countPages(a.getCounter()));
			model.addAttribute("topTags", Util.getTopTags());
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",null);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "authorposts";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{author}/page/{n}", method = RequestMethod.GET)
	public String page(@PathVariable int n,@PathVariable String author, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Author a = pm.getObjectById(Author.class, author);
			long min;
			long max;
			if (n<2){
				min = 0;
				max = 6;
			}
			else{			
				long aux = n-1;
				min = aux*6;
				max = min+6;
			}
			Query q = pm.newQuery(Post.class);
			q.setOrdering("date desc");
			q.setRange(min, max);
			q.setFilter("author == authorParam");
			q.declareParameters("Author authorParam");
			List<Post> listPosts = (List<Post>) q.execute(a);
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("authorKey", a.getKey().getName());
			model.addAttribute("authorCounter", countPages(a.getCounter()));
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("author", a);
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",null);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "authorposts";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	 }

	private Object countPages(int num) {
		 if (num%6 == 0){
			 num = (num / 6);
		 }else{
			 num = (num / 6)+1;
		 }		 
		 return num+"";
	}
	
	@RequestMapping(value = "/{author}/*", method = RequestMethod.GET)
	public String erro404(@PathVariable String author, HttpServletRequest request, ModelMap model){
		return "404";
	}
	
}