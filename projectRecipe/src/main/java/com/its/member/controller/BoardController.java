package com.its.member.controller;


import com.its.member.dto.BoardDTO;
import com.its.member.dto.CommentDTO;
import com.its.member.dto.OrderListDTO;
import com.its.member.dto.PageDTO;
import com.its.member.service.BoardService;
import com.its.member.service.CommentService;
import com.its.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ProductService productService;


    // korean 검색처리
    @GetMapping("/search")
    public String boardSearch(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "board/list";
    }

//    // western 검색처리
//    @GetMapping("/westernSearch")
//    public String westernSearch(@RequestParam("searchType") String searchType,
//                         @RequestParam("q") String q, Model model) {
//        List<BoardDTO> westernSearchList = boardService.westernSearch(searchType, q);
//        model.addAttribute("westernBoardList", westernSearchList);
//        return "board/westernList";
//    }
//
//    // dessert 검색처리
//    @GetMapping("/dessertSearch")
//    public String dessertSearch(@RequestParam("searchType") String searchType,
//                         @RequestParam("q") String q, Model model) {
//        List<BoardDTO> dessertSearchList = boardService.dessertSearch(searchType, q);
//        model.addAttribute("dessertBoardList", dessertSearchList);
//        return "board/dessertList";
//    }



    // korean 삭제처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }


//    // western 삭제처리
//    @GetMapping("/westernDelete")
//    public String westernDelete(@RequestParam("id") Long id) {
//        boardService.westernDelete(id);
//        return "redirect:/board/westernPaging";
//    }
//
//
//    // dessert 삭제처리
//    @GetMapping("/dessertDelete")
//    public String delete(@RequestParam("id") Long id) {
//        boardService.dessertDelete(id);
//        return "redirect:/board/dessertPaging";
//    }



    // korean 글 수정화면 요청
    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("update", boardDTO);
        return "board/update";
    }


//    // western 글 수정화면 요청
//    @GetMapping("/westernUpdate")
//    public String westernUpdate(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.westernFindById(id);
//        model.addAttribute("westernBoardUpdate", boardDTO);
//        return "board/westernUpdate";
//    }
//
//    // dessert 글 수정화면 요청
//    @GetMapping("/dessertUpdate")
//    public String dessertUpdate(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.dessertFindById(id);
//        model.addAttribute("dessertBoardUpdate", boardDTO);
//        return "board/dessertUpdate";
//    }

    // korean 수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

//    // western 수정처리
//    @PostMapping("/westernUpdate")
//    public String westernUpdate(@ModelAttribute BoardDTO boardDTO) {
//        boardService.westernUpdate(boardDTO);
//        return "redirect:/board/westernDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
//    }
//
//    // dessert 수정처리
//    @PostMapping("/dessertUpdate")
//    public String dessertUpdate(@ModelAttribute BoardDTO boardDTO) {
//        boardService.dessertUpdate(boardDTO);
//        return "redirect:/board/dessertDetail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
//    }

    // food.jsp 이동
    @GetMapping("/food-form")
    public String foodForm() {
        return "board/food";
    }




    // korean 상세조회
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id); // 방법 1
//        model.addAttribute("board", boardService.findById(id)); // 방법 2
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> commentList = commentService.findAll(id);
        model.addAttribute("commentList", commentList);
        return "board/detail";
    }


//    // western 상세조회
//    @GetMapping("/westernDetail")
//    public String westernFindById(@RequestParam("id") Long id, Model model,
//                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
//        BoardDTO boardDTO = boardService.westernFindById(id); // 방법 1
////        model.addAttribute("board", boardService.findById(id)); // 방법 2
//        model.addAttribute("board", boardDTO);
//        model.addAttribute("page", page);
//        // 댓글 목록도 가져가야 함.
//        List<CommentDTO> westernCommentList = commentService.westernFindAll(id);
//        model.addAttribute("westernCommentList", westernCommentList);
//        return "/board/westernDetail";
//    }
//
//    // dessert 상세조회
//    @GetMapping("/dessertDetail")
//    public String dessertFindById(@RequestParam("id") Long id, Model model,
//                           @RequestParam(value="page", required = false, defaultValue = "1") int page) {
//        BoardDTO boardDTO = boardService.dessertFindById(id); // 방법 1
////        model.addAttribute("board", boardService.findById(id)); // 방법 2
//        model.addAttribute("board", boardDTO);
//        model.addAttribute("page", page);
//        // 댓글 목록도 가져가야 함.
//        List<CommentDTO> dessertCommentList = commentService.dessertFindAll(id);
//        model.addAttribute("dessertCommentList", dessertCommentList);
//        return "/board/dessertDetail";
//    }



    // korean 글 작성화면 이동
    @GetMapping("/write-form")
    public String writeForm() {
        return "board/write";
    }

//    // western 글 작성화면 이동
//    @GetMapping("/westernWrite-form")
//    public String westernWriteForm() {
//        return "board/westernWrite";
//    }
//
//    // dessert 글 작성화면 이동
//    @GetMapping("/dessertWrite-form")
//    public String dessertWriteForm() {
//        return "board/dessertWrite";
//    }


    // korean 글 작성화면 처리
    @PostMapping("/write-form")
    public String write(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.write(boardDTO);
        return "redirect:/board/paging";
    }

//    // western 글 작성화면 처리
//    @PostMapping("/westernWrite-form")
//    public String westernWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
//        boardService.westernWrite(boardDTO);
//        return "redirect:/board/westernPaging";
//    }
//
//    // dessert 글 작성화면 처리
//    @PostMapping("/dessertWrite-form")
//    public String dessertWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
//        boardService.dessertWrite(boardDTO);
//        return "redirect:/board/dessertPaging";
//    }

    // korean 페이징 처리
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model, HttpSession session) {
        List<BoardDTO> boardList = boardService.pagingList(page); // 해당페이지리스트 호출
        PageDTO paging = boardService.paging(page);     // 해당페이지의 하단 글의 번호 호출
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        // 결제여부도 확인해야함 (결제한 사람만 게시글 상세조회 가능)
        String memberId = (String) session.getAttribute("loginMemberId");
        OrderListDTO orderListDTO = productService.orderFindById(memberId);
        model.addAttribute("order", orderListDTO);
        return "board/list";
    }


//    // western 페이징 처리
//    @GetMapping("/westernPaging")
//    public String westernPaging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
//        List<BoardDTO> westernBoardList = boardService.westernPagingList(page); // 해당페이지리스트 호출
//        PageDTO paging = boardService.westernPaging(page);     // 해당페이지의 하단 글의 번호 호출
//        model.addAttribute("westernBoardList", westernBoardList);
//        model.addAttribute("paging", paging);
//        return "board/koreanList";
//    }
//
//
//    // dessert 페이징 처리
//    @GetMapping("/dessertPaging")
//    public String dessertPaging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
//        List<BoardDTO> dessertBoardList = boardService.dessertPagingList(page); // 해당페이지리스트 호출
//        PageDTO paging = boardService.dessertPaging(page);     // 해당페이지의 하단 글의 번호 호출
//        model.addAttribute("dessertBoardList", dessertBoardList);
//        model.addAttribute("paging", paging);
//        return "board/dessertList";
//    }




}
