package com.kh.devHelper.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.devHelper.board.model.service.BoardServiceImpl;
import com.kh.devHelper.board.model.vo.Board;
import com.kh.devHelper.common.model.vo.PageInfo;
import com.kh.devHelper.common.template.Pagination;


@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceImpl bs;

	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = bs.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = bs.selectList(pi);
		
		/*
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("board/boardListView");
		*/
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
		
	}
	
}
