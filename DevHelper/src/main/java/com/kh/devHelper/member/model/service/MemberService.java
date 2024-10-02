package com.kh.devHelper.member.model.service;

import com.kh.devHelper.member.model.vo.Member;

public interface MemberService 
{
	int insertMember(Member m);
	Member selectMember(Member m);
}
