package com.its.member.controller;

import com.its.member.dto.ProductDTO;
import com.its.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")

public class ProductController {
    @Autowired
    private ProductService productService;

    // 관리자페이지 주문현황 화면 이동
    @GetMapping("/orderedList-form")
    public String orderedListForm() {

        return "product/orderedList";
    }

    // 관리자페이지 상품등록 화면 이동
    @GetMapping("/insert-form")
    public String insertForm() {

        return "product/insert";
    }

    // 관리자페이지 상품리스트 화면 이동
    @GetMapping("/list-form")
    public String listForm() {

        return "redirect:/product/findAll";
    }

    // 관리자페이지 상품수정 화면 이동
    @GetMapping("/update-form")
    public String updateForm() {

        return "product/update";
    }

    // 관리자페이지 상품삭제 화면 이동
    @GetMapping("/delete-form")
    public String deleteForm() {

        return "product/delete";
    }


    // 상품목록 조회
    @GetMapping("findAll")
    public String findAll(Model model) {
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "product/list";
    }

    // 상품 상세보기 화면 이동
    @GetMapping("/detail-form")
    public String detail() {

        return "product/detail";
    }



}
