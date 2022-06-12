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

    // 페이징처리
//    @GetMapping("/paging")
//    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
//        List<BoardDTO> dessertBoardList = boardService.dessertPagingList(page);
//        PageDTO paging = boardService.paging(page);     // 해당페이지의 하단 글의 번호 호출
//        model.addAttribute("dessertBoardList", dessertBoardList);
//        model.addAttribute("paging", paging);
//        return "board/dessertList";
//    }

    @GetMapping("/dessertWritePaging")
    public String dessertWritePaging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> dessertBoardList = boardService.dessertPagingList(page);
        PageDTO paging = boardService.paging(page);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("dessertBoardList", dessertBoardList);
        model.addAttribute("paging", paging);
        return "board/dessertList";
    }

    // 검색처리
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("dessertBoardList", searchList);
        return "board/dessertList";
    }

    // 글 작성화면
    @GetMapping("/saveFile-form")
    public String saveFileForm() {
        return "board/saveFile";
    }

//    // 글 작성화면 처리
//    @PostMapping("/saveFile-form")
//    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
//        boardService.saveFile(boardDTO);
//        return "redirect:/board/paging";
//    }

    // 삭제처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

//    // 글 상세조회
//    @GetMapping("/detail")
//    public String findById(@RequestParam("id") Long id, Model model,
//                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
//        BoardDTO boardDTO = boardService.findById(id); // 방법 1
////        model.addAttribute("board", boardService.findById(id)); // 방법 2
//        model.addAttribute("board", boardDTO);
//        model.addAttribute("page", page);
//        // 댓글 목록도 가져가야 함.
//        List<CommentDTO> commentDTOList = commentService.findAll(id);
//        model.addAttribute("commentList", commentDTOList);
//        return "board/detail";
//    }

    // 글 수정화면 요청
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardUpdate", boardDTO);
        return "board/update";
    }

    // 수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

    // food.jsp 이동
    @GetMapping("/food-form")
    public String foodForm() {
        return "board/food";
    }

//    // 페이징처리
//    @GetMapping("/dessertPaging")
//    public String dessertPaging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
//        List<BoardDTO> boardList = boardService.dessertPagingList(page);
//        PageDTO paging = boardService.paging(page);     // 해당페이지의 하단 글의 번호 호출
//        model.addAttribute("boardList", boardList);
//        model.addAttribute("paging", paging);
//        return "board/dessertList";
//    }

    // 글 목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("dessertBoardList", boardDTOList);
        return "/board/dessertList";
    }

    // 상세조회
    @GetMapping("/dessertDetail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id); // 방법 1
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

    // dessert 글 작성화면 이동
    @GetMapping("/dessertWrite-form")
    public String dessertWriteForm() {
        return "board/dessertWrite";
    }

    // dessert 글 작성화면 처리
    @PostMapping("/dessertWrite-form")
    public String dessertWrite(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.dessertWrite(boardDTO);
        if(result) {
            return "redirect:/board/dessertWritePaging";
        } else {
            return "board/fail";
        }
    }

//    @PostMapping("/dessertWrite-form")
//    public String dessertWriteForm(@ModelAttribute BoardDTO boardDTO) throws IOException {
//        boolean result =boardService.dessertWrite(boardDTO);
//        if(result) {
//            return "redirect:/board/dessert-formPaging";
//        } else {
//            return "board/save-fail";
//        }
//    }


}
