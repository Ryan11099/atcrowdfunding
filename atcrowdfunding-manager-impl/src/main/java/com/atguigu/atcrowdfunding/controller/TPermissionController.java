package com.atguigu.atcrowdfunding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.TPermission;
import com.atguigu.atcrowdfunding.service.TPermissionService;

@Controller
public class TPermissionController {
	
	@Autowired
	TPermissionService permissionService;
	
	
	@ResponseBody
	@RequestMapping("/permission/getPermissions")
	public List<TPermission> getPermissions() {
		return permissionService.listAllPermissions();
		
	}

}
