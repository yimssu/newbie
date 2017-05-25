package org.zerock.domain;

import java.util.Arrays;

public class dddVO {
	
	private String[] ddd;

	public String[] getDdd() {
		return ddd;
	}

	public void setDdd(String[] ddd) {
		this.ddd = ddd;
	}

	@Override
	public String toString() {
		return "dddVO [ddd=" + Arrays.toString(ddd) + "]";
	}

}
