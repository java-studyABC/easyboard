package org.easyboard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.easyboard.domain.BoardVO;
import org.easyboard.domain.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.easyboard.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getBoardList", cri);
	}

	@Override
	public int getBoardCount() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBoardCount");
	}

	@Override
	public BoardVO getBoard(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBoard", bno);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".updateBoard", vo);
	}

	@Override
	public void deleteBoard(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteBoard", bno);
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertBoard", vo);
	}

}
