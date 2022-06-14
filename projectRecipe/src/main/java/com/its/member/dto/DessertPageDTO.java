package com.its.member.dto;

import lombok.Data;

@Data
public class DessertPageDTO {
    private int dessertPage;       // 현재 페이지
    private int dessertMaxPage;    // 필요한 페이지 개수
    private int dessertStartPage;  // 시작 페이지
    private int dessertEndPage;    // 끝 페이지
}
