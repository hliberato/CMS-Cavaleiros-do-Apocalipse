package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.datanucleus.annotations.Unowned;

@PersistenceCapable
public class Post implements Serializable{
	
	private static final long serialVersionUID = 7781738486371839346L;

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private String title;
	
	@Persistent
	private String subtitle;
	
	@Persistent
	private String image;
	
	@Persistent(defaultFetchGroup = "true")
	@Unowned
	private Author author; 
	
	@Persistent
	private Text body;
	
	@Persistent
	List<String> tags;
	
	@Persistent
	private Date date;
	
	@Persistent
	private String type;
	
	@Persistent
	private String evidence;
	
	public String getTypeValue(){
		switch (this.getType()) {
		case "filmes":
			return "Filmes";
		case "seriesetv":
			return "Séries e TV";
		case "animesemangas":
			return "Animes e Mangás";
		case "leituraehq":
			return "Leitura e HQs";
		case "games":
			return "Games";
		case "analises":
			return "Análises";
		case "musica":
			return "Música";
		case "tecnologia":
			return "Tecnologia";
		case "gastronomia":
			return "Gastronomia";
		case "humor":
			return "Humor";
		default:
			return "";
		}
	}
	
	public String getFormatedDate(){
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        String data = format.format(this.getDate());
		return data;
	}

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Text getBody() {
		return body;
	}

	public void setBody(Text text) {
		this.body = text;
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEvidence() {
		return evidence;
	}

	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}

}
