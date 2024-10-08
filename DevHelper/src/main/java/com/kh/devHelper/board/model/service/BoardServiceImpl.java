package com.kh.devHelper.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.devHelper.board.model.dao.BoardDao;
import com.kh.devHelper.board.model.vo.Board;
import com.kh.devHelper.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bd;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int selectListCount() {
		return bd.selectListCount(sst);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bd.selectList(sst,pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bd.insertBoard(sst, b);
	}


}
