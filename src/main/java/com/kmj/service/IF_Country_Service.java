package com.kmj.service;

import java.util.List;

import com.kmj.vo.Country_Vo;

public interface IF_Country_Service {
	public List<Country_Vo> country() throws Exception;
	public List<Country_Vo> city_search_vo() throws Exception;
	public List<Country_Vo> city(String city) throws Exception;
	
}
