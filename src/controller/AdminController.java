package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Author;
import model.Counter;
import model.Post;
import model.Tag;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import util.Initiate;
import util.PMF;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/panel", method = RequestMethod.GET)
	public String panel(HttpServletRequest request,ModelMap model) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Post.class);
		q.setOrdering("date desc");
		q.setRange(0, 6);
		List<Post> posts = null;
		try {
			posts =  (List<Post>) q.execute();
			if (!posts.isEmpty()){
				model.addAttribute("posts", posts);
				model.addAttribute("postCounter", countPages());
			}
		} finally {
			q.closeAll();
			pm.close();
		}
		HttpSession session = request.getSession();
		session.setAttribute("erroAdd", null);
		return "panel";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/panel/{n}", method = RequestMethod.GET)
	public String panelpage(@PathVariable int n, HttpServletRequest request,ModelMap model) {
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
		List<Post> posts = null;
		try {
			posts =  (List<Post>) q.execute();
			if (!posts.isEmpty()){
				model.addAttribute("posts", posts);
				model.addAttribute("postCounter", countPages());
			}
		} finally {
			q.closeAll();
			pm.close();
		}
		HttpSession session = request.getSession();
		session.setAttribute("erroAdd", null);
		return "panel";
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
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, ModelMap model) {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Query q = pm.newQuery(Author.class);
			q.setFilter("login == loginParameter");
			q.declareParameters("String loginParameter");
			q.setUnique(true);
			Author a = (Author) q.execute(login);
			if (a != null){
				if (a.getPassword().equals(password)){
					HttpSession session = request.getSession();
					session.setAttribute("author",a);
					session.setAttribute("authorkey",a.getKey());
					return new ModelAndView("redirect:panel");
				}
				return new ModelAndView("redirect:login");				
			}
			else{
				return new ModelAndView("redirect:login");
			}
		}finally {
			pm.close();
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, ModelMap model) {	
		HttpSession session = request.getSession();
		session.invalidate();
		return "panel";
	}
	
	@RequestMapping(value = "/editprofile", method = RequestMethod.GET)
	public String editprofile(ModelMap model) {
		return "editprofile";
	}
	
	@RequestMapping(value = "/editprofile", method = RequestMethod.POST)
	public ModelAndView editprofile(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Key k = (Key) session.getAttribute("authorkey");
	        Author a = pm.getObjectById(Author.class, k);
			a.setName((String)request.getParameter("name"));
			a.setEmail((String)request.getParameter("email"));
			a.setFacebook((String)request.getParameter("facebook"));
			a.setInstagram((String)request.getParameter("instagram"));
			a.setTwitter((String)request.getParameter("twitter"));
			a.setSteam((String)request.getParameter("steam"));
			a.setProfileImageURL((String)request.getParameter("profileImageURL"));
			a.setBio((String)request.getParameter("bio"));
			session.setAttribute("author",a);
			return new ModelAndView("redirect:panel");
		}finally {
			pm.close();
		}
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request, ModelMap model) {
		return "add";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addPost(HttpServletRequest request, ModelMap model) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		HttpSession session = request.getSession();
		Query q = pm.newQuery(Tag.class);
		q.setFilter("tag == tagParameter");
		q.declareParameters("String tagParameter");
		try {
			String title = (String)request.getParameter("title");
			String body = (String)request.getParameter("body");
			String tags = (String)request.getParameter("tags");
			String type = (String)request.getParameter("type");
			String subtitle = (String)request.getParameter("subtitle");
			String image = (String)request.getParameter("image");
			String evidence = (String)request.getParameter("evidence");
			
			if (title== "" || tags=="" || type==""){
				return new ModelAndView("redirect:add");
			}
			else{
				
				/*Verifica duplicidade*/
				Query qDouble = pm.newQuery(Post.class);
				qDouble.setFilter("title == titleParameter");
				qDouble.declareParameters("String titleParameter");
				List<Post> results = (List<Post>) qDouble.execute(title);
				if (!results.isEmpty()){
		        	return new ModelAndView("redirect:add");
		        }
				
				Post p = new Post();		
				
				tags = tags.replaceAll(", ", ",").toUpperCase().trim();
				List<String> tagsList = new ArrayList<String>(Arrays.asList(tags.split(",")));
				Key keyTag;
				for (String t : tagsList) {
					List<Tag> tagBase =  (List<Tag>) q.execute(t);
					if (tagBase.isEmpty()){
						keyTag = KeyFactory.createKey(Tag.class.getSimpleName(), t);
						Tag newTag = new Tag();
						newTag.setTag(t);
						newTag.setKey(keyTag);
						newTag.setCounter(1);
						pm.makePersistent(newTag);
					}
					else{
						Tag plusTag = pm.getObjectById(Tag.class, tagBase.get(0).getKey());
						plusTag.setCounter(plusTag.getCounter()+1);
					}
				}	
				
				Date date = new Date();
				Key k = (Key) session.getAttribute("authorkey");
		        Author a = pm.getObjectById(Author.class, k);
				String url = title.replaceAll(" ", "_").replaceAll("\\W", "");
				url = url.trim().toLowerCase();
				
		        p.setTitle(title);
		        Text bodyText = new Text(body);
				p.setBody(bodyText);
		        p.setTags(tagsList);
		        p.setDate(date);
		        p.setType(type);
				p.setAuthor(a);
				p.setSubtitle(subtitle);
				p.setImage(image);
				
				//destaque
				if (evidence != null && evidence.equals("yes")){
					p.setEvidence(evidence);
				}
				
				Key key = KeyFactory.createKey(Post.class.getSimpleName(), url);
				p.setKey(key);
				pm.makePersistent(p);
				
				//counter geral
				Counter c = pm.getObjectById(Counter.class, "counter");
				c.setValue(c.getValue()+1);
				
				//counter do autor
				a.setCounter(a.getCounter()+1);
				
				//counter de sessoes
				Counter cSection = pm.getObjectById(Counter.class, type);
				cSection.setValue(cSection.getValue()+1);
				
				return new ModelAndView("redirect:panel");
			}
		}finally {
			pm.close();
			q.closeAll();
		}
	}
	
	@RequestMapping(value = "/delete/{key}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable String key, HttpServletRequest request, ModelMap model) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {			 
			Post p = pm.getObjectById(Post.class, key);
			
			//counter da tag
			for (String tag : p.getTags()) {
				Tag t = pm.getObjectById(Tag.class, tag);
				if (t.getCounter() <= 1){
					pm.deletePersistent(t);
				}
				else{
					t.setCounter(t.getCounter()-1);
				}
			}			
			
			//counter do autor
			p.getAuthor().setCounter(p.getAuthor().getCounter()-1);
			
			//counter de sessoes
			Counter cSection = pm.getObjectById(Counter.class, p.getType());
			cSection.setValue(cSection.getValue()-1);
			
			//counter geral
			Counter c = pm.getObjectById(Counter.class, "counter");
			c.setValue(c.getValue()-1);
			
			pm.deletePersistent(p);
		} finally {
			pm.close();
		}		
		return new ModelAndView("redirect:../panel");
	}
	
	@RequestMapping(value = "/edit/{key}", method = RequestMethod.GET)
	public String editPost(@PathVariable String key, HttpServletRequest request, ModelMap model) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
	        Post p = pm.getObjectById(Post.class, key);
	        model.addAttribute("post",p);
	        List<String> tags = p.getTags();
	        String tag = "";
	        for (String t : tags) {
				tag=tag+t+", ";
			}
	        model.addAttribute("tag",tag);
			return "edit";
		} finally {
			pm.close();
		}		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, ModelMap model) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Tag.class);
		q.setFilter("tag == tagParameter");
		q.declareParameters("String tagParameter");
		
		try {
			String title = (String)request.getParameter("title");
			String body = (String)request.getParameter("body");
			String tags = (String)request.getParameter("tags");
			String type = (String)request.getParameter("type");
			String subtitle = (String)request.getParameter("subtitle");
			String image = (String)request.getParameter("image");
			String evidence = (String)request.getParameter("evidence");
			
			if (tags=="" || type==""){
				return new ModelAndView("redirect:edit");
			}
			
			Post p = pm.getObjectById(Post.class, (String)request.getParameter("key"));			
			tags = tags.replaceAll(", ", ",").toUpperCase().trim();
			List<String> tagsList = new ArrayList<String>(Arrays.asList(tags.split(",")));
			
			//verificacao das tags para a contagem
			if (!p.getTags().equals(tagsList)){
				
				//excluindo ou diminuindo as antigas
				for (String tag : p.getTags()) {
					Tag t = pm.getObjectById(Tag.class, tag);
					if (t.getCounter() <= 1){
						pm.deletePersistent(t);
					}
					else{
						t.setCounter(t.getCounter()-1);
					}					
				}
				for (String tag : tagsList){
					List<Tag> tagBase =  (List<Tag>) q.execute(tag);
					if (tagBase.isEmpty()){
						Key keyTag = KeyFactory.createKey(Tag.class.getSimpleName(), tag);
						Tag newTag = new Tag();
						newTag.setTag(tag);
						newTag.setKey(keyTag);
						newTag.setCounter(1);
						pm.makePersistent(newTag);
					}
					else{
						Tag plusTag = pm.getObjectById(Tag.class, tagBase.get(0).getKey());
						plusTag.setCounter(plusTag.getCounter()+1);
					}
				}
			}
			
			//verificacao de sessao para ajustar a contagem
			if (!p.getType().equals(type)){
				//diminuindo a antiga
				Counter cOld = pm.getObjectById(Counter.class, p.getType());
				cOld.setValue(cOld.getValue()-1);	
				//aumentando a nova
				Counter cNew = pm.getObjectById(Counter.class, type);
				cNew.setValue(cNew.getValue()+1);	
			}
			
			p.setTags(tagsList);
			p.setType(type);			
			p.setTitle(title);
			Text bodyText = new Text(body);
			p.setBody(bodyText);
			p.setSubtitle(subtitle);
			p.setImage(image);
			
			//destaque
			if (evidence != null && evidence.equals("yes")){
				p.setEvidence(evidence);
			}else{
				p.setEvidence(null);
			}
			
			return new ModelAndView("redirect:panel");
		}finally {
			pm.close();
		}
	}
	
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init(ModelMap model) {
		Initiate.init();	
		return "panel";
	}
}
