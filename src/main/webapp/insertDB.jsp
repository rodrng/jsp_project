<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String m_id = request.getParameter("userId");
		String m_pw = request.getParameter("userPw");
		String m_email = request.getParameter("userMAIL");
	
		String sql = "INSERT INTO members(id, passwd, email) VALUES(' "+ m_id +" ', ' "+ m_pw +" ' , ' "+ m_email +" ') ";
	
		String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/address";
	    String user = "root";
	    String password = "123qwe";
	    Connection conn = null;
	    Statement sm = null;
    
	    try{
	       Class.forName(driverName);
	       conn = DriverManager.getConnection(url, user, password);
	       sm = conn.createStatement(); // sql을 실행시켜주는 객체 생성(Statement)    
	       int flag = sm.executeUpdate(sql); // sql문이 성공적으로 실행되면 1을 반환
	       
	       if(flag ==1){
	    	   out.println("회원가입 성공!!!!");
	    	   response.sendRedirect("signupSuccess.jsp");
	       } else{
	    	   out.println("회원가입 실패 !!!!");
	    	   response.sendRedirect("signup.jsp");
	       }
	       
	       // out.println(conn);
	    } catch(ClassNotFoundException e) {
	       out.println("jdbc 드라이버 오류");
	    } catch(SQLException e) {
	       out.println("SQL 오류");
	    } finally {
	       try{
	    	  if(sm != null){    	  
		         sm.close();
		      }
	          if(conn != null){    	  
	             conn.close();
	          }
	       } catch(SQLException e) {
	          
	       }
	       
	    }

	    
	    
	%>
</body>
</html>