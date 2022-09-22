package com.kmj.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmj.vo.Grid_Vo_eng;
import com.kmj.vo.PageVo_eng;

@Repository
public class IF_Grid_Dao_Impl_eng implements IF_Grid_Dao_eng {

	private static String mapperQuery  ="com.kmj.dao.IF_Grid_Dao_eng";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public void save(Grid_Vo_eng gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".save", gvo);
	}


	@Override
	public List<Grid_Vo_eng> search(Grid_Vo_eng gvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search", gvo);
	}
	
	@Override
	public List<Grid_Vo_eng> search_all() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search_all");
	}


	@Override
	public void del(String del) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".del", del);
	}


	@Override
	public void mod(Grid_Vo_eng gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".mod", gvo);
	}


	@Override
	public List<Grid_Vo_eng> mod_table(String mod) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".mod_table", mod);
	}


	@Override
	public int selectCnt(Grid_Vo_eng gvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectCnt", gvo);
	}


	@Override
	public List<Grid_Vo_eng> selectList(PageVo_eng pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectList", pvo);
	}

}
