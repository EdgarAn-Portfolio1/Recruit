package com.recruit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recruit.service.EnterprisesService;

import com.recruit.vo.AccountVO;
import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;
import com.recruit.vo.GroupByWorkplaceVO;
import com.recruit.vo.IncomeAndWelfareVO;
import com.recruit.vo.LikeVO;
import com.recruit.vo.NewsVO;
import com.recruit.vo.WorkTypeVO;

@Controller
@RequestMapping(path = { "/enterprises" })
public class EnterprisesController {

	@Autowired
	@Qualifier("enterprisesService")
	private EnterprisesService enterprisesService;

	@GetMapping(path = { "/integrated_search" })
	public String integrated_search(@RequestParam(defaultValue = "0") int category, Model model) {

		setOptions(model);
		model.addAttribute("search_category", category);

		return "enterprises/integrated_search";

	}

	@GetMapping(path = { "/searchEnterprisesList" })
	public String searchEnterprisesList(@RequestParam(defaultValue = "0") int category, String duty, String career,
			String degree, String work_place, Model model) {

		// 조회한 후에도 옵션은 표시되어야 하므로 옵션 다시 설정
		setOptions(model);
		model.addAttribute("search_category", category);
		// 조회 관련 데이터 코드
		HashMap<String, Object> params = new HashMap<>();

		if (career != null && !career.equals("")) {
			params.put("career", career);
			model.addAttribute("career", career);
		}
		if (degree != null && !degree.equals("")) {
			params.put("degree", degree);
			model.addAttribute("degree", degree);
		}
		if (work_place != null && !work_place.equals("")) {
			params.put("work_place", work_place);
			model.addAttribute("work_place", work_place);
		}
//			if (duty != null) {
//				params.put("duty", duty);
//				model.addAttribute("duty", duty);
//			}

		List<EnterprisesVO> EnterprisesList = enterprisesService.selectEnterprises(params);
		model.addAttribute("enterprisesList", EnterprisesList);

		return "enterprises/integrated_search";
	}

	@GetMapping(path = { "/enterprisesInformation" })

	public String enterprisesInformation(@RequestParam(defaultValue = "0") int recruit_num, Model model) {

		if (recruit_num == 0) {
			return "redirect:integrated_search";
		}

		// recruit_num을 사용해서 데이터 조회하는 구문 작성
		EnterprisesVO enterprisesLink = enterprisesService.selectEnterprisesLink(recruit_num);
		if (enterprisesLink == null) {
			return "redirect:integrated_search";
		}

		model.addAttribute("enterprisesLink", enterprisesLink);
		System.out.println(recruit_num);

		// News 데이터 조회
		List<NewsVO> news = enterprisesService.selectNews(enterprisesLink.getCompany_name());
		model.addAttribute("news", news);

	// Like 데이터 조회

		
	  int LikeAllCount = enterprisesService.selectLikeAllCount(recruit_num);
	  model.addAttribute("LikeAllCount", LikeAllCount);
	 

	// Bookmark 데이터 조회
	
	  int BookmarkAllCount =  enterprisesService.selectBookmarkAllCount(recruit_num);
	  model.addAttribute("BookmarkAllCount", BookmarkAllCount);
		 

		return "enterprises/enterprisesInfo";

	}

	@PostMapping(path = { "saveLike" })

	@ResponseBody // return을 jsp가 아니라 그대로 내보냄
	public String LikeRegister(LikeVO like, Model model) {

		int LikeCount = enterprisesService.selectLikeCount(like);
		
		String result  = "";
		if (LikeCount == 0) {
			enterprisesService.like_register(like);
			result = "register";
		} else {
			enterprisesService.like_delete(like);
			result = "delete";

		}
		
		int LikeAllCount = enterprisesService.selectLikeAllCount(like.getRecruit_num());
		return result + ";" + LikeAllCount;
	}

	@PostMapping(path = { "saveBookmark" })

	@ResponseBody // return을 jsp가 아니라 그대로 내보냄
	public String BookmarkRegister(BookMarkVO bookmark,  Model model) {

		int BookmarkCount = enterprisesService.selectBookmarkCount(bookmark);
		
		String result  = "";
		
		if (BookmarkCount == 0) {
			enterprisesService.bookmark_register(bookmark);
			result = "register";
		} else {
			enterprisesService.bookmark_delete(bookmark);
			result ="delete";

		}
		int BookmarkAllCount = enterprisesService.selectBookmarkAllCount(bookmark.getRecruit_num());
		return result + ";" + BookmarkAllCount;

	}

	@GetMapping(path = { "/recruitChart" })
	public String recruitChart(@RequestParam(required = false) String work_place, Model model) {
		// 지역별 채용공고 차트
		HashMap<String, Object> param = new HashMap<>();
		param.put("work_place", work_place);
		
		List<HashMap<String, Object>> degree = enterprisesService.selectRecruitCountByDegree();

		List<GroupByWorkplaceVO> recruitCountByWorkplace = enterprisesService.selectRecruitCountByWorkplace(param);
		List<WorkTypeVO> recruitCountByWorkType = enterprisesService.selectRecruitCountByWorkType();
		List<IncomeAndWelfareVO> incomeComparison = enterprisesService.selectIncomeComparison();
		
		
		
		model.addAttribute("degree", degree);
		model.addAttribute("recruitCountByWorkType", recruitCountByWorkType);
		model.addAttribute("recruitCountByWorkplace", recruitCountByWorkplace);
		model.addAttribute("incomeComparison", incomeComparison);
		System.out.println(recruitCountByWorkplace);
		System.out.println(degree);
		System.out.println(recruitCountByWorkType);
		System.out.println(incomeComparison);
		
		return "enterprises/recruitChart";

	}

	private void setOptions(Model model) {
		// 경력 옵션
		ArrayList<String> careerOption = new ArrayList<String>();
		careerOption.add("신입");
		careerOption.add("경력");
		careerOption.add("무관");
		model.addAttribute("careerOption", careerOption);

		// 학력 옵션
		ArrayList<String> degreeOption = new ArrayList<String>();
		degreeOption.add("고등학교 졸업");
		degreeOption.add("대학졸업(2,3년)");
		degreeOption.add("대학교졸업(4년)");
		degreeOption.add("대학원 석사졸업");
		degreeOption.add("대학원 박사졸업");
		degreeOption.add("그 외");
		model.addAttribute("degreeOption", degreeOption);

		// 지역 옵션
		ArrayList<String> work_placeOption = new ArrayList<String>();
		work_placeOption.add("서울");
		work_placeOption.add("인천");
		work_placeOption.add("세종");
		work_placeOption.add("충북");
		work_placeOption.add("전남");
		work_placeOption.add("대구");
		work_placeOption.add("대전");
		work_placeOption.add("부산");
		work_placeOption.add("제주");
		work_placeOption.add("경기");
		work_placeOption.add("충남");
		work_placeOption.add("경남");
		work_placeOption.add("광주");
		work_placeOption.add("전북");
		work_placeOption.add("경북");
		work_placeOption.add("울산");
		work_placeOption.add("강원");
		work_placeOption.add("해외");
		work_placeOption.add("전국");
		model.addAttribute("work_placeOption", work_placeOption);
	}

}
