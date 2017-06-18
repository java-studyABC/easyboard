package org.easyboard.service;

import java.util.List;

import javax.inject.Inject;

import org.easyboard.domain.BoardVO;
import org.easyboard.domain.Criteria;
import org.easyboard.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardList(cri);
	}

	@Override
	public int getBoardCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardCount();
	}

	@Override
	public BoardVO readBoard(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoard(bno);
	}

	@Override
	public void modifyBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}

	@Override
	public void removeBoard(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteBoard(bno);
	}

	@Override
	public void registerBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoard(vo);
	}

	
	
}
