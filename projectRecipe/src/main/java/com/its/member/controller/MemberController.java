package com.its.member.controller;



import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;




@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    // 회원가입 화면 이동
    @GetMapping("/save-form")
    public String saveForm() {

        return "member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "member/login";
        } else {
            return "save-fail";
        }
    }


    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("memberId = " + memberId);
        // memberId를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult; // ok.jsp 또는 no.jsp 를 찾음.
    }



}
