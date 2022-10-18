package org.zerock.board.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadVO {

	private int file_num;
	private String o_name;
	private String file_name;
	private long file_size;
	private int bno;
	
}
