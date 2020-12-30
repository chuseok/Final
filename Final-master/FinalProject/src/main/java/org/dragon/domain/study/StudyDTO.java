package org.dragon.domain.study;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyDTO {
	
	private String userId;
	private String bookId;
	private String bookTitle;
	private String studyDate;	

}
