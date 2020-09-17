package org.study.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchCriteria {
	
	private String type;
	private String keyword;
	
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}

}
