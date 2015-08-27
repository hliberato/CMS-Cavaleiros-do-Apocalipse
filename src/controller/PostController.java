package controller;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PMF;
import util.Util;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@RequestMapping(value = "/{key}", method = RequestMethod.GET)
	public String post(@PathVariable String key, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Post p = pm.getObjectById(Post.class, key);
			model.addAttribute("p",p);
			model.addAttribute("topTags", Util.getTopTags());
			model.addAttribute("author", p.getAuthor());
			//CONTROLE DO ACTIVE EM NAVBAR
			HttpSession session = request.getSession();
			session.setAttribute("section",null);
			//POST RESUMÃO
			model.addAttribute("postResumao",Util.getResumao());
			return "post";
		}catch (Exception e){
			return "404";
		}
		finally {
            pm.close();
        }
	}
}