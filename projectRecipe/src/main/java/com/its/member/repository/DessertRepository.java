package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DessertRepository {
    @Autowired
    private SqlSessionTemplate sql;


        public int dessertCount() {
        return sql.selectOne("Dssert.dessertCount");
    }




    public List<BoardDTO> dessertSearch(Map<String, String> searchParam) {
        return sql.selectList("Dssert.dessertSearch", searchParam);
    }


    public void dessertDelete(Long id) {
        sql.delete("Dssert.dessertDelete", id);
    }




    public BoardDTO dessertFindById(Long id) {
        return sql.selectOne("Dssert.dessertFindById", id);
    }



    public void updateHits(Long id) {
        sql.update("Dssert.updateHits", id);
    }


    public void dessertUpdate(BoardDTO boardDTO) {
        sql.update("Dssert.dessertUpdate", boardDTO);
    }


    public int dessertWrite(BoardDTO boardDTO) {
        return sql.insert("Dssert.dessertWrite", boardDTO);
    }


    public List<BoardDTO> dessertPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Dssert.dessertPagingList", pagingParam);
    }


}
