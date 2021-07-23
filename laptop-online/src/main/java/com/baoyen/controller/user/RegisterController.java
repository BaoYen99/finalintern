package com.baoyen.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.NguoiDungService;

@Controller
public class RegisterController {
	@Autowired
	NguoiDungService nguoiDungService;
	
	
	@GetMapping(value = "/dang-ky")
	public ModelAndView dangKy() {
		ModelAndView mv = new ModelAndView("common/dangky");
		return mv;
	}

	@PostMapping(value = "/register")
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String name = request.getParameter("ten");
		String pass = request.getParameter("pass");
		String fullname = request.getParameter("fullname");
		String diachi = request.getParameter("diachi");
		String sdt = request.getParameter("sdt");
		
			if(nguoiDungService.findByTenNguoiDung(name) == true) {
				nguoiDungService.save(diachi, fullname, name, pass, sdt, 2);
				mv.setViewName("redirect:" + "/dang-nhap");
			}
			else {
				mv.setViewName("redirect:" + "/dang-ky");
			}
			
			
		
		
		return mv;
	}
}
