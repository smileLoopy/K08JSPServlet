package homework;

public class MembershipDTO {
	
	//멤버변수: 항상 private으로 선언하고 membership 테이블의 컬럼명과 동일하게 생성한다
	private String num;
	private String id;
	private String pass;
	private String name;
	private String gender;
	private String birthday;
	private String address;
	private String email;
	private String mobilenum;
	private String telnum;
	private String regidate;
	
	//생성자
	public MembershipDTO(String num, String id, String pass, String name, String gender, String birthday,
			String address, String email, String mobilenum, String telnum, String regidate) {
		super();
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.email = email;
		this.mobilenum = mobilenum;
		this.telnum = telnum;
		this.regidate = regidate;
	}

	public MembershipDTO() {
		// TODO Auto-generated constructor stub
	}

	//getter/setter 생성
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobilenum() {
		return mobilenum;
	}
	public void setMobilenum(String mobilenum) {
		this.mobilenum = mobilenum;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	




}
