package com.its.member.controller;


import com.its.member.dto.BoardDTO;
import com.its.member.dto.CommentDTO;
import com.its.member.dto.PageDTO;
import com.its.member.service.BoardService;
import com.its.member.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;


    // korean 검색처리
    @GetMapping("/koreanSearch")
    public String koreanSearch(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> koreanSearchList = boardService.koreanSearch(searchType, q);
        model.addAttribute("koreanBoardList", koreanSearchList);
        return "board/koreanList";
    }

    // western 검색처리
    @GetMapping("/westernSearch")
    public String westernSearch(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> westernSearchList = boardService.westernSearch(searchType, q);
        model.addAttribute("westernBoardList", westernSearchList);
        return "board/westernList";
    }

    // dessert 검색처리
    @GetMapping("/dessertSearch")
    public String dessertSearch(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> dessertSearchList = boardService.dessertSearch(searchType, q);
        model.addAttribute("dessertBoardList", dessertSearchList);
        return "board/dessertList";
    }



    // 삭제처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

    // korean 글 수정화면 요청
    @GetMapping("/koreanUpdate")
    public String koreanUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.koreanFindById(id);
        model.addAttribute("koreanBoardUpdate", boardDTO);
        return "board/koreanUpdate";
    }


    // western 글 수정화면 요청
    @GetMapping("/westernUpdate")
    public String westernUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.westernFindById(id);
        model.addAttribute("westernBoardUpdate", boardDTO);
        return "board/westernUpdate";
    }

    // dessert 글 수정화면 요청
    @GetMapping("/dessertUpdate")
    public String dessertUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.dessertFindById(id);
        model.addAttribute("dessertBoardUpdate", boardDTO);
        return "board/dessertUpdate";
    }

    // korean 수정처리
    @PostMapping("/koreanUpdate")
    public String koreanUpdate(@ModelAttribute BoardDTO boardDTO) {
        boardService.koreanUpdate(boardDTO);
        return "redirect:/board/koreanDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

    // western 수정처리
    @PostMapping("/westernUpdate")
    public String westernUpdate(@ModelAttribute BoardDTO boardDTO) {
        boardService.westernUpdate(boardDTO);
        return "redirect:/board/westernDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

    // dessert 수정처리
    @PostMapping("/dessertUpdate")
    public String dessertUpdate(@ModelAttribute BoardDTO boardDTO) {
        boardService.dessertUpdate(boardDTO);
        return "redirect:/board/dessertDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

    // food.jsp 이동
    @GetMapping("/food-form")
    public String foodForm() {
        return "board/food";
    }




    // korean 상세조회
    @GetMapping("/koreanDetail")
    public String koreanFindById(@RequestParam("id") Long id, Model model,
                                  @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.koreanFindById(id); // 방법 1
//        model.addAttribute("board", boardService.findById(id)); // 방법 2
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "/board/koreanDetail";
    }


    // western 상세조회
    @GetMapping("/westernDetail")
    public String westernFindById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.westernFindById(id); // 방법 1
//        model.addAttribute("board", boardService.findById(id)); // 방법 2
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "/board/westernDetail";
    }

    // dessert 상세조회
    @GetMapping("/dessertDetail")
    public String dessertFindById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.dessertFindById(id); // 방법 1
//        model.addAttribute("board", boardService.findById(id)); // 방법 2
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "/board/dessertDetail";
    }

    // korean 글 리스트 이동
    @GetMapping("/korean-form")
    public String koreanRecipe() {
        return "board/koreanList";
    }

    // western 글 리스트 이동
    @GetMapping("/western-form")
    public String westernRecipe() {
        return "board/westernList";
    }

    // // dessert 글 리스트 이동
    @GetMapping("/dessert-form")
    public String dessertRecipe() {
        return "board/dessertList";
    }



    // korean 글 작성화면 이동
    @GetMapping("/koreanWrite-form")
    public String koreanWriteForm() {
        return "board/koreanWrite";
    }

    // western 글 작성화면 이동
    @GetMapping("/westernWrite-form")
    public String westernWriteForm() {
        return "board/westernWrite";
    }

    // dessert 글 작성화면 이동
    @GetMapping("/dessertWrite-form")
    public String dessertWriteForm() {
        return "board/dessertWrite";
    }


    // korean 글 작성화면 처리
    @PostMapping("/koreanWrite-form")
    public String koreanWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.koreanWrite(boardDTO);
        return "redirect:/board/koreanPaging";
    }

    // western 글 작성화면 처리
    @PostMapping("/westernWrite-form")
    public String westernWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.westernWrite(boardDTO);
        return "redirect:/board/westernPaging";
    }

    // dessert 글 작성화면 처리
    @PostMapping("/dessertWrite-form")
    public String dessertWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.dessertWrite(boardDTO);
        return "redirect:/board/dessertPaging";
    }

    // korean 페이징 처리
    @GetMapping("/koreanPaging")
    public String koreanPaging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> koreanBoardList = boardService.koreanPagingList(page); // 해당페이지리스트 호출
        PageDTO paging = boardService.koreanPaging(page);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("koreanBoardList", koreanBoardList);
        model.addAttribute("paging", paging);
        return "board/koreanList";
    }


    // western 페이징 처리
    @GetMapping("/westernPaging")
    public String westernPaging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> westernBoardList = boardService.westernPagingList(page); // 해당페이지리스트 호출
        PageDTO paging = boardService.westernPaging(page);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("westernBoardList", westernBoardList);
        model.addAttribute("paging", paging);
        return "board/westernList";
    }


    // dessert 페이징 처리
    @GetMapping("/dessertPaging")
    public String dessertPaging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> dessertBoardList = boardService.dessertPagingList(page); // 해당페이지리스트 호출
        PageDTO paging = boardService.dessertPaging(page);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("dessertBoardList", dessertBoardList);
        model.addAttribute("paging", paging);
        return "board/dessertList";
    }




}
