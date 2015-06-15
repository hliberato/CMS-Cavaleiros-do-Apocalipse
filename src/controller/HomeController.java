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
import util.TagUtil;

@Controller
@RequestMapping("/")
public class HomeController {

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public String home(HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Post.class);
		q.setOrdering("date desc");
		q.setRange(0, 6);
		List<Post> listPosts = (List<Post>) q.execute();
		model.addAttribute("listPosts", listPosts);
		model.addAttribute("postCounter", countPages());
		model.addAttribute("topTags", TagUtil.getTopTags());
		//CONTROLE DO ACTIVE EM NAVBAR
		HttpSession session = request.getSession();
		session.setAttribute("section",null);
		//NOTICIAS EM DESTAQUE
		model.addAttribute("listEvidencePosts", getListEvidencePosts());
		return "home";
	}
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/page/{n}", method = RequestMethod.GET)
	public String page(@PathVariable int n, HttpServletRequest request, ModelMap model){
		PersistenceManager pm = PMF.get().getPersistenceManager();
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
		List<Post> listPosts = (List<Post>) q.execute();
		model.addAttribute("listPosts", listPosts);
		model.addAttribute("postCounter", countPages());
		model.addAttribute("topTags", TagUtil.getTopTags());
		HttpSession session = request.getSession();
		session.setAttribute("section",null);
		session.setAttribute("listEvidencePosts", getListEvidencePosts());
		return "home";
	 }
	 
	 private String countPages() {		 
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		 Counter c = pm.getObjectById(Counter.class, "counter");		 
		 int num = c.getValue();
		 if (num%6 == 0){
			 num = (num / 6);
		 }else{
			 num = (num / 6)+1;
		 }		 
		 return num+"";
	}
	 
	private List<Post> getListEvidencePosts(){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Post.class);
		q.setOrdering("date desc");
		q.setRange(0, 4);
		q.setFilter("evidence == 'yes'");
		@SuppressWarnings("unchecked")
		List<Post> listEvidencePosts = (List<Post>) q.execute();
		return listEvidencePosts;		 
	 }
	 
	@RequestMapping(value = "/sobre", method = RequestMethod.GET)
	public String sobre(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("section","sobre");
		return "sobre";
	 } 
}