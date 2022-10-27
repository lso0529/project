package org.zerock.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.board.command.BoardAttachVO;
import org.zerock.board.command.BoardVO;
import org.zerock.board.command.Criteria;
import org.zerock.board.mapper.BoardAttachMapper;
import org.zerock.board.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImple implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Override
	public ArrayList<BoardVO> getList(Criteria cri) {
		ArrayList<BoardVO> list = mapper.pagingList(cri);
		System.out.println(list);
		return list;
	}

	@Transactional	//2개 테이블 insert진행
	@Override
	public void register(BoardVO vo) {
		
		log.info("register..."+vo);
		
		mapper.insertSelectKey(vo);
		
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		log.info(vo);
		log.info("AttachList ... "+vo.getAttachList());
		log.info("AttachList 사이즈... "+vo.getAttachList().size());
		vo.getAttachList().forEach(attach -> {
			log.info("Attach BNO..... "+vo.getBno());
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	public BoardVO getContent(int num) {
		BoardVO vo = mapper.getContent(num);
		return vo;
	}

	@Override
	public void update(BoardVO vo) {
		boolean bool = mapper.updateBoard(vo);
	}

	@Override
	public void delete(int num) {
		mapper.deleteBoard(num);

	}

	@Override
	public int getTotal() {
		int total = mapper.getTotal();
		return total;
	}

}
