package com.koreaIT.java.am;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/doDelete")
public class ArticleDoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8;");
		
		HttpSession session = request.getSession();
		
		Connection conn = null;

		try {
			Class.forName(Config.getDBDriverName());
			
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassWd());
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			SecSql sql = SecSql.from("SELECT * FROM article");
			sql.append("WHERE id = ?", id);
			
			Map<String, Object> articleRow = DBUtil.selectRow(conn, sql);
			
			int loginedMemberId = -1;
			
			if (articleRow.isEmpty()) {
				response.getWriter().append(String.format("<script>alert('존재하지 않는 게시물입니다.'); location.replace('list');</script>"));
				return;
			}
			
			if (session.getAttribute("loginedMemberId") != null) {
				loginedMemberId = (int) session.getAttribute("loginedMemberId");
			}
			
			if (loginedMemberId != (int) articleRow.get("memberId")) {
				
				response.getWriter().append(String.format("<script>alert('권한이 없습니다.'); location.replace('../article/detail?id=%d');</script>", articleRow.get("id")));
				
				return;
			}
			
			sql = SecSql.from("DELETE FROM article");
			sql.append("WHERE id = ?", id);
			
			DBUtil.delete(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%d번 글이 삭제 되었습니다.'); location.replace('list');</script>",id));
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}