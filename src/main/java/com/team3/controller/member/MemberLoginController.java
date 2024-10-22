package com.team3.controller.member;

import com.team3.controller.HomeController;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberLoginController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		// System.out.println("로그인(get)");
		super.gotoPage("member/memLoginForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		// System.out.println("로그인(post)");
		String id = request.getParameter("memid");
		String password = request.getParameter("mempwd");

		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByPk(id, password);

		if (bean == null) { // 로그인 실패
			String message = "로그인 정보가 잘못 되었습니다.";
			super.setAlertMessage(message);
			super.gotoPage("member/memLoginForm.jsp");

		} else { // 로그인 성공
					// 이 코드는 common.jsp 파일에서 whologin 값을 설정하는 데 사용됩니다.
			super.session.setAttribute("loginfo", bean);

			// 홈 화면으로 이동합니다. 차후 상품 목록 페이지로 변경할 예정입니다.
			new HomeController().doGet(request, response);
		}
	}
}
