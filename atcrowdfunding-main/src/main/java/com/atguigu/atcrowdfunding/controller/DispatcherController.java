package com.atguigu.atcrowdfunding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.mapper.TMemberMapper;

@Controller
public class DispatcherController {
	  @Autowired 
	  TMemberMapper memberMapper;
	 //跳转到登录页面
	  
	  @RequestMapping("/login.html")
	  public String toLoginPage() {
		  
		  return "login";
	  }
	@RequestMapping(value= {"/","/index.html","/index"})
	public String toIndexPage() {
		
		System.out.println("测试页面跳转！！！！");
		System.out.println(memberMapper);
		return "index";
	}
	
}
