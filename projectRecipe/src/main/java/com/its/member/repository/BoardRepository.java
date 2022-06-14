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


    public int koreanCount() {
        return sql.selectOne("Board.koreanCount");
    }

    public int westernCount() {
        return sql.selectOne("Board.westernCount");
    }

    public int dessertCount() {
        return sql.selectOne("Board.dessertCount");
    }

    public List<BoardDTO> koreanSearch(Map<String, String> searchParam) {
        return sql.selectList("Board.koreanSearch", searchParam);
    }

    public List<BoardDTO> westernSearch(Map<String, String> searchParam) {
        return sql.selectList("Board.westernSearch", searchParam);
    }

    public List<BoardDTO> dessertSearch(Map<String, String> searchParam) {
        return sql.selectList("Board.dessertSearch", searchParam);
    }

    public void koreanDelete(Long id) {
        sql.delete("Board.koreanDelete", id);
    }

    public void westernDelete(Long id) {
        sql.delete("Board.westernDelete", id);
    }

    public void dessertDelete(Long id) {
        sql.delete("Board.dessertDelete", id);
    }

//    public void saveFile(BoardDTO boardDTO) {
//        sql.insert("Board.saveFile", boardDTO);
//    }


    public BoardDTO koreanFindById(Long id) {
        return sql.selectOne("Board.koreanFindById", id);
    }
    public BoardDTO dessertFindById(Long id) {
        return sql.selectOne("Board.dessertFindById", id);
    }

    public BoardDTO westernFindById(Long id) {
        return sql.selectOne("Board.westernFindById", id);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public void koreanUpdate(BoardDTO boardDTO) {
        sql.update("Board.koreanUpdate", boardDTO);
    }

    public void westernUpdate(BoardDTO boardDTO) {
        sql.update("Board.westernUpdate", boardDTO);
    }

    public void dessertUpdate(BoardDTO boardDTO) {
        sql.update("Board.dessertUpdate", boardDTO);
    }


    public int koreanWrite(BoardDTO boardDTO) {
        return sql.insert("Board.koreanWrite", boardDTO);
    }
    public int westernWrite(BoardDTO boardDTO) {
        return sql.insert("Board.westernWrite", boardDTO);
    }

    public int dessertWrite(BoardDTO boardDTO) {
        return sql.insert("Board.dessertWrite", boardDTO);
    }


    public List<BoardDTO> koreanPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.koreanPagingList", pagingParam);
    }

    public List<BoardDTO> westernPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.westernPagingList", pagingParam);
    }

    public List<BoardDTO> dessertPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.dessertPagingList", pagingParam);
    }



    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

}
