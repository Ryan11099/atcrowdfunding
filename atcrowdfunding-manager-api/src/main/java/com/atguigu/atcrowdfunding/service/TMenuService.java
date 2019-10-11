package com.atguigu.atcrowdfunding.service;

import java.util.List;

import com.atguigu.atcrowdfunding.bean.TMenu;

public interface TMenuService {

	List<TMenu> ListMenus();

	void deleteMenu(Integer id);

	void saveMenu(TMenu menu);

	TMenu getMenu(Integer id);

	void updateMenu(TMenu menu);

	

}
