package controller;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Counter;
import model.Post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PMF;
import util.Util;

@Controller
@RequestMapping("/section")
public class SectionController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{section}", method = RequestMethod.GET)
	public String section(@PathVariable String section, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{ 
			Query q = pm.newQuery(Post.class);
			q.setOrdering("date desc");
			q.setRange(0, 6);
			q.setFilter("type == '"+ section + "'");
			List<Post> listPosts = (List<Post>) q.execute();
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("sectionCounter", countPages(section));
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("sectionKey", section);			
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",section);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "sectionposts";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/{section}/page/{n}", method = RequestMethod.GET)
	public String page(@PathVariable int n,@PathVariable String section, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
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
			q.setFilter("type == '"+ section + "'");
			q.setOrdering("date desc");
			q.setRange(min, max);
			List<Post> listPosts = (List<Post>) q.execute();
			model.addAttribute("listPosts", listPosts);
			model.addAttribute("sectionCounter", countPages(section));
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("sectionKey", section);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",section);
			return "sectionposts";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	 }
	
	 private String countPages(String section) {		 
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		 Counter c = pm.getObjectById(Counter.class, section);		 
		 int num = c.getValue();
		 if (num%6 == 0){
			 num = (num / 6);
		 }else{
			 num = (num / 6)+1;
		 }		 
		 return num+"";
	}
}