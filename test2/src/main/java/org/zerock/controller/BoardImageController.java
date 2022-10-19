package org.zerock.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;

import org.zerock.board.service.FileUploadService;

@Controller
@RequestMapping("/board/")
public class BoardImageController {

	@Autowired
	private FileUploadService fileuploadService;

	@RequestMapping(value = "/register.*") 
	public String fileUploadJsp(MultipartFile uploadfile, Model model) throws Exception {

		System.out.println("register");

		return "board/register";
	}

	@PostMapping(value = "/register/") 
	public String multiFileUpload(MultipartFile[] uploadfiles, Model model) throws Exception {
		// 파일을 받을 수 있게끔 MultipartFile 배열을 매개변수 선언

		for (MultipartFile f : uploadfiles) {
			System.out.println("upload() POST 호출");
			// 파일 이름을 String 값으로 반환한다
			System.out.println("파일 이름(uploadfile.getOriginalFilename()) : " + f.getOriginalFilename());
			// 파일 크기를 반환한다
			System.out.println("파일 크기(uploadfile.getSize()) : " + f.getSize());

			fileuploadService.saveFile(f);
		}

		return "board/register";
	}
}