package com.recruit.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.EnterprisesInfoService;



@Controller
@RequestMapping(path= {"/enterprisesInfo"})
public class EnterpriseInfoController {

	
	@Autowired
	@Qualifier("enterprisesInfoService")
	private EnterprisesInfoService enterprisesInfoService;
	
	
		@GetMapping(path = { "/enterprisesInfo" })
		public String enterprisesInformantion() {
			
			return "enterprisesInfo/enterprisesInfo";

		}
}
