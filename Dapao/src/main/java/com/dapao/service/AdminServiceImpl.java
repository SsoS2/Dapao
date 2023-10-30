package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public List<EntVO> ownerList() throws Exception{
		logger.debug("service : ownerList() 호출");
		return adao.ownerList();
	}
	
	@Override
	public List<UserVO> getAllUser() throws Exception {
		logger.debug("컨트롤러의 호출로 Service호출");
		return adao.getAllUser();
	}
	
	@Override
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("컨트롤러의 호출로 Service호출");
		return adao.userInfo(us_id);
	}
	
	@Override
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("service : ownerInfo(String own_id) 호출 ");
		return adao.ownerInfo(own_id);
	}
	
	@Override
	public void ownerInfoUpdate(EntVO vo) throws Exception {
		logger.debug("service : ownerInfoUpdate(EntVO vo) 호출");
		adao.ownerInfoUpdate(vo);
	}
	
	@Override
	public void ownerInfoDelete(String own_id) throws Exception {
		logger.debug("service : ownerInfoDelete(String own_id) 호출");
		adao.ownerInfoDelete(own_id);
	}
	
	@Override
	public List<CsVO> FAQList() throws Exception {
		logger.debug("service : FAQList() 호출");
		return adao.FAQList();
	}
	
	@Override
	public CsVO FAQInfo(Integer cs_no) throws Exception {
		logger.debug("service : FAQInfo(Integer cs_no) 호출");
		return adao.FAQInfo(cs_no);
	}
	
	@Override
	public int userInfoUpdate(UserVO vo) throws Exception {
		logger.debug("컨트롤러의 호출로 Service호출");
		return adao.userInfoUpdate(vo);
	}
	
}
