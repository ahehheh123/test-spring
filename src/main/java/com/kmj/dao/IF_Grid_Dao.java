package com.kmj.dao;

import java.util.List;
import java.util.Map;

import com.kmj.vo.Grid_Vo;
import com.kmj.vo.PageVo;

public interface IF_Grid_Dao {

	public void save(Grid_Vo gvo) throws Exception;
	public List<Grid_Vo> search(Grid_Vo gvo) throws Exception;
	public List<Grid_Vo> search_all() throws Exception;
	public void del(String del) throws Exception;
	public void mod(Grid_Vo gvo) throws Exception;
	public List<Grid_Vo> mod_table(String gvo) throws Exception;
	public int selectCnt(Grid_Vo gvo) throws Exception;
	public List<Grid_Vo> selectList(PageVo pvo) throws Exception;
}
