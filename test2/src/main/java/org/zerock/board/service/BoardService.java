package org.zerock.board.service;

import java.util.ArrayList;
import java.util.List;

import org.zerock.board.command.BoardAttachVO;
import org.zerock.board.command.BoardVO;
import org.zerock.board.command.Criteria;

public interface BoardService {

	public ArrayList<BoardVO> getList(Criteria cri); //페이징 처리된 리스트 가져오기
	
	public void register(BoardVO vo); //게시판 등록 메서드
	public BoardVO getContent(int bno); //게시물 상세보기 메서드(반환유형 고려)
	public void update(BoardVO vo); //게시물 수정 완료 메서드
	public void delete(int bno); //게시물 삭제 메서드
	
	public int getTotal(); //게시물 전체 갯수
	
	public List<BoardAttachVO> getAttachList(int bno);	//첨부파일 목록 가져오기
}
