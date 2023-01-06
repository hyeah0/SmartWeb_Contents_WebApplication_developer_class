package com.---.---;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/list")
    public String list(HttpServletRequest request) {

        // 1. 만약 로그인이 되어있지 않으면 로그인 화면으로 이동
        if (!loginCheck(request)) {
            return "redirect:/login/login?toURL=" + request.getRequestURL();

        }

        // 로그인시 게시판 화면으로 이동
        return "login_boardList";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻는다.
        // 2. 세션에 id가 있는지 확인

        // 1. 세션을 얻는다.
        HttpSession session = request.getSession();

        // 2. 세션에 id가 있는지 확인
        /*
         * if(session.getAttribute("id")!=null) {
         * return true;
         * }else {
         * return false;
         * }
         */

        // 상단 2번을 간략하게 사용시
        // 아이디가 있으면 true
        return session.getAttribute("id") != null;
    }
}
