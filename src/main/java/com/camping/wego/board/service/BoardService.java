package com.camping.wego.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.board.mapper.IBoardMapper;
import com.camping.wego.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
		
	}
	
	@Override
	public BoardVO detail(int bno) {
		BoardVO vo = new BoardVO();
		vo.setBno(bno);
		int hit = vo.getHit();
		hit++;
		vo.setHit(hit);
		
		return mapper.detail(bno);
	}
	
	@Override
	public List<BoardVO> list(){
		return mapper.list();
	}
	
	@Override
	public void modify(BoardVO vo) {
		mapper.modify(vo);

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

}