package org.zerock.random.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Random;

import org.apache.http.HttpRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.random.command.RandomVO;
import org.zerock.random.service.RandomService;

@Controller
@RequestMapping("/random")
public class RandomController {
	
	@Autowired
	RandomService service;
	
	@RequestMapping(value="/doRandom")
	public String doRandom(Model model,
			@RequestParam("location") String location) {
		Random random = new Random();
		int total = service.getTotal();
		
		//토탈 수 구해와서 어쩌구 저쩌구 
		int fno = (int)(random.nextInt(total));
		
		RandomVO vo = service.selectfood(fno);
		
		System.out.println(vo.getFNO());
		System.out.println(vo.getFNAME());
		
		model.addAttribute("vo", vo);
		model.addAttribute("location", location);
		
		return "/random/result";
	}
	
	@RequestMapping(value="/resultMap", method = RequestMethod.GET)
	public String resultMap(@RequestParam(value="food") int fno,
			@RequestParam("location") String location,
			Model model) throws UnsupportedEncodingException {
		System.out.println(location);
		RandomVO vo = service.selectfood(fno);
		
		model.addAttribute("food", vo);
		model.addAttribute("location", location);
		
		return "/random/resultMap";
	}
}
