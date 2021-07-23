package com.baoyen.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.NguoiDungService;

@Controller
public class LoginController {

	@Autowired
	NguoiDungService nguoiDungService;
	
	@GetMapping(value = "/dang-nhap")
	public ModelAndView dangNhap() {
		ModelAndView mv = new ModelAndView("common/dangnhap");
		return mv;
	}

	@GetMapping(value = "/accessDenied")
	public ModelAndView eror() {
		ModelAndView mv = new ModelAndView("common/dangnhap");
		return mv;
	}
	
}
