package com.kh.dh.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Board {

	private int boardNo;
	private String boardWriter;
	private String code;
	private String boardTitle;
	private String boardContent;
	
}
