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
		//��ū ������
		String token = gService.getToken(code);
		
		//��ū���� ���� ��������
		Member githubInfo = gService.getUserInfo(token);
		
		//������ ������ ȸ������ 
		int result = mService.insertMember(githubInfo);
		
		if( result> 0) //ȸ������ ����
		{
			System.out.println("ȸ������ ����");
		}
		else//�α��� ����
		{
			System.out.println("ȸ������ ����");
		}
		return token;
	}
	
}
