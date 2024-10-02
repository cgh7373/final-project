package com.kh.devHelper.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "callback")
	public String gitLogin(@RequestParam String code, HttpSession session)
	{
		//토큰 얻어오기
		String token = gService.getToken(code);
		
		//토큰으로 정보 가져오기
		Member gitMember = gService.getUserInfo(token);
		
		// 이미 가입된 member인지 DB에서 확인
        Member loginMember = mService.selectMember(gitMember);
        // 저장된 멤버가 없을 경우 DB에 추가
        if(loginMember == null)
        {
        	int result = mService.insertMember(gitMember);
        	
        	if(result  > 0) 
        	{
        		loginMember = mService.selectMember(gitMember);
        	}
        	
        }
        else 
        {
        	loginMember = mService.selectMember(gitMember);
        }
        session.setAttribute("loginMember", loginMember);
        return "redirect:/";
	}
	
}
