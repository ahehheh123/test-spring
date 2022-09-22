package com.kmj.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmj.dao.IF_Grid_Dao_eng;
import com.kmj.vo.Grid_Vo_eng;
import com.kmj.vo.PageVo_eng;

@Service
public class IF_Grid_Service_Impl_eng implements IF_Grid_Service_eng {
	@Inject
	IF_Grid_Dao_eng grid_dao;

	@Override
	public String save(Grid_Vo_eng gvo, List<String> cityArray) throws Exception {
		
		try {	
			String city = "";
			for(int i=0; i<cityArray.size(); i++) {			
				if(i==cityArray.size()-1) {				
					city = city + cityArray.get(i);				
				}else {					
					city = city + cityArray.get(i)+",";				
				}	
			}
			city = "\""+city+"\"";
			gvo.setCity(city);					
			grid_dao.save(gvo);			
			return city;			
		}catch(Exception e) {			
			return "home";
		}	
	}

	@Override
	public List<Grid_Vo_eng> search(Grid_Vo_eng gvo, List<String> cityArray, PageVo_eng pvo) throws Exception {
		
		if(cityArray.size()!=0) {
			String city = "";
			for(int i=1; i<cityArray.size(); i++) {			
				if(i==cityArray.size()-1) {				
					city = city + cityArray.get(i);				
				}else {					
					city = city + cityArray.get(i)+",";				
				}	
			}
			city = "\""+city+"\"";
			gvo.setCity(city);	
		}
		if(gvo.getPage() == null) {
			gvo.setPage(1);
		}
		gvo.setPerPageNum(5);
		int totalSize = grid_dao.selectCnt(gvo);
		System.out.println(totalSize+"건을 가져왔습니다.");	
		gvo.setTotalCount(totalSize);
		System.out.println(gvo.getStartPage());
		System.out.println(gvo.getEndPage());
		
		return grid_dao.search(gvo);
	}
	@Override
	public List<Grid_Vo_eng> search_all() throws Exception {
		// TODO Auto-generated method stub

		return grid_dao.search_all();
	}

	@Override
	public void del(String del) throws Exception {
		// TODO Auto-generated method stub
		grid_dao.del(del);
	}

	@Override
	public void mod(Grid_Vo_eng gvo) throws Exception {
		// TODO Auto-generated method stub
		grid_dao.mod(gvo);
	}

	@Override
	public List<Grid_Vo_eng> mod_table(String mod) throws Exception {
		// TODO Auto-generated method stub
		return grid_dao.mod_table(mod);
	}

	@Override
	public List<Grid_Vo_eng> selectList(PageVo_eng pvo) throws Exception {
		// TODO Auto-generated method stub
		return grid_dao.selectList(pvo);
	}





	
	
	

}
