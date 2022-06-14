package com.its.member.service;

import com.its.member.dto.CommentDTO;
import com.its.member.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;


    public void koreanSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentRepository.koreanSave(commentDTO);
    }

    public List<CommentDTO> koreanFindAll(Long boardId) {
        return commentRepository.koreanFindAll(boardId);
    }

    public void westernSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentRepository.westernSave(commentDTO);
    }

    public List<CommentDTO> westernFindAll(Long boardId) {
        return commentRepository.westernFindAll(boardId);
    }

    public void dessertSave(CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentRepository.dessertSave(commentDTO);
    }

    public List<CommentDTO> dessertFindAll(Long boardId) {
        return commentRepository.dessertFindAll(boardId);
    }


}

