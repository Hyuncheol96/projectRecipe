package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

//    public void saveFile(BoardDTO boardDTO) {
//        sql.insert("Board.saveFile", boardDTO);
//    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public int dessertWrite(BoardDTO boardDTO) {
        return sql.insert("Board.dessertWrite", boardDTO);
    }

    public List<BoardDTO> dessertPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.dessertPagingList", pagingParam);
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }
}
