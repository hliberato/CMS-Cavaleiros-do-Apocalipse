package controller;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Post;
import model.Tag;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PMF;
import util.Util;

@Controller
@RequestMapping("/tag")
public class TagController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{tag}", method = RequestMethod.GET)
	public String tag(@PathVariable String tag, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			tag=tag.toUpperCase();
			Query q = pm.newQuery(Post.class);
			q.setFilter("tags == '"+ tag + "'");
			q.setOrdering("date desc");
			q.setRange(0, 6);
			List<Post> listPosts = (List<Post>) q.execute();
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("tagCounter", countPages(tag));
			model.addAttribute("tagKey", tag);
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",null);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "tagposts";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{tag}/page/{n}", method = RequestMethod.GET)
	public String page(@PathVariable int n,@PathVariable String tag, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
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
			q.setFilter("tags == '"+ tag + "'");
			q.setOrdering("date desc");
			q.setRange(min, max);
			List<Post> listPosts = (List<Post>) q.execute();
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("tagCounter", countPages(tag));
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("tagKey", tag);
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",null);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "tagposts";
		}catch (Exception e){
			return "404";
		}
		finally {
		    pm.close();
		}
	 }
	
	private String countPages(String tag) {		 
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		 Tag t = pm.getObjectById(Tag.class, tag);		 
		 int num = t.getCounter();
		 if (num%6 == 0){
			 num = (num / 6);
		 }else{
			 num = (num / 6)+1;
		 }		 
		 return num+"";
	}
}