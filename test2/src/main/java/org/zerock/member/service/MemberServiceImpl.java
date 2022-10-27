package org.zerock.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.member.command.MemberVO;
import org.zerock.member.mapper.MemberMapper;

import com.fasterxml.jackson.databind.deser.impl.ManagedReferenceProperty;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		
		int result = mapper.join(vo);
		System.out.println("성공? 실패? "+ result);
		
		return result;
	}

	@Override
	public int idCheck(String id) {
		int result = mapper.idCheck(id);
		System.out.println("아이디 개수 : "+result);
		return result;
	}
	
	@Override
	public int login(MemberVO vo) {
		int result = mapper.login(vo);
		System.out.println("성공? 실패?: "+result);
		return result;
	}

	@Override
	public List<MemberVO> findId(String email)throws Exception{
		return mapper.findId(email);
	}
	@Override
	public MemberVO findIdCheck(String email)throws Exception{
		return mapper.findIdCheck(email);
		
	
	}

	@Override
	public int pwUpdate(MemberVO vo) throws Exception {
		int result = mapper.pwUpdate(vo);
		return result;
	}

	@Override
	public int pwCheck(MemberVO vo) throws Exception {
		int result = mapper.pwCheck(vo);
		return result;
	}

}
