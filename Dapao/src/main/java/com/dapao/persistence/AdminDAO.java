package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;

public interface AdminDAO {
	
	// 사업자 정보 리스트
	public List<EntVO> ownerList() throws  Exception;
	
	// 회원관리 - 모든유저정보 출력
	public List<UserVO> getAllUser() throws Exception;
	
	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception;
	
	// 회원관리 - 회원정지부여
	public int userStop(UserVO vo) throws Exception;
	
	// 회원관리 - 회원정지(회원상태변경 0->1)
	public void userStateUpdate(String us_id) throws Exception;
	
	// 회원관리 - 회원탈퇴(회원상태변경 0->2)
	public int userDelete(String us_id) throws Exception;
	
	// 회원관리 - 페이징 처리 후 회원 수 조회
	public List<UserVO> getUserList(Criteria cri) throws Exception;
	
	// 회원관리 - 전체회원수 조회
	public int getUserCount() throws Exception;

	
	// 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception;
	
	// 사업자 탈퇴
	public void ownerInfoDelete(String own_id) throws Exception;
	
	// FAQ 리스트
	public List<CsVO> FAQList() throws Exception;
	
	// FAQ 1개정보 출력
	public CsVO FAQInfo(Integer cs_no) throws Exception;
	
	//FAQ 글쓰기
	public void FAQWrite() throws Exception;
	
	// FAQ 정보 수정
	public int FAQInfoUpdate(CsVO vo) throws Exception;
}
