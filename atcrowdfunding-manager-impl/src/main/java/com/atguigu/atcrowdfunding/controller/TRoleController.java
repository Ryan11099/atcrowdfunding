package com.atguigu.atcrowdfunding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.TRole;
import com.atguigu.atcrowdfunding.consts.AppConsts;
import com.atguigu.atcrowdfunding.service.TRoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
@RequestMapping("/role")
public class TRoleController {
	
	@Autowired 
	TRoleService roleService;
	
	//给角色分配权限
	@RequestMapping("/updatePermissions")
	@ResponseBody
	public String updatePermissions(Integer id , @RequestParam("pids")List<Integer> pids) {
		roleService.deletePermissions(id);//先删除所有的权限
		roleService.updatePermissions(id, pids);//再给其分配权限
		
		return "ok";
		
		
	}
	
	
	//查询自己拥有的权限id集合
	@RequestMapping("/getRolePermissionIds")
	@ResponseBody
	public List<Integer> getRolePermissionIds(Integer id) {
		List<Integer> permissionIds = roleService.getRolePermissionIds(id);
		return permissionIds;
		
	}
	
	//跳转到角色维护页面
		@RequestMapping("/index.html")
		public String toRolePage() {
			
			return "role/role";
		}
		
		//异步请求获取参数
		@ResponseBody//可以自动选择解析器来讲ajax请求解析为json请求
		@RequestMapping("/listRoles")
		
		public PageInfo<TRole> listRoles(@RequestParam(value="condition" , defaultValue="" , required=false)String condition , @RequestParam(value="pageNum" , defaultValue = "1"  , required = false)Integer pageNum  ) {
			//开启分页查询功能
			PageHelper.startPage(pageNum, AppConsts.PAGE_SIZE);
			List<TRole> roles = roleService.listRoles(condition);
			//获取PageInfo的内容
			 PageInfo<TRole> pageInfo = new PageInfo<TRole>(roles , AppConsts.NAV_SIZE);
			//springmvc可以自动将ajax请求转化为json字符串
			return pageInfo;
		}
		@RequestMapping("/deleteRole")
		@ResponseBody
		public String deleteRole(Integer id) {
			roleService.deleteRole(id);
			return "ok";
			
		}
		//处理添加角色的请求
		@RequestMapping("/saveRole")
		@ResponseBody
		public String saveRole(TRole role) {
			roleService.saveRole(role);
			return "ok";
			
		}
		//处理修改的请求
		@ResponseBody
		@RequestMapping("/getRole")
		
		public TRole getRole(Integer id ) {
			
			TRole role = roleService.getRoleById(id);
			return role;
		}
		
		//处理修改的请求
		@ResponseBody
		@RequestMapping("/updateRole")
		
		public String updateRole(TRole role) {
			
			roleService.updateRole(role);
			return "ok";
		}
				
	

}
