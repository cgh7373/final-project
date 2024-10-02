package com.kh.devHelper.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private int memNo;
	private String memId;
	private String memToken;
	private String gitNick; // DB X
	private String profile; // DB X
	private String type; // DB X
	private String bio; // DB X
	private String memIntro;
	private String stackName;
	private Date createDate;
	private String status;
	private int team;  // ���� ����ϴ� ������Ʈ ��ȣ
	private String teamStatus;  //�������� yȮ��, n�ӽ� , �ϴ��� default ���� n��
	private String proWriter;	// ������Ʈ �ۼ���
	
	public Member(String gitNick, String profile) {
		this.gitNick = gitNick;
		this.profile = profile;
	}
	
}
