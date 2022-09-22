package com.kmj.grid;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmj.service.IF_Country_Service;
import com.kmj.service.IF_Country_Service_eng;
import com.kmj.vo.Country_Vo;
import com.kmj.vo.Country_Vo_eng;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	IF_Country_Service country_service;
	
	@Inject
	IF_Country_Service_eng country_service_eng;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		List<Country_Vo> cvo = country_service.country();
		model.addAttribute("cvo",cvo);
		
		List<Country_Vo_eng> cvo_eng = country_service_eng.country();
		model.addAttribute("cvo_eng",cvo_eng);
		
		List<Country_Vo> city_search_vo = country_service.city_search_vo();
		model.addAttribute("city_search_vo",city_search_vo);
		
		List<Country_Vo_eng> city_search_vo_eng = country_service_eng.city_search_vo();
		model.addAttribute("city_search_vo_eng",city_search_vo_eng);
		
		List<Country_Vo> city_vo = country_service.city(cvo.get(0).getCountry());
		model.addAttribute("city_vo",city_vo);
		
		List<Country_Vo_eng> city_vo_eng = country_service_eng.city(cvo.get(0).getCountry());
		model.addAttribute("city_vo_eng",city_vo_eng);
		
		return "home_kor";
	}
	

}
