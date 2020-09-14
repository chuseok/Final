package org.zerock.domain;

import lombok.Data;

@Data
public class FolderVO {
	
	private Long folderId;
	private String folderTitle;
	private String description;
	private String link;
	private String userId;
}
