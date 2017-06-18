package org.easyboard.persistence;

import java.util.List;

import org.easyboard.domain.BoardVO;
import org.easyboard.domain.Criteria;

public interface BoardDAO {

	public List<BoardVO> getBoardList(Criteria cri)throws Exception;
	
	public int getBoardCount()throws Exception;
	
	public BoardVO getBoard(Integer bno)throws Exception;
	
	public void updateBoard(BoardVO vo)throws Exception;
	
	public void deleteBoard(Integer bno)throws Exception;
	
	public void insertBoard(BoardVO vo)throws Exception;
	
	
}
