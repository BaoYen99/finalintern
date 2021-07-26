package com.baoyen.controller.shipper;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.NguoiDungService;
import com.baoyen.utils.SecurityUtils;

@Controller
public class SuaThongTinShipper {

	@Autowired
	NguoiDungService nguoiDungServive;
	
	@GetMapping(value = "shipper/sua-thong-tin")
	public ModelAndView suaThongTin() {
		ModelAndView mv=new ModelAndView("shipper/suathongtinnguoidung");
		mv.addObject("nguoidung",nguoiDungServive.findById(SecurityUtils.getPrincipal().getId()));
		return mv;
	}
	@PostMapping(value = "shipper/sua")
	public ModelAndView sua(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("shipper/suathongtinnguoidung");
		nguoiDungServive.updateNguoiDung(request.getParameter("diaChi"), request.getParameter("fullname"), request.getParameter("ten_user"),
				request.getParameter("pass"), request.getParameter("sdt"),SecurityUtils.getPrincipal().getId());
		mv.addObject("nguoidung",nguoiDungServive.findById(SecurityUtils.getPrincipal().getId()));
		return mv;
		
	}
}
