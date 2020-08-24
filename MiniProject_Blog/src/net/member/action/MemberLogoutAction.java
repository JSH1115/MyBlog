package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)
		throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/BlogEnglish.me");

		return forward;
	}

}
