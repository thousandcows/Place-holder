package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotelDAO;
import dao.ImgFileDAO;
import dao.UserDAO;
import dto.HotelImgDTO;
import dto.HotelLikeImgDTO;

@WebServlet("*.home")
public class PageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 기본세팅
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println(cmd); // 경로 잘 들어오나 확인용

		// 미리 세팅
		UserDAO udao = UserDAO.getInstance();
		HotelDAO hdao = HotelDAO.getInstance();
		ImgFileDAO idao = ImgFileDAO.getInstance();

		// 들어오는 경로값에 따라 보내주는 곳
		try {
			if (cmd.equals("/main.home")) {
				// 인덱스용 진규 수정

				List<HotelLikeImgDTO> hotelList = hdao.selectHotel();
				request.setAttribute("hotelList", hotelList);

				request.getRequestDispatcher("/index2.jsp").forward(request, response);
			} else if (cmd.equals("/mypage.home")) {
				// 넘겨줘야할 정보 => 호텔 3개와 리뷰 6개
				// 호텔 3개
				List<HotelLikeImgDTO> hotelList = hdao.selectHotelB(11, 13);
				List<HotelImgDTO> hotelImgList = idao.selectHotelImgB(11, 13);
				// 리뷰 6개

				// 빠른예약용 모든호텔 정보 보내주기
				List<HotelLikeImgDTO> hotelListS = hdao.selectHotel();
				request.setAttribute("hotelListS", hotelListS);

				// 전달
				request.setAttribute("hotelList", hotelList);
				request.setAttribute("hotelImgList", hotelImgList);
				request.getRequestDispatcher("/views/member/mypage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}