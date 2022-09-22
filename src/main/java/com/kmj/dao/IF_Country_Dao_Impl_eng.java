package com.kmj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmj.vo.Country_Vo_eng;
@Repository
public class IF_Country_Dao_Impl_eng implements IF_Country_Dao_eng{
	
	private static String mapperQuery  ="com.kmj.dao.IF_Country_Dao_eng";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<Country_Vo_eng> country() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".country");
		
	}


	@Override
	public List<Country_Vo_eng> city(String city) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".city", city);
	}


	@Override
	public List<Country_Vo_eng> city_search_vo() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".city_search_vo");
	}
}
