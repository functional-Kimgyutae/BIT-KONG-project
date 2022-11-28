package vo;
public class ReceiptVO {
	
	private int idx; //private key
	private String m_id;
	private String coin_id;
	private int price;
	private int cnt;
	private String isbuy;
	private String isdone;
	private String uptime;
	private String donetime;
	
	public ReceiptVO(int idx, String m_id, String coin_id, int price, int cnt, String isbuy, String isdone,
			String uptime, String donetime) {
		super();
		this.idx = idx;
		this.m_id = m_id;
		this.coin_id = coin_id;
		this.price = price;
		this.cnt = cnt;
		this.isbuy = isbuy;
		this.isdone = isdone;
		this.uptime = uptime;
		this.donetime = donetime;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCoin_id() {
		return coin_id;
	}
	public void setCoin_id(String coin_id) {
		this.coin_id = coin_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getIsbuy() {
		return isbuy;
	}
	public void setIsbuy(String isbuy) {
		this.isbuy = isbuy;
	}
	public String getIsdone() {
		return isdone;
	}
	public void setIsdone(String isdone) {
		this.isdone = isdone;
	}
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
	public String getDonetime() {
		return donetime;
	}
	public void setDonetime(String donetime) {
		this.donetime = donetime;
	}
	
	
}