package com.kh.devHelper.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.devHelper.common.model.service.GitService;
import com.kh.devHelper.member.model.service.MemberServiceImpl;
import com.kh.devHelper.member.model.vo.Member;

@Controller
public class MemberController 
{
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private GitService gService;
	
	
	private String token = "";
	
	@RequestMapping(value = "login.me")
	public String loginPage()
	{
		return "member/loginPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "callback")
	public String gitLogin(String code)
	{
		//토큰 얻어오기
		String token = gService.getToken(code);
		
		//토큰으로 정보 가져오기
		Member githubInfo = gService.getUserInfo(token);
		
		//가져온 정보로 회원가입 
		int result = mService.insertMember(githubInfo);
		
		if( result> 0) //회원가입 성공
		{
			System.out.println("회원가입 성공");
		}
		else//로그인 실패
		{
			System.out.println("회원가입 실패");
		}
		return token;
	}
	
}
