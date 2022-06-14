package com.its.member.repository;

import com.its.member.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public void koreanSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        sql.insert("Comment.koreanSave", commentDTO);
    }

    public List<CommentDTO> koreanFindAll(Long boardId) {
        return sql.selectList("Comment.koreanFindAll", boardId);
    }

    public void westernSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        sql.insert("Comment.westernSave", commentDTO);
    }

    public List<CommentDTO> westernFindAll(Long boardId) {
        return sql.selectList("Comment.westernFindAll", boardId);
    }

    public void dessertSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        sql.insert("Comment.dessertSave", commentDTO);
    }

    public List<CommentDTO> dessertFindAll(Long boardId) {
        return sql.selectList("Comment.dessertFindAll", boardId);
    }
}