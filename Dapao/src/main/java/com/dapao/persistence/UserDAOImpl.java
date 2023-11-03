package com.dapao.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.AdVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.UserVO;


@Repository

public class UserDAOImpl implements UserDAO {
	
	

	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Inject
	private SqlSessionFactory sqlFactroy;
	
	@Inject
	private SqlSession sqlSession;
	
	//==> 디비연결정보 있음(연결 , 해제 자동)
	
	private static final String NAMESPACE
	= "com.dapao.mapper.UserMapper";
	
	
	// 현재시간 
	@Override
	public String getTime() {
		//디비연결
		SqlSession sqlSession 
		     = sqlFactroy.openSession();
		
		//SQL작성 & pstmt객체
		//SQL실행
		String time 
		 = sqlSession.selectOne("com.dapao.mapper.userMapper.getTime");
		
		return time;
	}

	
	// 메인
	// 인기가게(광고) 목록
	@Override
	public List<TotalVO> adList() {
		logger.debug("adList() 호출");
		
		return sqlSession.selectList(NAMESPACE + ".adList");
	}
	
	// 중고거래 글 목록 
	@Override
	public List<ItemVO> itemList() {
		logger.debug("itemList() 호출");
		
		return sqlSession.selectList(NAMESPACE + ".itemList");
	}
	
	// 찜 목록
	@Override
	public List<TotalVO> loveList(String us_id) {
		logger.debug("loveList(String us_id) 호출");
		
		return sqlSession.selectList(NAMESPACE + ".loveList",us_id);
	}
	
	// 회원가입
	@Override
	public void userJoin(UserVO joinVO) {
		// 디비연결-O		
		// SQL작성(Mapper)-O		
		//SQL실행(Mapper 호출)
		//sqlSession.insert(SQL구문);
		//sqlSession.insert(SQL구문,SQL전달할 정보);
		
		sqlSession.insert(NAMESPACE + ".userJoin", joinVO);
		
		
	}


	
	// 회원 로그인
	@Override
	public UserVO userLogin(UserVO loginVO) {
		System.out.println(" DAOImpl : userLogin() 실행 ");
		System.out.println(" DAOImpl : 해당 SQL구문 실행 ");
		
		UserVO resultVO
		   =sqlSession.selectOne(NAMESPACE + ".userLogin",loginVO);	
		
		System.out.println(" DAOImpl : 결과 "+resultVO);
		
		return resultVO;
	}
	


	// 회원 정보 조회(마이페이지)
	@Override
	public UserVO userInfo(String us_id) {
		System.out.println(" DAOImpl : getUser(String sessionUserid) 호출 ");
		
		return sqlSession.selectOne(NAMESPACE + ".userInfo",us_id);
	}

	
	// 회원정보 수정
	@Override
	public void userUpdate(UserVO updateVO) {
		System.out.println(" DAOImpl : userUpdate(UserVO updateVO) 호출");
		
		// SQL구문 호출
		sqlSession.update(NAMESPACE + ".userUpdate", updateVO);
		
		System.out.println(" DAOImpl : 수정완료! ");
		
	}


	// 회원 탈퇴
	@Override
	public int userDelete(UserVO delVO) {
		System.out.println(" DAOImpl : 탈퇴 ");
		
		// 정상   -  0  /   정지 -  1   /  탈퇴  - 2
		// SQL구문 호출		
		return sqlSession.delete(NAMESPACE + ".userDelete",delVO);
	}
	
	
	
	// 아이디 중복확인
	
	  @Override public UserVO userCheckId(String us_id) {
	  System.out.println(" DAOImpl : getUser(String sessionus_id) 호출 "); return
	  sqlSession.selectOne(NAMESPACE + ".userCheckId",us_id); }
	 
	 

	// 마이페이지 내 판매글 조회
		@Override
		public List<ItemVO> userSellList(String us_id) {
			
			return sqlSession.selectList(NAMESPACE+".userSellList",us_id);
		}




//	@Override
//	public String userInfoCheck(String us_id) throws Exception {
//		logger.debug("userInfoCheck(String us_id) 호출");
	//	return sqlSession.selectOne(NAMESPACE+ ".userInfoCheck", us_id);
	//}

	
	
	
	
}
