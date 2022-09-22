package com.kmj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmj.dao.IF_Country_Dao;
import com.kmj.vo.Country_Vo;

@Service
public class IF_Country_Service_Impl implements IF_Country_Service {
	@Inject
	IF_Country_Dao country_dao;
	

	@Override
	public List<Country_Vo> country() throws Exception {
		// TODO Auto-generated method stub
		return country_dao.country();
	}


	@Override
	public List<Country_Vo> city(String city) throws Exception {
		// TODO Auto-generated method stub
		return country_dao.city(city);
	}


	@Override
	public List<Country_Vo> city_search_vo() throws Exception {
		// TODO Auto-generated method stub
		return country_dao.city_search_vo();
	}

}
