package com.kmj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmj.vo.Name_Vo;

@Repository
public class IF_Name_Dao_Impl implements IF_Name_Dao {

	private static String mapperQuery  ="com.kmj.dao.IF_Name_Dao";

	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public void save(Name_Vo nvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".save", nvo);
	}


	@Override
	public List<Name_Vo> search(String name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search", name);
	}


	@Override
	public List<Name_Vo> searchName(String city) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".searchName", city);
	}
	
	
	
	
	
	
}
