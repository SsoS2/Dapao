package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.ProdVO;
import com.dapao.persistence.ProdDAO;

@Service
public class ProdServiceImpl implements ProdService{
	
	private static final Logger logger = LoggerFactory.getLogger(ProdServiceImpl.class);
	@Autowired
	private ProdDAO pdao;
	@Override
	public List<ProdVO> searchProd(ProdVO vo) throws Exception{
		
		return pdao.searchProd(vo);
	}

}
