package com.recruit.service;

import com.recruit.mapper.EnterprisesInfoMapper;


import lombok.Setter;

public class EnterprisesInfoServiceImpl implements EnterprisesInfoService{
	
	@Setter
	private EnterprisesInfoMapper enterprisesInfoMapper;
}
