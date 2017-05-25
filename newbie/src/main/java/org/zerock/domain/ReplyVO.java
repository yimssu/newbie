package org.zerock.domain;

import java.sql.Timestamp;

public class ReplyVO {

	 private Integer sno, rno;
	 
	 private String replytext, replyer;
	 
	 private Timestamp regdate, updatedate;

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "ReplyVO [sno=" + sno + ", rno=" + rno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

	
	 
}
