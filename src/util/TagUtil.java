package util;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import model.Tag;

import com.google.gson.Gson;

public class TagUtil {
 
	@SuppressWarnings("unchecked")
	public static String listarTags(){
		Gson gson = new Gson();
		PersistenceManager pm = PMF.get().getPersistenceManager();		
		Query q = pm.newQuery(Tag.class);
		List<Tag> tags = null;
		String[] tagsArray;
		try {
			tags =  (List<Tag>) q.execute();
			tagsArray = new String[tags.size()];
			for(int j =0;j<tags.size();j++){
				tagsArray[j] = tags.get(j).getTag();
			}
		}finally {
			q.closeAll();
			pm.close();
		}
		String json = gson.toJson(tagsArray);
		return json;
	}

	@SuppressWarnings("unchecked")
	public static Object getTopTags() {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Tag.class);
		q.setRange(0, 20);
		q.setOrdering("counter desc");
		List<Tag> topTags = (List<Tag>)q.execute();
		return topTags;
	}
}