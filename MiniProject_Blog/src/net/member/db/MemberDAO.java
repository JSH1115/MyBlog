package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 에러 : " + ex);
			return;
		}
	}
	
	public int isMember(MemberBean member) {
		String sql = "SELECT MEMBER_PW FROM MEMBER_J WHERE MEMBER_ID = ?";
		int result = -1;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_ID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("MEMBER_PW").equals(member.getMEMBER_PW())) {
					result = 1; 
				} else {
					result = 0; 
				}
			} else {
				result = -1; 
			}
		} catch(Exception ex) {
			System.out.println("isMember 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		
		return result;
	}
	
	public boolean joinMember(MemberBean member) {
		String sql = "INSERT INTO MEMBER_J VALUES (?,?,?,?,?)";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_ID());
			pstmt.setString(2, member.getMEMBER_PW());
			pstmt.setString(3, member.getMEMBER_NAME());
			pstmt.setInt(4, member.getMEMBER_AGE());
			pstmt.setString(5, member.getMEMBER_EMAIL());
			result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true;
			}
		} catch(Exception ex) {
			System.out.println("joinMember 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		
		return false;
	}
	
	public List<MemberBean> getMemberList() {
		String sql = "SELECT * FROM MEMBER_J";
		List<MemberBean> memberlist = new ArrayList<MemberBean>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				
				mb.setMEMBER_ID(rs.getString("MEMBER_ID"));
				mb.setMEMBER_PW(rs.getString("MEMBER_PW"));
				mb.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				mb.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
				mb.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
				memberlist.add(mb);
			}
			
			return memberlist;
		} catch(Exception ex) {
			System.out.println("getMemberList 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	public MemberBean getDetailMember(String id) {
		String sql = "SELECT * FROM MEMBER_J WHERE MEMBER_ID = ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			MemberBean mb = new MemberBean();
			mb.setMEMBER_ID(rs.getString("MEMBER_ID"));
			mb.setMEMBER_PW(rs.getString("MEMBER_PW"));
			mb.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
			mb.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
			mb.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
			
			return mb;
		} catch(Exception ex) {
			System.out.println("getDetailMember 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		
		return null;
	}
	
	public boolean updateMember(MemberBean member) {
		String sql = "UPDATE MEMBER_J SET MEMBER_PW = ?, ";
			   sql += "MEMBER_NAME = ?, MEMBER_AGE = ?,";
			   sql += "MEMBER_EMAIL = ? WHERE MEMBER_ID = ?";
		int res = 0;
		boolean result = false;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_PW());
			pstmt.setString(2, member.getMEMBER_NAME());
			pstmt.setInt(3, member.getMEMBER_AGE());
			pstmt.setString(4, member.getMEMBER_EMAIL());
			pstmt.setString(5, member.getMEMBER_ID());
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				result = true;
			}
			
		} catch(Exception ex) {
			System.out.println("updateMember 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		
		return result;
	}
		
	public boolean deleteMember(String id) {
		String sql = "DELETE FROM MEMBER_J WHERE MEMBER_ID = ?";
		int res = 0;
		boolean result = false;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				result = true;
			}
			
		} catch(Exception ex) {
			System.out.println("deleteMember 에러 : " + ex);
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
			if(con != null) try {con.close();}catch(SQLException ex){}
		}
		
		return result;
	}
	
}
