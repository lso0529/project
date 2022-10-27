package org.zerock.member.service;

import java.util.List;

import org.zerock.member.command.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo); //회원가입
	public int login(MemberVO vo); //로그인
	public int idCheck(String id); //아이디 확인
	public List<MemberVO> findId(String email) throws Exception; //아이디 찾기
	public MemberVO findIdCheck(String email) throws Exception; //아이디 찾기 확인
}
