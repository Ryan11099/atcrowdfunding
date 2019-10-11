package com.atguigu.atcrowdfunding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.TMenu;
import com.atguigu.atcrowdfunding.service.TMenuService;

@Controller
public class TMenuController {
	@Autowired
	TMenuService menuService;
	
	//处理修改菜单的异步请求
		@ResponseBody
		@RequestMapping("/menu/updateMenu")
		public String updateMenu(TMenu menu) {
			menuService.updateMenu(menu);
			return "ok";
		}
	//处理查询菜单的异步请求
		@ResponseBody
		@RequestMapping("/menu/getMenu")
		public TMenu getMenu(Integer id) {
			TMenu menu = menuService.getMenu(id);
			return menu;
		}
	
	
	//添加指定菜单
	@ResponseBody
	@RequestMapping("/menu/saveMenu")
	public String saveMenu(TMenu menu) {
		menuService.saveMenu(menu);//menu里面有各种相应的对象icon，，pid，，name
		return "ok";
	}
	
	//删除指定菜单
	@ResponseBody
	@RequestMapping("/menu/deleteMenu")
	public String deleteMenu(Integer id) {
		menuService.deleteMenu(id);
		return "ok";
	}
	
	//查询所有菜单
	
	@PreAuthorize("hasAnyRole('PM - 项目经理112233')")//只有项目经理能够干这个事
	@ResponseBody
	@RequestMapping("/menu/listMenus")
	public List<TMenu> listMenus() {
		//调用Service的业务层来处理方法
		List<TMenu> menus = menuService.ListMenus();
		System.out.println(menus);
		return menus;
		
	}
	
	@RequestMapping("/menu/index.html")
	public String toMenuPage() {
		return "menu/menu";
	}
}
