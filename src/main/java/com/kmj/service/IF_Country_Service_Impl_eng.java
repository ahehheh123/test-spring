package com.kmj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmj.dao.IF_Country_Dao_eng;
import com.kmj.vo.Country_Vo_eng;

@Service
public class IF_Country_Service_Impl_eng implements IF_Country_Service_eng {
	@Inject
	IF_Country_Dao_eng country_dao;
	

	@Override
	public List<Country_Vo_eng> country() throws Exception {
		// TODO Auto-generated method stub
		return country_dao.country();
	}


	@Override
	public List<Country_Vo_eng> city(String city) throws Exception {
		// TODO Auto-generated method stub
		return country_dao.city(city);
	}


	@Override
	public List<Country_Vo_eng> city_search_vo() throws Exception {
		// TODO Auto-generated method stub
		return country_dao.city_search_vo();
	}

}
