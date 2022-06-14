package com.its.member.service;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.DessertPageDTO;
import com.its.member.dto.PageDTO;
import com.its.member.repository.DessertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DessertService {

    @Autowired
    private DessertRepository dessertRepository;

        public List<BoardDTO> dessertSearch(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> dessertSearchList = dessertRepository.dessertSearch(searchParam);
        return dessertSearchList;
    }



    public void dessertDelete(Long id) {
        dessertRepository.dessertDelete(id);
    }

    public BoardDTO dessertFindById(Long id) {
        dessertRepository.updateHits(id);
        return dessertRepository.dessertFindById(id);
    }


    public void dessertUpdate(BoardDTO boardDTO) {
        dessertRepository.dessertUpdate(boardDTO);
    }





    public boolean dessertWrite(BoardDTO boardDTO) {
        int saveResult = dessertRepository.dessertWrite(boardDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return  false;
        }
    }

    private static final int PAGE_LIMIT = 5;     // 한 페이지에 보여줄 글 개수
    private static final int BLOCK_LIMIT = 100;    // 목록페이지 아래 보여줄 버튼 개수





    // dessert
    public DessertPageDTO dessertPaging(int dessertPage) {
        int dessertCount = dessertRepository.dessertCount();
        // 필요한 전체 페이지 개수
        // 10, 3 10/3 = 3.3333 => 4
        int dessertMaxPage = (int)(Math.ceil((double)dessertCount / PAGE_LIMIT));   // int로 강제 형변환
        // 시작페이지 1 4 7 10 ~~~
        int dessertStartPage = (((int)(Math.ceil((double)dessertPage / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ~~~
        int dessertEndPage = dessertStartPage + BLOCK_LIMIT - 1;
        if(dessertEndPage > dessertMaxPage)
            dessertEndPage = dessertMaxPage;
        DessertPageDTO dessertPaging = new DessertPageDTO();
        dessertPaging.setDessertPage(dessertPage);
        dessertPaging.setDessertStartPage(dessertStartPage);
        dessertPaging.setDessertEndPage(dessertEndPage);
        dessertPaging.setDessertMaxPage(dessertMaxPage);
        return dessertPaging;

    }




    // dessert
    public List<BoardDTO> dessertPagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> dessertPagingList = dessertRepository.dessertPagingList(pagingParam);
        return dessertPagingList;
    }


}
