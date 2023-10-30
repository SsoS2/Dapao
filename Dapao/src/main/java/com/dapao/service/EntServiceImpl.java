package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.persistence.EntDAO;

@Service
public class EntServiceImpl implements EntService {
	
	private static final Logger logger = LoggerFactory.getLogger(EntServiceImpl.class);
	
	// Owner객체 주입
	@Autowired
	private EntDAO edao;

	@Override
	public void entJoin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entJoin()서비스 호출");
		edao.entJoin(vo);
		
	}

	@Override
	public EntVO entLogin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entLogin()서비스 호출");
		
		return edao.entLogin(vo);
	}
	@Override
	public void entUpdate(EntVO vo) {
		logger.debug(" service -> entUpdate(EntVO vo) 호출 ");
		edao.entUpdate(vo);
		
	}

	@Override
	public List<EntVO> listEnt(EntVO vo) {
		logger.debug(" sevice listEnt(String own_id) 호출 ");
		return edao.listEnt(vo);
	}
	

}
