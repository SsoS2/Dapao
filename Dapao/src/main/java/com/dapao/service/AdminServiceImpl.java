package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.Criteria;
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
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("service : userInfo(String us_id) 호출 ");
		return adao.userInfo(us_id);
	}
	
	@Override
	public int userStop(UserVO vo) throws Exception {
		logger.debug("service : userStop(UserVO vo) 호출 ");
		return adao.userStop(vo);
	}
	
	@Override
	public void userStateUpdate(String us_id) throws Exception {
		logger.debug("service : userStateUpdate(String us_id) 호출");
		adao.userStateUpdate(us_id);
	}
	
	@Override
	public int userDelete(String us_id) throws Exception {
		logger.debug("service : userDelete(String us_id) 호출");
		return adao.userDelete(us_id);
	}
	
	@Override
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return adao.getUserList(cri);
	}
	
	@Override
	public int getUserCount() throws Exception {
		return adao.getUserCount();
	}
	
	@Override
	public List<EntVO> ownerList(Criteria cri) throws Exception{
		logger.debug("service : ownerList() 호출");
		return adao.ownerList(cri);
	}

	
	@Override
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("service : ownerInfo(String own_id) 호출 ");
		return adao.ownerInfo(own_id);
	}
  
  	@Override
	public int ownerCount(String own_id) throws Exception {
		logger.debug("service : ownerCount() 호출 ");
		return adao.ownerCount(own_id);
	}
  	
  	@Override
  	public int ownerStop(EntVO vo) throws Exception {
  		logger.debug("service : ownerStop(EntVO vo) 호출 ");
  		return adao.ownerStop(vo);
  	}
	
	@Override
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("service : ownerApprove(String own_id) 호출");
		return adao.ownerApprove(own_id);
	}
	
	@Override
	public int ownerInfoDelete(String own_id) throws Exception {
		logger.debug("service : ownerInfoDelete(String own_id) 호출");
		return adao.ownerInfoDelete(own_id);
	}
	
	@Override
	public List<CsVO> FAQList(Criteria cri) throws Exception {
		logger.debug("service : FAQList() 호출");
		return adao.FAQList(cri);
	}
	
	@Override
	public CsVO csInfo(Integer cs_no) throws Exception {
		logger.debug("service : csInfo(Integer cs_no) 호출");
		return adao.csInfo(cs_no);
	}
	
	@Override
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("service : FAQWrite() 호출");
		adao.FAQWrite(vo);
	}
	
	@Override
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("service : csInfoUpdate(CsVO vo) 호출");
		return adao.csInfoUpdate(vo);
	}
	
	@Override
	public int FAQCount() throws Exception {
		logger.debug("service : FAQCount() 호출");
		return adao.FAQCount();
	}
	
	@Override
	public int noticeCount() throws Exception {
		logger.debug("service : noticeCount() 호출");
		return adao.noticeCount();
	}
	
	@Override
	public List<CsVO> noticeList(Criteria cri) throws Exception {
		logger.debug("service : noticeList() 호출");
		return adao.noticeList(cri);
	}
	
	@Override
	public int csUpload(Integer cs_no) throws Exception {
		logger.debug("service : csUpload(Integer cs_no) 호출");
		return adao.csUpload(cs_no);
	}
	
	@Override
	public int csRemove(Integer cs_no) throws Exception {
		logger.debug("service : csRemove(Integer cs_no) 호출");
		return adao.csRemove(cs_no);
	}
	
	@Override
	public void noticeWrite(CsVO vo) throws Exception {
		logger.debug("service : noticeWrite(CsVO vo) 호출");
		adao.noticeWrite(vo);
	}
	
	@Override
	public int csDelete(Integer cs_no) throws Exception {
		logger.debug("service : csDelete(Integer cs_no) 호출");
		return adao.csDelete(cs_no);
	}
	
}
