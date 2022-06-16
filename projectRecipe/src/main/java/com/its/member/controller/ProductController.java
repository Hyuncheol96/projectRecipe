package com.its.member.controller;

import com.its.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")

public class ProductController {
    @Autowired
    private ProductService productService;

    // 관리자페이지 주문현황 이동
    @GetMapping("/orderedList-form")
    public String orderedListForm() {

        return "product/orderedList";
    }



    @GetMapping("/insert-form")
    public String insertForm() {

        return "product/insert";
    }

    @GetMapping("/list-form")
    public String listForm() {

        return "product/list";
    }

    @GetMapping("/update-form")
    public String updateForm() {

        return "product/update";
    }

    @GetMapping("/delete-form")
    public String deleteForm() {

        return "product/delete";
    }





}
