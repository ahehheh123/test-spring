package com.kmj.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmj.dao.IF_Grid_Dao;
import com.kmj.vo.Grid_Vo;
import com.kmj.vo.PageVo;

@Service
public class IF_Grid_Service_Impl implements IF_Grid_Service {
	@Inject
	IF_Grid_Dao grid_dao;

	@Override
	public void save(Grid_Vo gvo) throws Exception {
		
		grid_dao.save(gvo);
		
	}

	@Override
	public List<Grid_Vo> search(Grid_Vo gvo, List<String> cityArray, PageVo pvo) throws Exception {
		
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
	public List<Grid_Vo> search_all() throws Exception {
		// TODO Auto-generated method stub

		return grid_dao.search_all();
	}

	@Override
	public void del(String del) throws Exception {
		// TODO Auto-generated method stub
		grid_dao.del(del);
	}

	@Override
	public void mod(Grid_Vo gvo) throws Exception {
		// TODO Auto-generated method stub
		grid_dao.mod(gvo);
	}

	@Override
	public List<Grid_Vo> mod_table(String mod) throws Exception {
		// TODO Auto-generated method stub
		return grid_dao.mod_table(mod);
	}

	@Override
	public List<Grid_Vo> selectList(PageVo pvo) throws Exception {
		// TODO Auto-generated method stub
		return grid_dao.selectList(pvo);
	}





	
	
	

}
