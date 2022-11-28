package vo;

public class NoticeVO {
	private int n_id;
	private int n_tag;
	private String n_title;
	private String n_context;
	private String n_date;
	private String m_id;
	private int n_view;
	public NoticeVO(int n_id, int n_tag, String n_title, String n_context, String n_date, String m_id, int n_view) {
		super();
		this.n_id = n_id;
		this.n_tag = n_tag;
		this.n_title = n_title;
		this.n_context = n_context;
		this.n_date = n_date;
		this.m_id = m_id;
		this.n_view = n_view;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public int getN_tag() {
		return n_tag;
	}
	public void setN_tag(int n_tag) {
		this.n_tag = n_tag;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_context() {
		return n_context;
	}
	public void setN_context(String n_context) {
		this.n_context = n_context;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getN_view() {
		return n_view;
	}
	public void setN_view(int n_view) {
		this.n_view = n_view;
	}
	
}
