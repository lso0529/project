package org.zerock.random.command;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data
@AllArgsConstructor
public class RandomVO {
	private int FNO;
	private String FNAME;
	private String TAG1;
	private String TAG2;
	private String TAG3;
	
	public RandomVO() {}
}
