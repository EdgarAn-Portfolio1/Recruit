package com.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;
import com.recruit.vo.GroupByWorkplaceVO;
import com.recruit.vo.IncomeAndWelfareVO;
import com.recruit.vo.LikeVO;
import com.recruit.vo.NewsVO;
import com.recruit.vo.WorkTypeVO;

@Mapper
public interface EnterprisesMapper {

	List<EnterprisesVO> selectEnterprises(HashMap<String, Object> params);

	EnterprisesVO selectEnterprisesLink(int recruit_num);

	List<NewsVO> selectNews(String companyName);

	// 좋아요

	//int selectLikeCount(HashMap<String, Object> params);
	int selectLikeCount(LikeVO like);

	void like_register(LikeVO like);

	void like_delete(LikeVO like);

	int selectLikeAllCount(int recruit_num);

	// 즐겨찾기

	void bookmark_register(BookMarkVO bookmark);

	void bookmark_delete(BookMarkVO bookmark);

	int selectBookmarkAllCount(int recruit_num);

	int selectBookmarkCount(BookMarkVO bookmark);

	// int selectBookmarkVoteCountByRecruitNum(HashMap<String, Object> params);

	// 지역별 취업공고 차트

	List<GroupByWorkplaceVO> selectRecruitCountByWorkplace(HashMap<String, Object> param);

	List<HashMap<String, Object>> selectRecruitCountByDegree();

	List<WorkTypeVO> selectRecruitCountByWorkType();

	List<IncomeAndWelfareVO> selectIncomeComparison();

	

}
