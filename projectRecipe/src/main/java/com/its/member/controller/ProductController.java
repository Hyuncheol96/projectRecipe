package com.its.member.controller;

import com.its.member.dto.OrderListDTO;
import com.its.member.dto.ProductDTO;
import com.its.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/product")

public class ProductController {
    @Autowired
    private ProductService productService;

    // 관리자페이지 주문내역 화면 이동
    @GetMapping("/orderList-form")
    public String orderListForm(@ModelAttribute OrderListDTO orderListDTO, Model model) {
        List<OrderListDTO> orderListDTOList = productService.orderFindAll();
        model.addAttribute("orderList", orderListDTOList);
        return "product/orderList";
    }

    // 관리자페이지 주문내역 처리
    @PostMapping("/orderList-form")
    public String orderList(@ModelAttribute OrderListDTO orderListDTO, Model model, HttpSession session) {
        productService.orderList(orderListDTO);
        String memberId = (String) session.getAttribute("loginMemberId");
        OrderListDTO order = productService.orderFindById(memberId);
        model.addAttribute("order", order);
        return "product/orderDetail";

    }


    // 관리자페이지 주문현황 처리
//    @PostMapping("/orderList-form")
//    public String orderList(@ModelAttribute OrderListDTO orderListDTO, Model model, HttpSession session) {
//        productService.orderList(orderListDTO);
//        String memberId = (String) session.getAttribute("loginMemberId");
//        OrderListDTO order = productService.orderFindById(memberId);
//        model.addAttribute("order", order);
//        return "product/orderDetail";
//
//    }


//    @PostMapping("/orderList-form")
//    public String orderList(@ModelAttribute OrderListDTO orderListDTO, Model model, HttpSession session) {
//        productService.orderList(orderListDTO);
//        String memberId = (String) session.getAttribute("loginMemberId");
//        List<OrderListDTO> orderListDTOList = productService.orderFindById(memberId);
//        model.addAttribute("orderList", orderListDTOList);
//        return "product/orderDetail";
//
//    }



    // 관리자페이지 상품등록 화면 이동
    @GetMapping("/insert-form")
    public String insertForm() {

        return "product/insert";
    }

    // 관리자페이지 상품등록 처리
    @PostMapping("/insert")
    public String insert(@ModelAttribute ProductDTO productDTO){
        productService.insert(productDTO);
        return "redirect:/product/findAll";
    }

    // 관리자페이지 상품리스트 화면 이동
    @GetMapping("/list-form")
    public String listForm() {

        return "redirect:/product/findAll";
    }


    // 상품목록 조회
    @GetMapping("findAll")
    public String findAll(Model model) {
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "product/list";
    }

    // 관리자페이지 상품수정 화면 이동
    @GetMapping("/update-form")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("update", productDTO);
        return "product/update";
    }



    // 관리자페이지 상품수정 처리
    @PostMapping("/update-form")
    public String update(@ModelAttribute ProductDTO productDTO) {
        productService.update(productDTO);
        return "redirect:/product/findAll?="+productDTO.getId();
    }


    // 관리자페이지 상품삭제 처리
    @GetMapping("/delete-form")
    public String delete(@RequestParam("id") Long id) {
        productService.delete(id);
        return "redirect:/product/findAll";
        }




}
