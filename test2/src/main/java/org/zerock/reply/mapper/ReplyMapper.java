package org.zerock.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.board.command.Criteria;
import org.zerock.reply.command.ReplyVO;

	public interface ReplyMapper {
		public int insert(ReplyVO vo);
		public ReplyVO read(int rno);
		public int delete(int rno);
		public int update(ReplyVO vo);
		public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("bno") int bno
				);
		public int getCountByBno(int bno);	//해당 게시글의 댓글 갯수
	}
