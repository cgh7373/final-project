package com.kh.devHelper.employmentAPI.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class APIcontroller {
	
	private static final String serviceKey = "2mj%2BiKt4iQ0xuf1PfeDRzkWy7KaPiuBO8Ui%2FD8QBuF8Bo4%2BN3i8nYJIOzizmAebj0MaiTJRJFwNahQZ5O1kARA%3D%3D";

	@ResponseBody
	@RequestMapping(value="work.wo", produces = "application/json; charset=utf-8")
	public String employAPI(@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="numOfRows",defaultValue="15")int numOfRows) throws IOException {
		String url = "https://apis.data.go.kr/1051000/recruitment/list";
		url += "?serviceKey=" + serviceKey;
		url += "&numOfRows=" + numOfRows;
		url += "&pageNo=" + pageNo;
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
		
		String responseText="";
		String line;
		
		while((line = br.readLine())!=null) {
			responseText += line;
		}
		br.close();
		urlConnection.disconnect();
				
		return responseText;
	}
}
