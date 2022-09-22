package com.kmj.service;

import java.util.List;
import java.util.Map;

import com.kmj.vo.Grid_Vo_eng;
import com.kmj.vo.PageVo_eng;

public interface IF_Grid_Service_eng {
	
	public String save(Grid_Vo_eng gvo, List<String> cityArray) throws Exception;
	public List<Grid_Vo_eng> search(Grid_Vo_eng gvo, List<String> cityArray, PageVo_eng pvo) throws Exception;
	public List<Grid_Vo_eng> search_all() throws Exception;
	public void del(String del) throws Exception;
	public void mod(Grid_Vo_eng gvo) throws Exception;
	public List<Grid_Vo_eng> mod_table(String mod) throws Exception;
	public List<Grid_Vo_eng> selectList(PageVo_eng pvo) throws Exception;
}
