package org.zerock.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.board.command.Criteria;
import org.zerock.reply.command.ReplyPageVO;
import org.zerock.reply.command.ReplyVO;
import org.zerock.reply.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
public class ReplyServiceImp implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		System.out.println("register......"+vo);
		int result = mapper.insert(vo);
		return result;
	}

	@Override
	public ReplyVO get(int rno) {
		System.out.println("get......"+rno);
		ReplyVO vo = mapper.read(rno);
		return vo;
	}

	@Override
	public int modify(ReplyVO vo) {
		System.out.println("modify......"+vo);
		int result = mapper.update(vo);
		return result;
	}

	@Override
	public int remove(int rno) {
		System.out.println("remove......"+rno);
		int result = mapper.delete(rno);
		return result;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		System.out.println("get Reply List of a board......"+bno);
		List<ReplyVO> voList = mapper.getListWithPaging(cri, bno);
		return voList;
	}
	
	@Override
	public ReplyPageVO getListPage(Criteria cri, int bno) {
		return new ReplyPageVO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}

}
