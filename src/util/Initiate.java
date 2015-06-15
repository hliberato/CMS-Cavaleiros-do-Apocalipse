package util;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import model.Author;
import model.Counter;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class Initiate {
	
	@SuppressWarnings("unchecked")
	public static void init(){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Author.class);
		q.setFilter("login == loginParameter");
		q.declareParameters("String loginParameter");
	
		try {
			Key key;
			Author a = new Author();
			a.setLogin("Guerra");
			a.setPassword("guerra4CApocalips3");
			List<Author> results = (List<Author>) q.execute(a.getLogin());
			if (results.isEmpty()){
				key = KeyFactory.createKey(Author.class.getSimpleName(), "guerra");
				a.setKey(key);
				a.setCounter(0);
				pm.makePersistent(a);
			}
			
			a = new Author();
			a.setLogin("Fome");
			a.setPassword("fome4CApocalips3");
			results = (List<Author>) q.execute(a.getLogin());
			if (results.isEmpty()){
				key = KeyFactory.createKey(Author.class.getSimpleName(), "fome");
				a.setKey(key);
				a.setCounter(0);
				pm.makePersistent(a);
			}
			
			a = new Author();
			a.setLogin("Peste");
			a.setPassword("peste4CApocalips3");
			results = (List<Author>) q.execute(a.getLogin());
			if (results.isEmpty()){
				key = KeyFactory.createKey(Author.class.getSimpleName(), "peste");
				a.setKey(key);
				a.setCounter(0);
				pm.makePersistent(a);
			}
			
			a = new Author();
			a.setLogin("Morte");
			a.setPassword("morte4CApocalips3");
			results = (List<Author>) q.execute(a.getLogin());
			if (results.isEmpty()){
				key = KeyFactory.createKey(Author.class.getSimpleName(), "morte");
				a.setKey(key);
				a.setCounter(0);
				pm.makePersistent(a);
			}
			
			Query q2 = pm.newQuery(Counter.class);
			List<Counter> counterList = (List<Counter>) q2.execute();
			if (counterList.isEmpty()){
				
				//contator de posts
				key = KeyFactory.createKey(Counter.class.getSimpleName(), "counter");
				Counter c = new Counter();
				c.setKey(key);
				c.setValue(0);
				pm.makePersistent(c);			
			
				//contador das sessoes
				String sections[] = {"filmes",
									"seriesetv",
									"animesemangas",
									"leituraehq",
									"games",
									"analises",
									"musica",
									"tecnologia",
									"gastronomia",
									"humor"};
				for (String string : sections) {
					key = KeyFactory.createKey(Counter.class.getSimpleName(), string);
					Counter c2 = new Counter();
					c2.setKey(key);
					c2.setValue(0);
					pm.makePersistent(c2);
				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}		
	}
}