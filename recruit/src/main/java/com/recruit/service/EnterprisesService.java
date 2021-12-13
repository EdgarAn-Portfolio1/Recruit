package com.recruit.service;

import java.util.HashMap;
import java.util.List;


import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;
import com.recruit.vo.GroupByWorkplaceVO;
import com.recruit.vo.IncomeAndWelfareVO;
import com.recruit.vo.LikeVO;
import com.recruit.vo.NewsVO;
import com.recruit.vo.WorkTypeVO;

public interface EnterprisesService {

	List<EnterprisesVO> selectEnterprises(HashMap<String, Object> params);

	EnterprisesVO  selectEnterprisesLink(int recruit_num);

	List<NewsVO> selectNews(String string);

	


	//등록에는 반환 값이 없습니다. (~Mappler.xml 파일과 비교 )
	
	// 좋아요
	void like_register(LikeVO like);
	
	void like_delete(LikeVO like);
	
	int selectLikeCount(LikeVO like);
	
	int selectLikeAllCount(int recruit_num);
	
	// 즐겨찾기

	void bookmark_register(BookMarkVO bookmark);

	void bookmark_delete(BookMarkVO bookmark);

	int selectBookmarkCount(BookMarkVO bookmark);
	
	int selectBookmarkAllCount(int recruit_num);


	
	// EDA 차트
	List<GroupByWorkplaceVO> selectRecruitCountByWorkplace(HashMap<String, Object> param);

	List<HashMap<String, Object>> selectRecruitCountByDegree();

	List<WorkTypeVO> selectRecruitCountByWorkType();

	List<IncomeAndWelfareVO> selectIncomeComparison();

	

	

	

	



	

	

	

	
	

	

	

	

	

	

	

	

	

	


}
