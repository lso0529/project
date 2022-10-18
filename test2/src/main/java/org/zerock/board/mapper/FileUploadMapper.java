package org.zerock.board.mapper;

import org.zerock.board.command.FileUploadVO;

public interface FileUploadMapper {

	public void uploadFile(FileUploadVO vo);
}
