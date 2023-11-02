package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;

public interface AdminDAO {
	
	
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

	
	// 사업자 관리 - 사업자정보 리스트
	public List<EntVO> ownerList(Criteria cri) throws  Exception;
	
	// 사업자 관리 - 사업자 총개수 조회
	public int ownerCount(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 정지
	public int ownerStop(EntVO vo) throws Exception;
	
	// 사업자 관리 - 사업자 승인
	public int ownerApprove(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 탈퇴
	public int ownerInfoDelete(String own_id) throws Exception;
	
	// FAQ&공지 관리 - FAQ 리스트
	public List<CsVO> FAQList(Criteria cri) throws Exception;
	
	// FAQ&공지 관리 - cs 1개정보 출력
	public CsVO csInfo(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - FAQ 글쓰기
	public void FAQWrite(CsVO vo) throws Exception;
	
	// FAQ&공지 관리 - cs 정보 수정
	public int csInfoUpdate(CsVO vo) throws Exception;
	
	// FAQ&공지 관리 - FAQ 총 글개수 조회
	public int FAQCount() throws Exception;
	
	// FAQ&공지 관리 - FAQ 등록
	public int FAQUpload(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - FAQ 등록해제
	public int FAQRemove(Integer cs_no) throws Exception;
	
	// 리뷰관리 - 리뷰리스트
	public List<ReviewVO> reviewList(Criteria cri) throws  Exception;
	
	// 리뷰관리 - 리뷰 총 글개수 조회
	public int reviewCount(Integer rv_no) throws Exception;
	
	// 리뷰관리 - 리뷰 1개정보 출력
	public ReviewVO reviewInfo(Integer rv_no) throws Exception;
	
	// 리뷰관리 - 리뷰 삭제
	public int reviewDelete(Integer rv_no) throws Exception;
}
