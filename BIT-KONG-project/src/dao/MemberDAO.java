package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.SHA256;
import util.JdbcUtil;
import vo.RegisterVO;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	final String INSERTREGISTER = "insert into member_table(m_id,m_name,m_phone_number,m_password) values(?,?,?,?)";
	final String CONFIRMID = "select m_id from member_table where m_id = ?";
	final String GETUSERDATA = "select * from MEMBER_TABLE where m_id = ? and m_password = ?";
	final String REGISTERCHECK = "select * from member_table where m_id = ?";
	final String CHANGEMONEYS = "update member_table set m_krw = ? where m_id = ?";
	final String FINDEMAIL = "select m_id from member_table where m_name = ? and m_phone_number = ?";
	final String FINDPASSWORD = "update member_table set m_password = ? where m_id = ?";
	final String INSERTCOIN = "insert into coin_wallet values(?,'KRW',50000000,1)";
	public int insertregist(RegisterVO vo) {
		int result = 0;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(INSERTREGISTER);
			String shapwd = SHA256.getHash(vo.getM_password());
			pstmt.setString(1, vo.getM_id());
			pstmt.setString(2, vo.getM_name());
			pstmt.setString(3, vo.getM_phone());
			pstmt.setString(4, shapwd);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertregist() 오류");
			e.printStackTrace();
		}
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(INSERTCOIN);
			pstmt.setString(1, vo.getM_id());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertcoin() 오류");
			e.printStackTrace();
		}
		return result;
	}
	public boolean confirmId(String m_id) {
		boolean result = false;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(CONFIRMID);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("confirmId() 오류");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return result;
	}
	public String emailCheck(String m_id) {
		String result = "";
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(CONFIRMID);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("m_id");
			}
		} catch (Exception e) {
			System.out.println("emailCheck() 오류");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return result;
	}
	public RegisterVO getUserData(String m_id, String m_password) {
		RegisterVO vo = null;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(GETUSERDATA);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new RegisterVO(rs.getString("m_id"), rs.getString("m_name"), 
					rs.getString("m_phone_number"), rs.getString("m_password"));
			}
		} catch (Exception e) {
			System.out.println("getUserData() 오류");
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return vo;
	}
	
	public void changeMoney(int money,String id) {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(CHANGEMONEYS);
			pstmt.setInt(1, money);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("changeMoney 에러");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt);
		}
	}
	public String findId(String m_name, String m_phone) {
		String m_id = "";
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(FINDEMAIL);
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m_id = rs.getString("m_id");
			}
		} catch (Exception e) {
			System.out.println("findId() 오류");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return m_id;
	}
	public int findpwd(String m_id, String m_password) {
		int n = -1;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(FINDPASSWORD);
			System.out.println("m_id"+m_id);
			String shapwd = SHA256.getHash(m_password);
			
			pstmt.setString(1,shapwd);
			pstmt.setString(2,m_id);
			n = pstmt.executeUpdate();
			System.out.println(n);
		} catch (Exception e) {
			System.out.println("findpwd() 오류");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt);
		}
		return n;
	}
}
