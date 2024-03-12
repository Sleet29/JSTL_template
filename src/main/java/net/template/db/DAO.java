package net.template.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {

	public int isId(String id) {
	    return isId(id, null);
	}

	public int isId(String id, String password) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0; // 아이디가 존재하지 않는 경우
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
	        conn = ds.getConnection();
	        
	        String select_sql = "select id, password from template_join where id = ?";
	        
	        // PreparedStatement 객체 얻기
	        pstmt = conn.prepareStatement(select_sql.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            if (rs.getString("password").equals(password)) {
	                result = 1; // 아이디와 비밀번호가 일치하는 경우
	            } else {
	                result = -1; // 아이디는 일치하고 비밀번호가 일치하지 않는 경우
	            }
	        }// if (rs.next())
	    } catch (Exception se) {
	        se.printStackTrace();
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (pstmt !=null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close(); // 연결 종료
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	    }
	    return result; // 결과 반환
	}

	public int insert(Template_join join) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
			conn = ds.getConnection(); 
				
			String sql = "insert into template_join "
					+ "	(id, password, jumin, email,gender, hobby, post, address, intro)"
					+ " values(?,?,?,?,?,?,?,?,?)";
			
			// PreparedStatement 객체 열기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, join.getId());
			pstmt.setString(2, join.getPassword());
			pstmt.setString(3, join.getJumin());
			pstmt.setString(4, join.getEmail());
			pstmt.setString(5, join.getGender());
			pstmt.setString(6, join.getHobby());
			pstmt.setString(7, join.getPost());
			pstmt.setString(8, join.getAddress());
			pstmt.setString(9, join.getIntro());
			result = pstmt.executeUpdate();	
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			
		}
		return result;
	}

	
}