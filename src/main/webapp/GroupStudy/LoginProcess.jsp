<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//로그인 페이지에서 사용자가 입력한 회원정보 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
System.out.println(userId + "="+ userPwd); //이렇게 써보면 null 값이 나오는것을 확인할 수 있음. 즉, 여기서 에러가남.

//application 내장객체를 통해 web.xml에 입력된 DB접속정보를 읽어옴
String oracleDriver = application.getInitParameter("OracleDriver");
//여기도 마찬가지로 oracleDriver 으로 쓰면 실행에 문제가 생김. 이런경우 복사해서 쓰는게 제일 안전
//웹에서는 에러가 안생기지만 백 console에서는 nullpointerexception dl 뜸. 
//at java.base/java.lang.Class.forName(Class.java:315) => class.forName쪽에서 문제가 생기는건 연결이라는걸 알아야함. 
//class.forname -> jdbc 드라이버 로그 문제 -> xml 파일 확인해보기
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC를 통해 오라클 접속
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//받아온 아이디, 패스워드를 매개변수로 메서드 호출. 일치하는 회원정보가 있는지 확인함.
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd); //dto return 함 
//DB작업이 끝나면 자원해제
dao.close();

if(memberDTO.getId() != null){
	//회원인증(로그인)에 성공한 경우 
	/* 
	세션영역에 아이디와 이름을 저장한다. 
	session영역은 페이지를 이동하더라도 웹브라우저를 닫을때까지 영역이 공유되어
	접근할 수 있다.
	*/
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	//로그인 페이지로 이동한다.
	response.sendRedirect("LoginForm.jsp");
}
else{
	//인증에 실패한 경우 
	/* 
	리퀘스트 영역에 실패 메세지를 저장한다
	request영역은 하나의 요청을 완료할때까지 영역을 공유한다. 즉 요청을 전달하는
	기능이므로 포워드 된 페이지까지 데이터를 공유할 수 있다.
	*/
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//로그인 페이지로 포워드(요청 전달) 한다.
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
