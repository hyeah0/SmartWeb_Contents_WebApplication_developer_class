package com.---.---;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("/login")
    public String loginForm() {
        return "login_loginForm";
    }

    // -------------------------------- 세션 -----------------------------------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 1. 세션 종료
        session.invalidate();

        // 2. 홈으로 이동
        return "login_index";
    }
    // ------------------------------------------------------------------------------

    @PostMapping("/login")
    public String login(@CookieValue("id") String id,
            String pwd, boolean rememberId, String toURL,
            HttpServletRequest request, HttpServletResponse response) {

        // 1. id, pwd 확인
        // 2. id, pwd 일치시 홈으로 이동,
        // 일치하지 않을 경우 loginForm으로 이동

        // 1. id, pwd 확인
        if (!loginCheck(id, pwd)) {
            String msg = URLEncoder.encode("id또는 pwd가 일치하지 않습니다.");
            return "redirect:/login/login?msg=" + msg;
        }

        // -------------------------------- 세션 -----------------------------------------
        // 1. id,pwd 일치 세션에 저장(섹션객체 얻어와서 세션 객체에 id저장)
        HttpSession session = request.getSession();
        session.setAttribute("id", id);

        // -------------------------------- 쿠키 -----------------------------------------
        // 2. id, pwd 일치시 홈(index)으로 이동,
        // 2-1. 쿠키생성 + id뿌려주고,id기억하기 체크
        // 2-2. 쿠키삭제
        System.out.println(rememberId);

        if (rememberId) {
            System.out.println("기억하기 체크됨");

            // 2-1. 쿠키생성
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(60 * 60 * 24);
            response.addCookie(cookie);

            System.out.println(cookie);

        } else {

            System.out.println("기억하기 체크하지 않음");

            // 2-2. 쿠키삭제
            Cookie cookie = new Cookie("id", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        // ------------------------------------------------------------------------------

        // 게시판 >> 로그인 >> 다시 게시판페이지로 이동하기 위함
        // default : home
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        System.out.println("toURL : " + toURL);

        return "redirect:" + toURL;
    }

    private boolean loginCheck(String id, String pwd) {
        // null 체크 안하도록 등록된 아이디와 비밀번호 먼저 작성
        return "asdf".equals(id) && "1234".equals(pwd);
    }
}
