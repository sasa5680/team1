package com.team1.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;

@Controller
@RequestMapping("/news")
public class NewsController {

	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/list", params = { "location", "query" })
	public void life(@RequestParam(value = "location") String location, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("news", model);
		
		model.addAttribute("tag", "news");
		model.addAttribute("location", location);
		
	}
	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/list", params = { "location"})
	public void life(@RequestParam(value = "location") String location,Model model) {

		Cover.setCover("news", model);

		model.addAttribute("tag", "news");
		model.addAttribute("location", location);
	}
	
}