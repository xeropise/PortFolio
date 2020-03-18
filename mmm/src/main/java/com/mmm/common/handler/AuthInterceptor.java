package com.mmm.common.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mmm.common.CheckAuth;
import com.mmm.service.domain.User;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("=== [Start] AuthInterceptor ===");
		
		// 1. handler 종류 확인
		// 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크
		if( handler instanceof HandlerMethod == false ) {
			System.out.println(handler instanceof HandlerMethod);
			// return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
			return true;
		}

		// 2.형 변환
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		// 3. @CheckAuth 받아오기
		CheckAuth auth = handlerMethod.getMethodAnnotation(CheckAuth.class);

		// 4. method에 @CheckAuth가 없는 경우, 즉 인증이 필요 없는 요청
		if( auth == null ) {
			System.out.println("=== [Non CheckAuth] AuthInterceptor ===");
			return true;
		}
		
		// 5. @CheckAuth가 있는 경우이므로, 세션이 있는지 체크
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if( user == null ) {
			System.out.println("=== [Null Session] AuthInterceptor ===");
			// 로그인 화면으로 이동
            response.setContentType("text/html");
            response.setCharacterEncoding("utf8");
            response.setStatus(300);
            response.setHeader("Location", "/user/login");
            PrintWriter pw=response.getWriter();
            pw.println("<script>location.href='/user/login';</script>");
            pw.close();
			//response.sendRedirect(request.getContextPath() + "/user/login");
			return false;
		} else {
			
			String checkRole = auth.role(); // @CheckAuth의 Role
			String[] roles = checkRole.split(",");
			String sessionRole = user.getRole(); // Session의 User Role 
			
			System.err.printf("=== checkRole : %s, sessionRole : %s \n", roles, sessionRole);
			
			if(sessionRole.equals("admin")) {
				return true;
			}
			
			boolean chkKey = false;
			
			for(String role : roles) { // 어노테이션에 입력된 롤의 배열
				if(role.equals(sessionRole)) {  // 어노테이션 배열의 롤과 세션의 롤이 일치하면
					chkKey = true; // 체크 키 값을 참으로 변경
				}
			}
			
			if(!chkKey) { // 체크 키의 값이 거짓이면(즉 어노테이션의 롤과 세션의 롤이 일치하는게 없다면) 접속 불가
				response.sendRedirect(request.getContextPath() + "/?status=failed");
				return false;
			}
			
		}
		
		System.out.println("=== [End] AuthInterceptor ===");
		
		// 6. 접근허가, 즉 메서드를 실행하도록 함
		return true;
	}
}