package com.baoyen.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.DonHangService;
import com.baoyen.service.user.NguoiDungService;
import com.baoyen.service.user.SanPhamService;

@Controller
public class SearchController {

	@Autowired
	NguoiDungService nguoiDungService;
	
	@Autowired
	DonHangService donHangService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@PostMapping(value = "admin/search")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView();
		request.getParameter("luachon");
		if(request.getParameter("luachon").equals("2")) {
			mv =  new ModelAndView("admin/search");
			mv.addObject("sanpham", sanPhamService.getSanPhamByName(request.getParameter("search")));
		}if(request.getParameter("luachon").equals("1")) {
			mv =  new ModelAndView("admin/search");
			mv.addObject("nguoidung", nguoiDungService.getNguoiDungByUserName(request.getParameter("search")));
		}
		
		if(request.getParameter("luachon").equals("3")) {
			mv =  new ModelAndView("admin/search");
			mv.addObject("donhang", donHangService.getDonHangByUserName(request.getParameter("search")));
		}
		
		return mv;
	}
}
