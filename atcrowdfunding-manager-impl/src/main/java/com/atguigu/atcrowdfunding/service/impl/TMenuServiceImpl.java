package com.atguigu.atcrowdfunding.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.atcrowdfunding.bean.TMenu;
import com.atguigu.atcrowdfunding.mapper.TMenuMapper;
import com.atguigu.atcrowdfunding.service.TMenuService;
@Service
public class TMenuServiceImpl implements TMenuService {

	@Autowired
	TMenuMapper menuMapper;
	@Override
	public List<TMenu> ListMenus() {
		//查询所有的menu集合
		List<TMenu> menus = menuMapper.selectByExample(null);
		
		
		//挑出父菜单集合 
		//List<TMenu> pMenus = new ArrayList<TMenu>();
		Map<Integer,TMenu> pMenuMap = new HashMap<Integer,TMenu>();
		for(TMenu menu : menus) {
			if(menu.getPid()==0) {
				//menus.add(menu);
				pMenuMap.put(menu.getId(), menu);
			}
		}
		//返回封装完毕的父菜单集合
		for(TMenu menu : menus) {
			
			TMenu pMenu = pMenuMap.get(menu.getPid());
			if(pMenu != null) {
				pMenu.getChildren().add(menu);
			}
		}
		
		
		return new ArrayList<TMenu>(pMenuMap.values());
	}
	@Override
	public void deleteMenu(Integer id) {

		menuMapper.deleteByPrimaryKey(id);
	}
	@Override
	public void saveMenu(TMenu menu) {

		menuMapper.insertSelective(menu);
	}
	@Override
	public TMenu getMenu(Integer id) {

		
		return menuMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateMenu(TMenu menu) {
		//选择Selective的原因是更新的不是全部数据
		menuMapper.updateByPrimaryKeySelective(menu);
	}

}
