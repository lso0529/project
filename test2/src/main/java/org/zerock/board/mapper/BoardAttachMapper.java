package org.zerock.board.mapper;

import java.util.List;

import org.zerock.board.command.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
//	public void delete(String uuid);
	public List<BoardAttachVO> findByBno (int bno); //특정 게시물 번호로 첨부파일 찾기
}
