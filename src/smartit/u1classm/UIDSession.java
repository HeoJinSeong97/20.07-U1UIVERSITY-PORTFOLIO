package smartit.u1classm;

public class UIDSession {
	//로그인할 때 데이터베이스에서 회원 정보를 모두 받아와 세션으로 저장하여 활용
	private int idx = 0;
	private String id = "";
	private String password = "";
	private String name = "";
	private String birthday = "";
	private String email = "";
	public int getIdx() {
		return idx;
	}
	public boolean ckid(String str) {
		return str.isEmpty();
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UIDSession [idx=" + idx + ", id=" + id + ", password=" + password + ", name=" + name + ", birthday="
				+ birthday + ", email=" + email + "]";
	}
	/*
	 * public void ClearAll() { this.idx = 0; this.id = null; this.password = null;
	 * this.name = null; this.birthday = 0; this.email = null; }
	 */
	
}
