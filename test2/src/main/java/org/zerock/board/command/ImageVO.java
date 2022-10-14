package org.zerock.board.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageVO {

	private String uuid;
	private String uploadpath;
	private String filename;
	private String filetype;
	private int bno;
}
