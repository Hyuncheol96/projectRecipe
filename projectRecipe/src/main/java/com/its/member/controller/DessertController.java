package com.its.member.controller;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.CommentDTO;
import com.its.member.dto.DessertPageDTO;
import com.its.member.dto.PageDTO;
import com.its.member.service.CommentService;
import com.its.member.service.DessertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("dessert")
public class DessertController {
    @Autowired
    private DessertService dessertService;
    @Autowired
    private CommentService commentService;




    // dessert 검색처리
    @GetMapping("/dessertSearch")
    public String dessertSearch(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> dessertSearchList = dessertService.dessertSearch(searchType, q);
        model.addAttribute("dessertBoardList", dessertSearchList);
        return "dessert/dessertList";
    }



    // dessert 삭제처리
    @GetMapping("/dessertDelete")
    public String delete(@RequestParam("id") Long id) {
        dessertService.dessertDelete(id);
        return "redirect:/board/dessertPaging";
    }




    // dessert 글 수정화면 요청
    @GetMapping("/dessertUpdate")
    public String dessertUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = dessertService.dessertFindById(id);
        model.addAttribute("dessertBoardUpdate", boardDTO);
        return "dessert/dessertUpdate";
    }


    // dessert 수정처리
    @PostMapping("/dessertUpdate")
    public String dessertUpdate(@ModelAttribute BoardDTO boardDTO) {
        dessertService.dessertUpdate(boardDTO);
        return "redirect:/board/dessertDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }




    // dessert 상세조회
    @GetMapping("/dessertDetail")
    public String dessertFindById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = dessertService.dessertFindById(id); // 방법 1
//        model.addAttribute("board", boardService.findById(id)); // 방법 2
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> dessertCommentList = commentService.dessertFindAll(id);
        model.addAttribute("dessertCommentList", dessertCommentList);
        return "dessert/dessertDetail";
    }




    // // dessert 글 리스트 이동
    @GetMapping("/dessert-form")
    public String dessertRecipe() {
        return "dessert/dessertList";
    }



    // dessert 글 작성화면 이동
    @GetMapping("/dessertWrite-form")
    public String dessertWriteForm() {
        return "dessert/dessertWrite";
    }




    // dessert 글 작성화면 처리
    @PostMapping("/dessertWrite-form")
    public String dessertWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
        dessertService.dessertWrite(boardDTO);
        return "redirect:/board/dessertPaging";
    }



    // dessert 페이징 처리
    @GetMapping("/dessertPaging")
    public String dessertPaging(@RequestParam(value="dessertPage", required=false, defaultValue="1") int dessertPage, Model model) {
        List<BoardDTO> dessertBoardList = dessertService.dessertPagingList(dessertPage); // 해당페이지리스트 호출
        DessertPageDTO Paging = dessertService.dessertPaging(dessertPage);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("dessertBoardList", dessertBoardList);
        model.addAttribute("dessertPaging", Paging);
        return "dessert/dessertList";
    }




}
