package org.zerock.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.PatternMatchUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCheckFilter implements Filter {
	
	private static final String[] whiteList = {"/main/main" , "/main/login", "/main/logout" , "/main/join", "/main/login2"};

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
	      HttpServletResponse httpResponse = (HttpServletResponse) response;
	      String requestURI = httpRequest.getRequestURI();
	      try {
	        log.info("인증 체크 필터 시작{}", requestURI);
	        if (isLoginCheckPath(requestURI)) {
	          log.info("인증 체크 로직 실행{}", requestURI);
	          HttpSession session = httpRequest.getSession(false);
	          if (session == null || session.getAttribute("kanrisha_uid") == null) {
	            log.info("미인증 사용자 요청 {}", requestURI);
	            // 로그인으로 redirect
	            httpResponse.sendRedirect("/main/login2");
	            return;
	          }
	        }
	        chain.doFilter(request, response);
	      } catch (Exception e) {
	        throw e;
	      } finally {
	        log.info("인증 체크 필터 종료{}", requestURI);
	      }
	}
	
	private boolean isLoginCheckPath(String requestURI) {
	    return !PatternMatchUtils.simpleMatch(whiteList, requestURI); // 화이트리스크에 있는건 !true = false 체크 안함
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
