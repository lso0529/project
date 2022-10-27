package org.zerock.board.command;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String FileName;
	private boolean fileType;
	
	private int bno;
}
