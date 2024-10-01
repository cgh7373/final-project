package com.kh.devHelper.work.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class WorkDao {

	public int selectList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("workmapper.selectList");
	}

}
