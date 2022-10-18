package org.zerock.board.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public String saveFile(MultipartFile file);
}
