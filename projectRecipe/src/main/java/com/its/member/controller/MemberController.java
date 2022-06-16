package com.its.member.controller;



import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    // 회원가입 화면 이동
    @GetMapping("/save-form")
    public String saveForm() {

        return "member/save";
    }

    // 회원가입 처리
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


    // 아이디 중복 확인
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("memberId = " + memberId);
        // memberId를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult; // ok.jsp 또는 no.jsp 를 찾음.
    }

    // 로그인 화면 이동
    @GetMapping("/login-form")
    public String loginForm() {
        return "member/login";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        System.out.println("memberDTO = " + memberDTO + ", model = " + model + ", session = " + session);
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "redirect:/";
        } else {
            return "member/loginFail";
        }
    }
    // 로그아웃 처리
    @RequestMapping(value = "/logout-form",method=RequestMethod.GET)
    public String getLogout(HttpSession session) throws Exception{
        session.invalidate();
        return "redirect:/";
    }

    // 회원정보 수정 화면 이동
    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model) {
        // 로그인을 한 상태기 때문에 세션에 id, memberId가 들어있고
        // 여기서 세션에 있는 id를 가져온다.
        Long updateId = (Long) session.getAttribute("loginId");   // getAttribute의 리턴타입을 주기위해 강제 형변환(Long)을 시켜줌.
        System.out.println("updateId = " + updateId);
        // DB에서 해당 회원의 정보를 가져와서 그 정보를 가지고 update.jsp로 이동
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "member/mypage";
    }

    // 회원정보 수정화면 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        boolean updateResult = memberService.update(memberDTO);
        if (updateResult) {
            // 해당 회원의 상세정보
            System.out.println("memberDTO = " + memberDTO);
            return "member/memberDetail";
        } else {
            return "update-fail";
        }
    }

    // 회원정보 수정 처리
    @GetMapping("/mypage")
    public String mypageForm() {
        return "member/mypage";
    }

//    @RequestMapping(value = "/mypage",method=RequestMethod.GET)
//    public String getMypage(HttpSession session) throws Exception{
//        session.invalidate();
//        return "/member/mypage";
//    }

    // 회원정보 수정 완료 화면
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/memberDetail";
    }

    // 관리자 페이지 화면 이동
    @GetMapping("/admin-form")
    public String adminForm() {
        return "member/admin";
    }

    // 관리자페이지 회원목록 화면 이동
    @GetMapping("/memberList-form")
    public String memberListForm() {

        return "redirect:/member/findAll";
    }

    // 회원정보 목록
    @GetMapping("/findAll") // 아래 findAll 안에 Model model = 전체 데이터를 가져가야 하기때문에 사용
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "member/memberList";
    }

    // 삭제처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        boolean deleteResult = memberService.delete(id);
        if (deleteResult) {
            // redirect: 컨트롤러의 메서드에서 다른 메서드의 주소를 호출
            // redirect를 이용하여 findAll 주소 요청
            return "redirect:/member/findAll";
        } else {
            return "delete-fail";
        }
    }




}
