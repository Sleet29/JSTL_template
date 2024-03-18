package net.template.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	public Template_join selectInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
			conn = ds.getConnection();
			
			String select_sql = "select * from template_join where id=?";
			
			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Template_join temp = new Template_join();
				temp.setId(rs.getString("id"));
				temp.setPassword(rs.getString("password"));
				temp.setJumin(rs.getString("jumin"));
				temp.setEmail(rs.getString("email"));
				temp.setGender(rs.getString("gender"));
				temp.setHobby(rs.getString("hobby"));
				temp.setPost(rs.getString("post"));
				temp.setAddress(rs.getString("address"));
				temp.setIntro(rs.getString("intro"));
				temp.setRegister_date(rs.getString("register_date"));
				return temp;
			}
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
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}// finally end
		return null;
	}// select Info
	
	public int update(Template_join join) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			// context.xml에 리소스를 생성해 놓은(JNDI에 설정해 놓은) OracleDB를 참조하여 Connection 객체를 얻어 옵니다.
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
			conn = ds.getConnection();

			 String sql = "UPDATE template_join SET password=?, jumin=?, email=?, "
			 		+ "gender=?, hobby=?, post=?, address=?, intro=?, register_date=? WHERE id=?";
			
			// PreparedStatement 객체 열기
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, join.getPassword());
	        pstmt.setString(2, join.getJumin());
	        pstmt.setString(3, join.getEmail());
	        pstmt.setString(4, join.getGender());
	        pstmt.setString(5, join.getHobby());
	        pstmt.setString(6, join.getPost());
	        pstmt.setString(7, join.getAddress());
	        pstmt.setString(8, join.getIntro());
	        pstmt.setString(9, join.getId());
	        pstmt.setString(10, join.getRegister_date());
	        result = pstmt.executeUpdate();    
	    } catch (Exception se) {
	        se.printStackTrace();
	    } finally {
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	    }
	    return result;
	}
	
	public ArrayList<Template_join> selectAll() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Template_join> list = new ArrayList<Template_join>();
	    
	    try {
	        // context.xml에 설정된 리소스를 참조하여 데이터베이스 연결 획득
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
	        conn = ds.getConnection();

	        // SQL 쿼리 작성
	        String select_sql = "SELECT * from template_join "
	        		+ "where id != 'admin' "
	        		+ "order by register_date desc";

	        // PreparedStatement 객체 얻기
	        pstmt = conn.prepareStatement(select_sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Template_join temp = new Template_join();
	            temp.setId(rs.getString("id"));
	            // temp.setPassword(rs.getString("password"));
	            // temp.setJumin(rs.getString("jumin"));
	            // temp.setEmail(rs.getString("email"));
	            temp.setGender(rs.getString("gender"));
	            temp.setHobby(rs.getString("hobby"));
	            // temp.setPost(rs.getString("post"));
	            // temp.setAddress(rs.getString("address"));
	            temp.setIntro(rs.getString("intro"));
	            temp.setRegister_date(rs.getString("register_date"));
	            list.add(temp);
	        }
	    } catch (Exception se) {
	        se.printStackTrace();
	    } finally {
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	    }
	    return list;
	}
	
	public boolean deleteUser(String id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean deleted = false;
	    
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracledb");
	        conn = ds.getConnection();
	        
	        String delete_sql = "DELETE FROM template_join WHERE id=?";
	        
	        // PreparedStatement 객체 얻기
	        pstmt = conn.prepareStatement(delete_sql);
	        pstmt.setString(1, id);
	        int rowsAffected = pstmt.executeUpdate();
	        
	        deleted = rowsAffected > 0;
	    } catch (Exception se) {
	        se.printStackTrace();
	    } finally {
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	    }
		return deleted;
	}
	
}  
