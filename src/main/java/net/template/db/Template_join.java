package net.template.db;

public class Template_join {
	private String id;
	private String password;
	private String jumin;
	private String email;
	private String gender;
	private String hobby;
	private String post;
	private String address;
	private String intro;
	private String register_date;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getJumin() {
		return jumin;
	}
	
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String getGenderView() {
		if(gender.equals("m")) {
			return "남자";
		} else {
			return "여자";
		}
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getHobby() {
		return hobby;
	}
	
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	public String getPost() {
		return post;
	}
	
	public void setPost(String post) {
		this.post = post;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getIntro() {
		return intro;
	}
	
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public String getRegister_date() {
		return register_date;
	}
	
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	

}
