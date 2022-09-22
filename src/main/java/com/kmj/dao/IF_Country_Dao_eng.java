package com.kmj.dao;

import java.util.List;

import com.kmj.vo.Country_Vo_eng;

public interface IF_Country_Dao_eng {
	public List<Country_Vo_eng> country() throws Exception;
	public List<Country_Vo_eng> city_search_vo() throws Exception;
	public List<Country_Vo_eng> city(String city) throws Exception;
}
