package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.BoardlistVO;


public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	ResultSet rs;
	
	final String BOARDCNT = "select count(*) as cnt from coin_board WHERE c_tag = ?";
	final String NOWDATE = "select sysdate from dual";
	final String NEXTNUM = "SELECT b_id from coin_board order by b_id desc";
	final String BOARDWRITE = "INSERT INTO coin_board values(?,?,?,?,SYSDATE,?,?,?)";
	final String BOARDDATA = "select b_id,b_title,b_name,b_context,m_id,b_view, TO_CHAR(b_date,'YYYY-MM-DD') as b_date from COIN_BOARD where c_tag = ? order by b_id desc";
	final String BOARDLIST = "select b_id,b_title,b_name,b_context,m_id,b_view,b_date from(select ROW_NUMBER() over(ORDER BY b_id desc) num,"
							+ "b_id,b_title,b_name,b_context,m_id,b_view, TO_CHAR(b_date,'YYYY-MM-DD') as b_date from coin_board where c_tag = ?)"
							+ "where num between ? and ?";
	final String BOARDCONTEXT = "select * from coin_board where b_id = ?";
//	final String BOARDPASSSELETE = "select b_pass from coin_board where b_id = ?";
	final String BOARDDELETE = "delete from coin_board where b_id = ? and m_id = ?";
	final String BOARDUPDATE = "update coin_board set b_title = ?, b_name = ?,c_tag=?,b_context=? where b_id = ?";
	final String BOARDVIEW = "update coin_board set b_view = b_view + 1 where b_id = ?";
	
	public int getCnt(int c_tag) {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDCNT);
			pstmt.setInt(1, c_tag);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCnt 오류");
			e.printStackTrace();
		}
		return -1;
	}
	
	public String getDate() {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NOWDATE);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("getDate() �����߻�");
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NEXTNUM);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			System.out.println("getNext() �����߻�");
			e.printStackTrace();
		}
		return -1;
	}
	public BoardlistVO getBoardContext(int b_id) {
		BoardlistVO vo = null;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDCONTEXT);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int c_tag = rs.getInt("c_tag");
				String b_title = rs.getString("b_title");
				String b_name = rs.getString("b_name");
				String b_date = rs.getString("b_date");
				String m_id = rs.getString("m_id");
				String b_context = rs.getString("b_context");
				int b_view = rs.getInt("b_view");
				vo = new BoardlistVO(b_id,c_tag,b_title,b_name,b_date,m_id,b_context,b_view);
			}
		} catch (Exception e) {
			System.out.println("getBoardContext() �����߻�");
			e.printStackTrace();
		}
		return vo;
	}
	public int write(String b_title, String b_name, String m_id,int c_tag , String b_context) {
		int n = 0;
		int idx = getNext();
		try {
			con = JdbcUtil.getConnection();		
			pstmt = con.prepareStatement(BOARDWRITE);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, c_tag);
			pstmt.setString(3, b_title);
			pstmt.setString(4, b_name);
			pstmt.setString(5, m_id);
			pstmt.setString(6, b_context);
			pstmt.setInt(7, 0);
			
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("write() �����߻�");
			e.printStackTrace();
		}
		return n;
	}
	public ArrayList<BoardlistVO> getBoardlist(int c_tag,int start,int end){
		ArrayList<BoardlistVO> list = new ArrayList<>();
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDLIST);
			pstmt.setInt(1, c_tag);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_name = rs.getString("b_name");
				String b_date = rs.getString("b_date");
				String m_id = rs.getString("m_id");
				String b_context = rs.getString("b_context");
				int b_view = rs.getInt("b_view");
				
				BoardlistVO vo = new BoardlistVO(b_id,c_tag,b_title,b_name,b_date,m_id,b_context,b_view);
				
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getBoardlist() �����߻�");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}
	public int deleteboard(int b_id,String m_id) {
		int n = -1;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDDELETE);
			pstmt.setInt(1, b_id);
			pstmt.setString(2,m_id);
			n = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteboard() �����߻�");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt,rs);
		}
		return n;
	}
	public int updateboard(BoardlistVO vo) {
		int n = -1;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDCONTEXT);
			pstmt.setInt(1, vo.getB_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					pstmt = con.prepareStatement(BOARDUPDATE);
					pstmt.setString(1, vo.getB_title());
					pstmt.setString(2, vo.getB_name());
					pstmt.setInt(3, vo.getC_tag());
					pstmt.setString(4, vo.getB_context());
					pstmt.setInt(5, vo.getB_id());
					
					n = pstmt.executeUpdate();
	
			}else {
				n = -1;
			}
		} catch (Exception e) {
			System.out.println("updateboard() �����߻�");
			e.printStackTrace();
		}
		return n;
	}
	public int plusview(int b_id) {
		int count = 0;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(BOARDVIEW);
			pstmt.setInt(1, b_id);
			count = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}