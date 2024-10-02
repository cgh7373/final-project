package com.kh.devHelper.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.devHelper.member.model.dao.MemberDao;
import com.kh.devHelper.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService 
{
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) 
	{
		return mDao.insertMember(sqlSession, m);
	}

}
