package homework;
import javax.servlet.ServletContext;
import common.JDBConnect;

/*
앞에서 submit된 폼값을 받아 membership 테이블에 insert 한다
테이블에 입력이 완료되었다면 "가입성공"이라는 alert를 띄우고 로그인 페이지로 이동한다. 
*/
public class MembershipDAO extends JDBConnect{
	
	//DB connect method 1
	public MembershipDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	//DB connect method 2
	public MembershipDAO (ServletContext application) {
		super(application);
	}
	
	//1. DAO for login process (checking whether the id is exist or not) 
	/*
	사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 확인한 후 
	존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다.  
	*/
	public MembershipDTO memberLogin (String uid, String upass) {
		//DTO객체 생성
		MembershipDTO dto = new MembershipDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "SELECT * FROM membership WHERE id=? AND pass=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			//반환된 ResultSet 객체를 통해 회원정보가 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다. (11개)
				dto.setNum(rs.getString(1));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(4));
				dto.setGender(rs.getString(5));
				dto.setBirthday(rs.getString(6));
				dto.setAddress(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setMobilenum(rs.getString(9));
				dto.setTelnum(rs.getString(10));
				dto.setRegidate(rs.getString(11));
			}
			
		}
		catch(Exception e) {
			System.out.println("회원 로그인 확인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//2. DAO for inserting membership info (to Oracle) [책 p282]
	public int memberInsert (MembershipDTO dto) {
		
		int result =0;
		try {
			//쿼리문 작성 (? 갯수 => 9개)
			//쿼리문 작성시 ? 이부분은 '' 안쓰기 => 쓰면 오류 발생 실행시 자동적으로 '' 추가되기 때문
			String query = "INSERT INTO membership ( "
					+ " num, id, pass, name, gender, birthday, address, email, mobilenum, telnum, regidate)  VALUES (seq_membership_num.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ? , sysdate)";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getMobilenum());
			psmt.setString(9, dto.getTelnum());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("회원 데이터 입력 중 예외 발생");
			e.printStackTrace();
			
		}
		
		//INSERT 성공시, 추가한 행의 개수를 반환. => 이 값을 JSP로 반환
		return result;
	}
	

}
