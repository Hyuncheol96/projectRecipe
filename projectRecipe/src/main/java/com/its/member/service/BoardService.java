package com.its.member.service;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.PageDTO;
import com.its.member.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;




    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }

//    public List<BoardDTO> westernSearch(String searchType, String q) {
//        Map<String, String> searchParam = new HashMap<>();
//        searchParam.put("type", searchType);
//        searchParam.put("q", q);
//        List<BoardDTO> westernSearchList = boardRepository.westernSearch(searchParam);
//        return westernSearchList;
//    }
//
//    public List<BoardDTO> dessertSearch(String searchType, String q) {
//        Map<String, String> searchParam = new HashMap<>();
//        searchParam.put("type", searchType);
//        searchParam.put("q", q);
//        List<BoardDTO> dessertSearchList = boardRepository.dessertSearch(searchParam);
//        return dessertSearchList;
//    }


    public void delete(Long id) {
        boardRepository.delete(id);
    }

//    public void westernDelete(Long id) {
//        boardRepository.westernDelete(id);
//    }
//
//    public void dessertDelete(Long id) {
//        boardRepository.dessertDelete(id);
//    }

    public BoardDTO findById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.findById(id);
    }


//    public BoardDTO westernFindById(Long id) {
//        boardRepository.updateHits(id);
//        return boardRepository.westernFindById(id);
//    }
//
//    public BoardDTO dessertFindById(Long id) {
//        boardRepository.updateHits(id);
//        return boardRepository.dessertFindById(id);
//    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

//    public void westernUpdate(BoardDTO boardDTO) {
//        boardRepository.westernUpdate(boardDTO);
//    }
//
//    public void dessertUpdate(BoardDTO boardDTO) {
//        boardRepository.dessertUpdate(boardDTO);
//    }


    public boolean write(BoardDTO boardDTO) {
        int saveResult = boardRepository.write(boardDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return  false;
        }
    }

//    public boolean westernWrite(BoardDTO boardDTO) {
//        int saveResult = boardRepository.westernWrite(boardDTO);
//        if (saveResult > 0) {
//            return true;
//        } else {
//            return  false;
//        }
//    }
//
//    public boolean dessertWrite(BoardDTO boardDTO) {
//        int saveResult = boardRepository.dessertWrite(boardDTO);
//        if (saveResult > 0) {
//            return true;
//        } else {
//            return  false;
//        }
//    }

    private static final int PAGE_LIMIT = 5;     // ??? ???????????? ????????? ??? ??????
    private static final int BLOCK_LIMIT = 100;    // ??????????????? ?????? ????????? ?????? ??????


    // korean
    public PageDTO paging(int page) {
        int count = boardRepository.count();
        // ????????? ?????? ????????? ??????
        // 10, 3 10/3 = 3.3333 => 4
        int maxPage = (int)(Math.ceil((double)count / PAGE_LIMIT));   // int??? ?????? ?????????
        // ??????????????? 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // ???????????? 3 6 9 12 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;

    }

//    // western
//    public PageDTO westernPaging(int page) {
//        int westernCount = boardRepository.westernCount();
//        // ????????? ?????? ????????? ??????
//        // 10, 3 10/3 = 3.3333 => 4
//        int maxPage = (int)(Math.ceil((double)westernCount / PAGE_LIMIT));   // int??? ?????? ?????????
//        // ??????????????? 1 4 7 10 ~~~
//        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
//        // ???????????? 3 6 9 12 ~~~
//        int endPage = startPage + BLOCK_LIMIT - 1;
//        if(endPage > maxPage)
//            endPage = maxPage;
//        PageDTO westernPaging = new PageDTO();
//        westernPaging.setPage(page);
//        westernPaging.setStartPage(startPage);
//        westernPaging.setEndPage(endPage);
//        westernPaging.setMaxPage(maxPage);
//        return westernPaging;
//
//    }
//
//
//    // dessert
//    public PageDTO dessertPaging(int page) {
//        int dessertCount = boardRepository.dessertCount();
//        // ????????? ?????? ????????? ??????
//        // 10, 3 10/3 = 3.3333 => 4
//        int maxPage = (int)(Math.ceil((double)dessertCount / PAGE_LIMIT));   // int??? ?????? ?????????
//        // ??????????????? 1 4 7 10 ~~~
//        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
//        // ???????????? 3 6 9 12 ~~~
//        int endPage = startPage + BLOCK_LIMIT - 1;
//        if(endPage > maxPage)
//            endPage = maxPage;
//        PageDTO dessertPaging = new PageDTO();
//        dessertPaging.setPage(page);
//        dessertPaging.setStartPage(startPage);
//        dessertPaging.setEndPage(endPage);
//        dessertPaging.setMaxPage(maxPage);
//        return dessertPaging;
//
//    }

    // korean
    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }


//    // western
//    public List<BoardDTO> westernPagingList(int page) {
//        int pagingStart = (page-1) * PAGE_LIMIT;
//        Map<String, Integer> pagingParam = new HashMap<>();
//        pagingParam.put("start", pagingStart);
//        pagingParam.put("limit", PAGE_LIMIT);
//        List<BoardDTO> westernPagingList = boardRepository.westernPagingList(pagingParam);
//        return westernPagingList;
//    }
//
//    // dessert
//    public List<BoardDTO> dessertPagingList(int page) {
//        int pagingStart = (page-1) * PAGE_LIMIT;
//        Map<String, Integer> pagingParam = new HashMap<>();
//        pagingParam.put("start", pagingStart);
//        pagingParam.put("limit", PAGE_LIMIT);
//        List<BoardDTO> dessertPagingList = boardRepository.dessertPagingList(pagingParam);
//        return dessertPagingList;
//    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

}
