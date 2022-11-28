package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.NoticeVO;

public class NoticeDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	final String NOTICEDATA = "select n_id,n_tag,n_title,n_context,m_id,n_view, TO_CHAR(n_date,'YYYY-MM-DD') as n_date from COIN_NOTICE where n_tag = ? order by n_id desc";	
	final String NOTICEWRITE = "insert into COIN_NOTICE values(?,0,?,?,?,SYSDATE,?)";
	final String NEXTNUM = "select n_id from coin_notice order by n_id desc";
	final String NOTICECONTEXT = "select * from coin_notice where n_id = ?";
	final String NOTICEVIEW = "update coin_notice set n_view = n_view + 1 where n_id = ?";
	public int getNext() {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NEXTNUM);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 성공
		} catch (Exception e) {
			System.out.println("getNext() 오류");
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public ArrayList<NoticeVO> getnoticedata(int n_tag){
		ArrayList<NoticeVO> list = new ArrayList<>();
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NOTICEDATA);
			pstmt.setInt(1, n_tag);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int n_id = rs.getInt("n_id");
				String n_title = rs.getString("n_title");
				String n_context = rs.getString("n_context");
				String n_date = rs.getString("n_date");
				String m_id = rs.getString("m_id");
				int n_view = rs.getInt("n_view");
				NoticeVO vo = new NoticeVO(n_id,n_tag,n_title,n_context,n_date,m_id,n_view);
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getnoticedata() 오류");
			e.printStackTrace();
		}
		return list;
	}
	public int insertnotice(String n_title,String n_context,String m_id) {
		int n = 0;
		int idx = getNext();
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NOTICEWRITE);
			pstmt.setInt(1, idx);
			pstmt.setString(2, n_title);
			pstmt.setString(3, n_context);
			pstmt.setString(4, m_id);
			pstmt.setInt(5, 0);
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertnotice() 오류");
			e.printStackTrace();
		}
		return n;
	}
	public NoticeVO getnoticecontext(int n_id) {
		NoticeVO vo = null;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NOTICECONTEXT);
			pstmt.setInt(1, n_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String n_title = rs.getString("n_title");
				String n_context = rs.getString("n_context");
				String n_date = rs.getString("n_date");
				String m_id = rs.getString("m_id");
				int n_view = rs.getInt("n_view");
				vo = new NoticeVO(n_id,0,n_title,n_context,n_date,m_id,n_view);
			}
		} catch (Exception e) {
			System.out.println("getnoticecontext() 오류");
			e.printStackTrace();
		}
		return vo;
	}
	public int plusview(int n_id) {
		int count = 0;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(NOTICEVIEW);
			pstmt.setInt(1, n_id);
			count = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("plusview() 오류");
			e.printStackTrace();
		}
		return count;
	}
}
