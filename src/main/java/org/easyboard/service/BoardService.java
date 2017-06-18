package org.easyboard.service;

import java.util.List;

import org.easyboard.domain.BoardVO;
import org.easyboard.domain.Criteria;

public interface BoardService {

	public List<BoardVO> getBoardList(Criteria cri) throws Exception;

	public int getBoardCount() throws Exception;

	public BoardVO readBoard(Integer bno) throws Exception;

	public void modifyBoard(BoardVO vo) throws Exception;

	public void removeBoard(Integer bno) throws Exception;

	public void registerBoard(BoardVO vo)throws Exception;
	
}
