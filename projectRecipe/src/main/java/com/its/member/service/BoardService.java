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

    private static final int PAGE_LIMIT = 5;     // 한 페이지에 보여줄 글 개수
    private static final int BLOCK_LIMIT = 3;    // 목록페이지 아래 보여줄 버튼 개수



    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }


    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public BoardDTO koreanFindById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.koreanFindById(id);
    }


    public BoardDTO westernFindById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.westernFindById(id);
    }

    public BoardDTO dessertFindById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.dessertFindById(id);
    }

    public void westernUpdate(BoardDTO boardDTO) {
        boardRepository.westernUpdate(boardDTO);
    }

    public void dessertUpdate(BoardDTO boardDTO) {
        boardRepository.dessertUpdate(boardDTO);
    }


    public boolean koreanWrite(BoardDTO boardDTO) {
        int saveResult = boardRepository.koreanWrite(boardDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return  false;
        }
    }

    public boolean westernWrite(BoardDTO boardDTO) {
        int saveResult = boardRepository.westernWrite(boardDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return  false;
        }
    }

    public boolean dessertWrite(BoardDTO boardDTO) {
        int saveResult = boardRepository.dessertWrite(boardDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return  false;
        }
    }

    // korean
    public PageDTO koreanPaging(int page) {
        int koreanCount = boardRepository.koreanCount();
        // 필요한 전체 페이지 개수
        // 10, 3 10/3 = 3.3333 => 4
        int maxPage = (int)(Math.ceil((double)koreanCount / PAGE_LIMIT));   // int로 강제 형변환
        // 시작페이지 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO koreanPaging = new PageDTO();
        koreanPaging.setPage(page);
        koreanPaging.setStartPage(startPage);
        koreanPaging.setEndPage(endPage);
        koreanPaging.setMaxPage(maxPage);
        return koreanPaging;

    }

    // western
    public PageDTO westernPaging(int page) {
        int westernCount = boardRepository.westernCount();
        // 필요한 전체 페이지 개수
        // 10, 3 10/3 = 3.3333 => 4
        int maxPage = (int)(Math.ceil((double)westernCount / PAGE_LIMIT));   // int로 강제 형변환
        // 시작페이지 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO westernPaging = new PageDTO();
        westernPaging.setPage(page);
        westernPaging.setStartPage(startPage);
        westernPaging.setEndPage(endPage);
        westernPaging.setMaxPage(maxPage);
        return westernPaging;

    }


    // dessert
    public PageDTO dessertPaging(int page) {
        int dessertCount = boardRepository.dessertCount();
        // 필요한 전체 페이지 개수
        // 10, 3 10/3 = 3.3333 => 4
        int maxPage = (int)(Math.ceil((double)dessertCount / PAGE_LIMIT));   // int로 강제 형변환
        // 시작페이지 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO dessertPaging = new PageDTO();
        dessertPaging.setPage(page);
        dessertPaging.setStartPage(startPage);
        dessertPaging.setEndPage(endPage);
        dessertPaging.setMaxPage(maxPage);
        return dessertPaging;

    }

    // korean
    public List<BoardDTO> koreanPagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> koreanPagingList = boardRepository.koreanPagingList(pagingParam);
        return koreanPagingList;
    }


    // western
    public List<BoardDTO> westernPagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> westernPagingList = boardRepository.westernPagingList(pagingParam);
        return westernPagingList;
    }

    // dessert
    public List<BoardDTO> dessertPagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> dessertPagingList = boardRepository.dessertPagingList(pagingParam);
        return dessertPagingList;
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

}
