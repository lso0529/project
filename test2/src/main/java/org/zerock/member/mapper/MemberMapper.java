package org.zerock.member.mapper;

import java.util.List;

import org.zerock.member.command.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo); //회원가입
	public int login(MemberVO vo); //로그인 처리
	public int idCheck(String id); //아이디 확인
	public List<MemberVO> findId(String email); //아이디 찾기
	public MemberVO findIdCheck(String email); //아이디찾기 확인
	public int pwCheck(MemberVO vo); //비밀번호 찾기 
	public int pwUpdate(MemberVO vo); //비밀번호 수정 

}
