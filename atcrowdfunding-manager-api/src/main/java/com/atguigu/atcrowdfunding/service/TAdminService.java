package com.atguigu.atcrowdfunding.service;

import java.util.ArrayList;
import java.util.List;

import com.atguigu.atcrowdfunding.bean.TAdmin;

public interface TAdminService {

	TAdmin doLogin(String loginacct, String userpswd);

	List<TAdmin> listAdmins(String condition);

	void deleteAdminById(Integer id);

	void saveAdmin(TAdmin admin);

	TAdmin getAdminById(Integer id);

	void updateAdminById(TAdmin admin);

	void deleteAdmins(ArrayList<Integer> list);

	List<Integer> listAdminRoleIds(Integer id);

	void assignRoleToAdmin(Integer adminId, List<Integer> roleId);

	void unAssignRoleToAdmin(Integer adminId, List<Integer> roleId);



	
	
}
