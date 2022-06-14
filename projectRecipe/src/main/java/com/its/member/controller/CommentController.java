package com.its.member.controller;

import com.its.member.dto.CommentDTO;
import com.its.member.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    // korean 댓글 등록
    @PostMapping("/koreanSave")
    public @ResponseBody List<CommentDTO> koreanSave(@ModelAttribute CommentDTO commentDTO) {

        System.out.println("commentDTO" + commentDTO);

        commentService.koreanSave(commentDTO);    // 1.
        List<CommentDTO> koreanCommentList = commentService.koreanFindAll(commentDTO.getBoardId());  // 2.
        return koreanCommentList;
    }

    // western 댓글 등록
    @PostMapping("/westernSave")
    public @ResponseBody List<CommentDTO> westernSave(@ModelAttribute CommentDTO commentDTO) {

        System.out.println("commentDTO" + commentDTO);

        commentService.westernSave(commentDTO);    // 1.
        List<CommentDTO> westernCommentList = commentService.westernFindAll(commentDTO.getBoardId());  // 2.
        return westernCommentList;
    }

    // dessert 댓글 등록
    @PostMapping("/dessertSave")
    public @ResponseBody List<CommentDTO> dessertSave(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("commentDTO" + commentDTO);

        commentService.dessertSave(commentDTO);    // 1.
        List<CommentDTO> dessertCommentList = commentService.dessertFindAll(commentDTO.getBoardId());  // 2.
        return dessertCommentList;
    }
}
