package com.recruit.service;


import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.EnterprisesMapper;
import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;
import com.recruit.vo.GroupByWorkplaceVO;

import com.recruit.vo.LikeVO;
import com.recruit.vo.NewsVO;
import com.recruit.vo.WorkTypeVO;

import lombok.Setter;

public class EnterprisesServiceImpl implements EnterprisesService{
	
	@Setter
	private EnterprisesMapper enterprisesMapper;

	@Override
	public List<EnterprisesVO> selectEnterprises(HashMap<String, Object> params) {
		
		
		return enterprisesMapper.selectEnterprises(params);
		
		
	}

	@Override
	public EnterprisesVO selectEnterprisesLink(int recruit_num) {
		EnterprisesVO enterprisesLink = enterprisesMapper.selectEnterprisesLink(recruit_num);
		return enterprisesLink;
	}

	@Override
	public List<NewsVO> selectNews(String company_name) {
		String modified_company_name = company_name.replace("(주)", "").replace("(유)", "").replace("㈜", "").trim();
		List<NewsVO> news = enterprisesMapper.selectNews( modified_company_name);
		return news;
	}
	
	  // 좋아요 count 조회
	  
	  @Override 
	  public int selectLikeCount(LikeVO like) { 
		  
		
		  return enterprisesMapper.selectLikeCount(like);
	  
	  
	  } // 좋아요 전체 카운팅
	  
	  @Override public int selectLikeAllCount(int recruit_num) { 
		  int LikeAllCount = enterprisesMapper.selectLikeAllCount(recruit_num); 
			return LikeAllCount;
		}
	  //  좋아요 등록
	  
	  @Override public void like_register(LikeVO like) {
	  enterprisesMapper.like_register(like);
	  
	  
	  }
	  
	  // 좋아요 삭제
	  
	  @Override public void like_delete(LikeVO like) {
	  enterprisesMapper.like_delete(like);
	  
	  }
	  
	  
	  
	  
	  
	  // 즐겨찾기 등록
	  
	  @Override public void bookmark_register(BookMarkVO bookmark) {
	  
	  enterprisesMapper.bookmark_register(bookmark); }
	  
	  
	  // 즐겨찾기 삭제
	  
	  @Override public void bookmark_delete(BookMarkVO bookmark) {
	  enterprisesMapper.bookmark_delete(bookmark);
	  
	  }
	  
	  
	  // 즐겨찾기 카운트 조회
	  
	  @Override public int selectBookmarkCount(BookMarkVO bookmark) {
	 
	  
	  return enterprisesMapper.selectBookmarkCount(bookmark);
	  
	  } 
	  // 즐겨찾기 전체 카운트
	  
	  @Override 
	  public int selectBookmarkAllCount(int recruit_num) { 
	  int BookmarkAllCount = enterprisesMapper.selectBookmarkAllCount(recruit_num);
	  return BookmarkAllCount; 
	  }
	 
	// 로그인한 사용자가 현재 구인 정보에 대해 즐겨찾기 투표를 했는지 조회
//	@Override
//	public int getBookmarkVoteCountByRecruitNum(int recruit_num) {
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		
//		params.put("recruit_num", recruit_num);
//		return enterprisesMapper.selectBookmarkVoteCountByRecruitNum(params);
//	}


	
	// 지역별 취업공고 차트
	@Override
	public List<GroupByWorkplaceVO> selectRecruitCountByWorkplace(HashMap<String, Object> param) {
		
		
		return enterprisesMapper.selectRecruitCountByWorkplace(param);
		
	}

	@Override
	public List<HashMap<String, Object>> selectRecruitCountByDegree() {
		
		List<HashMap<String, Object>> degree = enterprisesMapper.selectRecruitCountByDegree();
		return degree;
	}

	@Override
	public List<WorkTypeVO> selectRecruitCountByWorkType() {
		
		return enterprisesMapper.selectRecruitCountByWorkType();
	}



	
 
	



	

	

	
	

	

	



	


	

	

	
	

	


	


	
}
