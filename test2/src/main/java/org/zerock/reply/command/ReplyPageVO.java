package org.zerock.reply.command;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageVO {
	private int replyCnt;
	private List<ReplyVO> List;
}	
