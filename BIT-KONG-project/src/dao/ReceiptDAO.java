package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.ReceiptVO;

public class ReceiptDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	final String SELECTCNT = "select count(*) as cnt from execution_history WHERE m_id = ?";
	final String SELECTRECEIPT = "select * from(select ROW_NUMBER() over(ORDER BY idx desc) num,idx,m_id,coin_id,price,cnt,isbuy,isdone,uptime,TO_CHAR(donetime, 'YYYY-MM-DD') as donetime from execution_history where m_id = ?)where num between ? and ?";
	
	public int getCnt(String m_id) {
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECTCNT);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<ReceiptVO> getReceiptlist(String id,int start,int end){
		ArrayList<ReceiptVO> list = new ArrayList<>();
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECTRECEIPT);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String m_id = rs.getString("m_id");
				String coin_id = rs.getString("coin_id");
				int price = rs.getInt("price");
				int cnt = rs.getInt("cnt");
				String isbuy = rs.getString("isbuy");
				String isdone = rs.getString("isdone");
				String uptime = rs.getString("uptime");
				String donetime = rs.getString("donetime");
				
				ReceiptVO vo = new ReceiptVO(idx, m_id, coin_id, price, cnt, isbuy, isdone, uptime, donetime);
				
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getReceiptlist() 오류");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}
}
