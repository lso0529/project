package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.board.command.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/")
public class UploadController {

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	//년/월/일 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//이미지파일 판단(섬네일)
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>>
	uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		
		//make folder
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path: "+uploadPath);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//make yyyy/MM/dd folder
		
		for (MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			// IE has file path
			//uploadFileName = uploadFileName.substring(uploadFileName.
			//lastIndexOf("\\") + 1);
			log.info("only file name: "+ uploadFileName);
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//check image type file
				if(checkImageType(saveFile)) {	//파일이름 's_'로 시작하는 파일이 섬네일
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new
							File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.
							getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				//add to list
				list.add(attachDTO);
				
			} catch (Exception e) {
			log.error(e.getMessage());
			} // end catch
		} // end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@GetMapping("/display")		//섬네일 데이터 전송
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
	log.info("fileName: "+ fileName);
	File file = new File("c:\\upload\\" + fileName);
	log.info("file: "+ file);
	ResponseEntity<byte[]> result = null;
	try {
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", Files.probeContentType(file.toPath())); 
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
				header, HttpStatus.OK);
	} catch (IOException e) {
		e.printStackTrace();
	}
	return result;
}
}