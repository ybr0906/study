package trello.project.domain;

import java.util.Date;

public class ProjectVO {
	@Override
	public String toString() {
		return "ProjectVO [PJT_NO=" + PJT_NO + ", PJT_TITLE=" + PJT_TITLE + ", PJT_CONTENT=" + PJT_CONTENT
				+ ", PJT_DATE=" + PJT_DATE + ", TOTAL_M_NO=" + TOTAL_M_NO + "]";
	}
	private int PJT_NO;
	private String PJT_TITLE;
	private String PJT_CONTENT;
	private Date PJT_DATE;
	private int TOTAL_M_NO;
	public int getPJT_NO() {
		return PJT_NO;
	}
	public void setPJT_NO(int pJT_NO) {
		PJT_NO = pJT_NO;
	}
	public String getPJT_TITLE() {
		return PJT_TITLE;
	}
	public void setPJT_TITLE(String pJT_TITLE) {
		PJT_TITLE = pJT_TITLE;
	}
	public String getPJT_CONTENT() {
		return PJT_CONTENT;
	}
	public void setPJT_CONTENT(String pJT_CONTENT) {
		PJT_CONTENT = pJT_CONTENT;
	}
	public Date getPJT_DATE() {
		return PJT_DATE;
	}
	public void setPJT_DATE(Date pJT_DATE) {
		PJT_DATE = pJT_DATE;
	}
	public int getTOTAL_M_NO() {
		return TOTAL_M_NO;
	}
	public void setTOTAL_M_NO(int tOTAL_M_NO) {
		TOTAL_M_NO = tOTAL_M_NO;
	}
	
	
}
