package com.kmj.service;


import java.util.List;

import com.kmj.vo.Name_Vo;

public interface IF_Name_Service {

	public void save(Name_Vo nvo) throws Exception;
	public List<Name_Vo> search(String name) throws Exception;
	public List<Name_Vo> searchName(String city) throws Exception;
	
	
}
