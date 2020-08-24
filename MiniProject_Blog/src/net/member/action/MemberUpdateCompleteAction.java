package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateCompleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)
		throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		boolean result = false;
		
		member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
		member.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
		member.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
		member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
		
		result = memberdao.updateMember(member);
		
		if(result == false) {
			System.out.println("수정 실패");
			return null;
		}
		
		forward.setRedirect(true);
		forward.setPath("./MemberListAction.me");
		return forward;
	}

}
