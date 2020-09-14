package org.zerock.domain;

import lombok.Data;

@Data
public class WordBookVO  {

	private Long bookId;
	private Long folderId;
	private String wordId;
	private String wordTitle;
}
