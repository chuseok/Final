package org.dragon.domain.word;

import lombok.Data;

@Data
public class WordBookVO  {

	private Long bookId;
	private Long folderId;
	private String userId;
	private String wordTitle;
}
