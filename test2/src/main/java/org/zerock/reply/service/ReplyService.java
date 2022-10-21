package org.zerock.reply.service;

import java.util.List;

import org.zerock.board.command.Criteria;
import org.zerock.reply.command.ReplyPageVO;
import org.zerock.reply.command.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);//등록
	public ReplyVO get(int rno);//정보보기
	public int modify(ReplyVO vo);//수정
	public int remove(int rno);//삭제
	public List<ReplyVO> getList(Criteria cri, int bno);//리스트보기
	public ReplyPageVO getListPage(Criteria cri, int bno);
}
