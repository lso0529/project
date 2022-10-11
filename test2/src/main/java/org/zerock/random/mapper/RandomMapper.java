package org.zerock.random.mapper;

import org.zerock.random.command.RandomVO;

public interface RandomMapper {
	public RandomVO selectFood(int fno);
	public int getTotal();
}
