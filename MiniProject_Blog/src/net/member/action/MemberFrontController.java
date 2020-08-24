package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends javax.servlet.http.HttpServlet 
	implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException {
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = RequestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			System.out.println("RequestURI = " + RequestURI);
			System.out.println("contextPath = " + contextPath);
			System.out.println("command = " + command);
			if(command.equals("/")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/myBlog_english.jsp");
			} else if(command.equals("/BlogEnglish.me")) { 
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/myBlog_english.jsp");
			} else if(command.equals("/BlogKorean.me")) { 
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/myBlog_korean.jsp");
			} else if(command.equals("/MemberLogin.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/loginForm.jsp");
			} else if(command.equals("/MemberJoin.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/joinForm.jsp");
			} else if(command.equals("/SendMail.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/sendMail.jsp");
			} else if(command.equals("/MemberList.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/member_list.jsp");
			} else if(command.equals("/MemberView.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/member_info.jsp");
			} else if(command.equals("/MemberUpdate.me")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/member_update.jsp");
			}
			
			else if(command.equals("/MemberLoginAction.me")) {
				action = new MemberLoginAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else if(command.equals("/MemberJoinAction.me")) {
				action = new MemberJoinAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/MemberListAction.me")) {
				action = new MemberListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else if(command.equals("/MemberViewAction.me")) {
				action = new MemberViewAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else if(command.equals("/MemberDeleteAction.me")) {
				action = new MemberDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/MemberLogoutAction.me")) {
				action = new MemberLogoutAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/MemberUpdateAction.me")) {
				action = new MemberUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/MemberUpdateCompleteAction.me")) {
				action = new MemberUpdateCompleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());  
				} else {
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response); 
				}
			}
		
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException {
		doProcess(request, response);
	}
}
