package com.recruit.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.GetMapping; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//import com.recruit.vo.EnterprisesVO;
//import com.springexample.demoweb.vo.Person;

	@Controller
	@RequestMapping(path= {"/mypage"})
	public class SmartMatchController {


//		@GetMapping(path = { "/smartMatch" })
//		@ResponseBody
//		public EnterprisesVO smartMatch() {
//
//			URL url = null;
//			URLConnection conn = null;
//			InputStream is = null;
//			InputStreamReader isr = null;
//			String smartMatch = null;
//			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//			try {
//				url = new URL("http://localhost:5000/team-two/demo-one");
//				conn = url.openConnection();
//				is = conn.getInputStream();
//				isr = new InputStreamReader(is);
//				person = gson.fromJson(isr, Person.class);
//			} catch (Exception ex) {
//				ex.printStackTrace();
//			}
//			
//			return "mypage/smartMatch";
//
//		}

}
