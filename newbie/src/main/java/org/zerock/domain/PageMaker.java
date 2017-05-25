package org.zerock.domain;

public class PageMaker {

	private Criteria cri;
	private int total;
	private int start,end,current,size;
	private boolean prev,next;
	
	public PageMaker(Criteria cri, int total){
		this.cri = cri;
		this.total = total;
		this.current = cri.getPage();
		this.size = cri.getSize( );
		calcPage();
	}
	
	private void calcPage(){
	
		int tempEnd = (int) (Math.ceil(current/10.0)*10);
		
		start = tempEnd - 9;
		
		end = (tempEnd * size) > total ? (int)Math.ceil(total/(double)size):tempEnd; 
		
		prev = start == 1?false:true;
		next = total > end * size ? true:false;
	}

	public Criteria getCri() {
		return cri;
	}
	
	public void setTotal(int total) {
		this.total = total;
		calcPage();
	}

	
	public void setStart(int start) {
		this.start = start;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria setCri(Criteria cri) {
		return cri;
	}

	public int getTotal() {
		return total;
		
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getCurrent() {
		return current;
	}

	public int getSize() {
		return size;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", total=" + total + ", start=" + start + ", end=" + end + ", current="
				+ current + ", size=" + size + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
	
}
