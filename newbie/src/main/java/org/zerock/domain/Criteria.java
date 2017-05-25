package org.zerock.domain;

public class Criteria {

	private int page;
	private int size;
	private String type;
	private String keyword;
	private Integer sno;
	
	
	
	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}
	
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria(){
		this.page = 1;
		this.size = 10;
	}

	public Criteria settingPage(int page){
		if(page <=0){
			this.page=1;
		}
		return this;
	}
	
	public Criteria settingSize(int size){
		
		if(size <= 0 || size <= 5){
			this.size = 5;
		}
		return this;
	}
	
	public int getSkip(){
		return (this.page -1)*this.size;
		
	}
	public int getAmount(){
		return this.size;
		
	}



	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	
	
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", size=" + size + ", type=" + type + ", keyword=" + keyword + "]";
	}


	
	
	
	
	
}
