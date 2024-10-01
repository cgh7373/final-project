package com.kh.devHelper.work.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.devHelper.common.model.vo.PageInfo;
import com.kh.devHelper.common.template.Pagenation;
import com.kh.devHelper.work.model.service.WorkServiceImpl;
import com.kh.devHelper.work.model.vo.Work;

@Controller
public class WorkController {
	
	@Autowired
	private WorkServiceImpl wService;
	
	@RequestMapping()
	private ModelAndView selectList(@RequestParam(value = "cpage",defaultValue = "1")int currentPage, ModelAndView mv) {
		int listCount = wService.selectListCount();
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Work>list = wService.selectList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("work/workListView");
		
		return mv;
		
	}
	
	@RequestMapping("list.wo")
	private String ToListView() {
		return "work/workListView";
	}
	
	
	
	

}
