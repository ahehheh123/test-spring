package com.kmj.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmj.vo.Grid_Vo;
import com.kmj.vo.PageVo;

@Repository
public class IF_Grid_Dao_Impl implements IF_Grid_Dao {

	private static String mapperQuery  ="com.kmj.dao.IF_Grid_Dao";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public void save(Grid_Vo gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".save", gvo);
	}


	@Override
	public List<Grid_Vo> search(Grid_Vo gvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search", gvo);
	}
	
	@Override
	public List<Grid_Vo> search_all() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search_all");
	}


	@Override
	public void del(String del) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".del", del);
	}


	@Override
	public void mod(Grid_Vo gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".mod", gvo);
	}


	@Override
	public List<Grid_Vo> mod_table(String mod) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".mod_table", mod);
	}


	@Override
	public int selectCnt(Grid_Vo gvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectCnt", gvo);
	}


	@Override
	public List<Grid_Vo> selectList(PageVo pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectList", pvo);
	}

}
