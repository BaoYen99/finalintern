package com.baoyen.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.dto.NguoiDungDto;
import com.baoyen.service.user.NguoiDungService;

@Controller
public class QuanLyNguoiDungController {

	@Autowired
	NguoiDungService nguoiDungService;
	
	@RequestMapping(value = "admin/quan-ly-nguoi-dung")
	public ModelAndView nguoiDung(HttpServletRequest request) {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		NguoiDungDto nguoiDungDto = new NguoiDungDto();
		nguoiDungDto.setPage(page);
		nguoiDungDto.setLimit(limit);

		ModelAndView mav = new ModelAndView("admin/quanlynguoidung");

		Pageable pageable = new PageRequest(page - 1, limit);
		nguoiDungDto.setListResult(nguoiDungService.findAll(pageable));
		nguoiDungDto.setTotalItem(nguoiDungService.getTotalItem());
		nguoiDungDto.setTotalPage((int) Math.ceil((double) nguoiDungDto.getTotalItem() / nguoiDungDto.getLimit()));
		mav.addObject("nguoidung", nguoiDungDto);
		return mav;
	}
	
	@GetMapping(value = "admin/them-admin")
	public ModelAndView ThemAdmin() {
		ModelAndView mv=new ModelAndView("admin/themadmin");
		return mv;
	}
	
	@PostMapping(value = "admin/them-admin-new")
	public ModelAndView them(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("admin/themadmin");
		String name = request.getParameter("ten");
		String pass = request.getParameter("pass");
		String fullname = request.getParameter("fullname");
		String diachi = request.getParameter("diachi");
		String sdt = request.getParameter("sdt");
		
			if(nguoiDungService.findByTenNguoiDung(name) == true) {
				nguoiDungService.save(diachi, fullname, name, pass, sdt, 1);
				
			}
			else {
				request.setAttribute("err", "Tên Admin Đã Tồn Tại");
			}
			
		return mv;
	}
}
