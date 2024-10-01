package com.kh.devHelper.work.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.devHelper.common.model.vo.PageInfo;
import com.kh.devHelper.work.model.dao.WorkDao;
import com.kh.devHelper.work.model.vo.Work;

@Service
public class WorkServiceImpl implements WorkService{
	
	@Autowired
	private WorkDao wDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return wDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Work> selectList(PageInfo pi) {
		
		return null;
	}
	
	
	

}
