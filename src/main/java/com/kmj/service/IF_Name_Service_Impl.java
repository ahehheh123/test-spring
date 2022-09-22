package com.kmj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmj.dao.IF_Name_Dao;
import com.kmj.vo.Name_Vo;

@Service
public class IF_Name_Service_Impl implements IF_Name_Service {

	@Inject
	IF_Name_Dao name_dao;
	
	
	
	@Override
	public void save(Name_Vo nvo) throws Exception {
		// TODO Auto-generated method stub
		name_dao.save(nvo);
	}



	@Override
	public List<Name_Vo> search(String name) throws Exception {
		// TODO Auto-generated method stub
		return name_dao.search(name);
	}



	@Override
	public List<Name_Vo> searchName(String city) throws Exception {
		// TODO Auto-generated method stub
		return name_dao.searchName(city);
	}

	
	
	
	
}
