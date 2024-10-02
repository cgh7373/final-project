package com.kh.devHelper.board.model.service;

import java.util.ArrayList;

import com.kh.devHelper.board.model.vo.Board;
import com.kh.devHelper.common.model.vo.PageInfo;

public interface BoardService {

	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	int insertBoard(Board b);
}
