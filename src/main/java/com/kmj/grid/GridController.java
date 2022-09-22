package com.kmj.grid;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmj.service.IF_Country_Service;
import com.kmj.service.IF_Grid_Service;
import com.kmj.service.IF_Name_Service;
import com.kmj.vo.Country_Vo;
import com.kmj.vo.Grid_Vo;
import com.kmj.vo.PageVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class GridController {
	@Inject
	IF_Grid_Service grid_service;
	@Inject
	IF_Country_Service country_service;
	@Inject
	IF_Name_Service name_service;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	@ResponseBody
	public List<Grid_Vo> all(Locale locale, Model model) throws Exception {
		
		List<Grid_Vo> grid_vo = grid_service.search_all();
		
		return grid_vo;
	}
	
	@RequestMapping(value = "/save", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String save(Locale locale, Model model, Grid_Vo gvo, @RequestParam(value="cityArray[]") List<String> cityArray) throws Exception {
		
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
		grid_service.save(gvo);
		
		return city;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> search(Locale locale, Model model, Grid_Vo gvo, PageVo pvo, @RequestParam(value="cityArray[]") List<String> cityArray) throws Exception {
		
		/*
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
		int totalSize = grid_service.selectCnt();
		System.out.println(totalSize+"건을 가져왔습니다.");	
		gvo.setTotalCount(totalSize);
		List<Grid_Vo> grid_vo = grid_service.search(gvo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grid_vo", grid_vo);
		*/
		System.out.println(pvo.getPage());
		List<Map<String, Object>> listMap  = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
				
		map1.put("search", grid_service.search(gvo, cityArray, pvo));
		map2.put("gvo", gvo);
		listMap.add(map1);
		listMap.add(map2);
		return listMap;	
	}
	
	/*
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> search(Locale locale, Model model, Grid_Vo gvo, PageVo pvo, @RequestParam(value="cityArray[]") List<String> cityArray) throws Exception {
		
		if(gvo.getRadio()==null) {
			gvo.setRadio("");
		}
		int cnt=0;
		if(gvo.getName()!="") {
			cnt++;
		}
		if(gvo.getPurpose()!="") {
			cnt++;
		}
		if(gvo.getRadio()!="") {
			cnt++;
		}
		if(gvo.getCountry()!="") {
			cnt++;
		}
		if(cityArray.size()!=0) {
			cnt++;
		}
		if(cnt==0) {			//전체조회
			if(pvo.getPage() == null) {
				pvo.setPage(1);
			}
			pvo.setPerPageNum(5);
			int totalSize = grid_service.selectCnt();
			System.out.println(totalSize+"건을 가져왔습니다.");	
			pvo.setTotalCount(totalSize);			
			List<Grid_Vo> grid_vo = grid_service.selectList(pvo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("grid_vo", grid_vo);
			map.put("pvo", pvo);
			return map;	
	
		}
		return null;
	}
	*/	
			
			
			
		/*}else {			
			if(cityArray.size()==0) {			//도시선택x					
				List<Grid_Vo> grid_vo2 = grid_service.search(gvo);
				List<Grid_Vo> grid_vo = new ArrayList<Grid_Vo>();	
				for(int i=0; i<grid_vo2.size(); i++) {
					int cnt2=0;
					if(grid_vo2.get(i).getName().equals(gvo.getName())) {				
						cnt2++;				
					}
					if(grid_vo2.get(i).getPurpose().equals(gvo.getPurpose())) {				
						cnt2++;				
					}
					if(grid_vo2.get(i).getRadio().equals(gvo.getRadio())) {				
						cnt2++;				
					}
					if(grid_vo2.get(i).getCountry().equals(gvo.getCountry())) {				
						cnt2++;				
					}					
					if(cnt==cnt2) {												
						grid_vo.add(grid_vo2.get(i));
					}					
				}
				return grid_vo;	
			}else {				//도시선택만
				List<Grid_Vo> grid_vo4 = grid_service.search(gvo);
				if(grid_vo4.size()==0) {
					List<Grid_Vo> grid_vo_all = grid_service.search_all();
					List<Grid_Vo> grid_vo = new ArrayList<Grid_Vo>();
					for(int i=0; i<grid_vo_all.size(); i++) {	
						String replaceCity = grid_vo_all.get(i).getCity().replaceAll("\"", "");
						String[] city = replaceCity.split(",");
						if(city.length==cityArray.size()-1) {
							int cnt_city = 0;
							for(int k=0; k<city.length; k++) {	
								for(int l=1; l<cityArray.size(); l++) {
									if(city[k].equals(cityArray.get(l))){
										cnt_city++;
									}
								}
							}
							if(cnt_city==city.length) {
								grid_vo.add(grid_vo_all.get(i));
							}
						}
					}
					return grid_vo;				
				}else {				//	
					List<Grid_Vo> grid_vo2 = new ArrayList<Grid_Vo>();	
					for(int i=0; i<grid_vo4.size(); i++) {
						int cnt2=0;
						if(grid_vo4.get(i).getName().equals(gvo.getName())) {				
							cnt2++;				
						}
						if(grid_vo4.get(i).getPurpose().equals(gvo.getPurpose())) {				
							cnt2++;				
						}
						if(grid_vo4.get(i).getRadio().equals(gvo.getRadio())) {				
							cnt2++;				
						}
						if(grid_vo4.get(i).getCountry().equals(gvo.getCountry())) {				
							cnt2++;				
						}					
						if(cnt-1==cnt2) {												
							grid_vo2.add(grid_vo4.get(i));
						}					
					}
					List<Grid_Vo> grid_vo = new ArrayList<Grid_Vo>();
					for(int i=0; i<grid_vo2.size(); i++) {	
						String replaceCity = grid_vo2.get(i).getCity().replaceAll("\"", "");
						String[] city = replaceCity.split(",");
						if(city.length==cityArray.size()-1) {
							int cnt_city = 0;
							for(int k=0; k<city.length; k++) {	
								for(int l=1; l<cityArray.size(); l++) {
									if(city[k].equals(cityArray.get(l))){
										cnt_city++;
									}
								}
							}
							if(cnt_city==city.length) {
								grid_vo.add(grid_vo2.get(i));
							}
						}
					}
					return grid_vo;	
				}				
			}
		}	
	}*/
	
	@RequestMapping(value = "/city_search", method = RequestMethod.GET)
	@ResponseBody
	public List<Country_Vo> city_search(Locale locale, Model model, Country_Vo cvo) throws Exception {
		
		List<Country_Vo> city_search = country_service.city(cvo.getCountry());
		
		return city_search;
	}
	
	@RequestMapping(value = "/city", method = RequestMethod.GET)
	@ResponseBody
	public List<Country_Vo> city(Locale locale, Model model, Country_Vo cvo) throws Exception {
				
		List<Country_Vo> city = country_service.city(cvo.getCountry());
		
		
		return city;
	}
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public String del(Locale locale, Model model, @RequestParam(value="del_name[]") List<String> del_name) throws Exception {
		
		for(int i=0; i<del_name.size(); i++) {
			grid_service.del(del_name.get(i));			
		}
		
		

		return "home_kor";
	}
	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	@ResponseBody
	public String mod(Locale locale, Model model, Grid_Vo gvo) throws Exception {
		
		grid_service.mod(gvo);
		
		return "home_kor";
	}
	@RequestMapping(value = "/excel", method = RequestMethod.GET)
	public void excel(Locale locale, Model model, HttpServletResponse response) throws Exception {
		
		List<Grid_Vo> grid_vo = grid_service.search_all();
		
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("아이디");
        cell = row.createCell(1);
        cell.setCellValue("목적");
        cell = row.createCell(2);
        cell.setCellValue("라디오");
        cell = row.createCell(3);
        cell.setCellValue("국가");
        cell = row.createCell(4);
        cell.setCellValue("도시");

        // Body
        for (int i=0; i<grid_vo.size(); i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(grid_vo.get(i).getName());
            cell = row.createCell(1);
            cell.setCellValue(grid_vo.get(i).getPurpose());
            cell = row.createCell(2);
            cell.setCellValue(grid_vo.get(i).getRadio());
            cell = row.createCell(3);
            cell.setCellValue(grid_vo.get(i).getCountry());
            cell = row.createCell(4);
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();		
	}	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public String add(Locale locale, Model model) throws Exception {		
		
		return "home_kor";
	}
	
	@RequestMapping(value = "/user_pop_up", method = RequestMethod.GET)

	public String user_pop_up(Locale locale, Model model) throws Exception {		
		
		List<Country_Vo> cvo = country_service.country();
		model.addAttribute("cvo",cvo);
		
		List<Country_Vo> city_vo = country_service.city(cvo.get(0).getCountry());
		model.addAttribute("city_vo",city_vo);
		
		
		
		return "user_pop_up";
	}
	
	@RequestMapping(value = "/mod_table", method = RequestMethod.GET)
	@ResponseBody
	public List<Grid_Vo> mod_table(Locale locale, Model model, Grid_Vo gvo) throws Exception {		
		
			List<Grid_Vo> mod_table = grid_service.mod_table(gvo.getName());
		
		return mod_table;
	}
	
	@RequestMapping(value = "/link", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	public String link(Locale locale, Model model) throws Exception {
		
		List<Grid_Vo> grid_vo = grid_service.search_all();
		model.addAttribute("grid_vo", grid_vo);
		
		return "link";
	}
	
	@RequestMapping(value = "/home_eng", method = RequestMethod.GET)
	public String home_eng(Locale locale, Model model) throws Exception {		

		return "home_eng";
	}
	
	
}
