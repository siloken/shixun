package cn.edu.cqupt.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.cqupt.domain.MyUser;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class UserLoginFilter extends UsernamePasswordAuthenticationFilter {

    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        logger.debug("attemptAuthentication(HttpServletRequest, HttpServletResponse) - start"); //$NON-NLS-1$

        String username = obtainUsername(request).toUpperCase().trim();
        String password = obtainPassword(request);
        Authentication returnAuthentication = null;
        try {
            UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
            returnAuthentication = this.getAuthenticationManager().authenticate(authRequest);
        } catch (Exception e) {
            logger.error(e);
            throw e;
        }

        logger.debug("attemptAuthentication(HttpServletRequest, HttpServletResponse) - end"); //$NON-NLS-1$
        return returnAuthentication;
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request,
                                            HttpServletResponse response,
                                            FilterChain chain,
                                            Authentication authResult) throws IOException, ServletException {
        logger.debug("successfulAuthentication(HttpServletRequest, HttpServletResponse, FilterChain, Authentication) - start"); //$NON-NLS-1$
        super.successfulAuthentication(request, response, chain, authResult);
        MyUser user = (MyUser) authResult.getPrincipal();

        //cookie记录登录信息
        Cookie nameCookie = new Cookie("username", user.getUsername());
        nameCookie.setPath("/");
        nameCookie.setSecure(false);
        Cookie roleCookie = new Cookie("roleName", user.getRoleName());
        roleCookie.setPath("/");
        roleCookie.setSecure(false);
        response.addCookie(nameCookie);
        response.addCookie(roleCookie);

        //HttpSession标记用户身份
        HttpSession session = request.getSession();
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("roleId", user.getRoleId());

        System.out.println("login success");
        logger.debug("登录成功！");
        logger.debug("successfulAuthentication(HttpServletRequest, HttpServletResponse, FilterChain, Authentication) - end"); //$NON-NLS-1$
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request,
                                              HttpServletResponse response, AuthenticationException failed)
            throws IOException, ServletException {
        logger.debug("unsuccessfulAuthentication(HttpServletRequest, HttpServletResponse, AuthenticationException) - start"); //$NON-NLS-1$
        super.unsuccessfulAuthentication(request, response, failed);
        System.out.println("login fail");
        logger.debug("登录失败！");
        logger.debug("unsuccessfulAuthentication(HttpServletRequest, HttpServletResponse, AuthenticationException) - end"); //$NON-NLS-1$
    }

}
