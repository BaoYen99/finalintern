package com.baoyen.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.SanPhamService;

@Controller
public class ChiTietSanPhamController {
	@Autowired
	SanPhamService sanPhamService;
	
	@GetMapping(value = "/user/chi-tiet")
	public ModelAndView chiTietSanPham(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("user/chitietsanpham");
		Integer id = Integer.parseInt(request.getParameter("id"));
		mv.addObject("sanpham", sanPhamService.findById(id));
		return mv;
	}

}
