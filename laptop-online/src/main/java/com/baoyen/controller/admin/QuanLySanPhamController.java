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

import com.baoyen.dto.SanPhamDto;
import com.baoyen.service.user.SanPhamService;

@Controller
public class QuanLySanPhamController {

	@Autowired
	SanPhamService sanPhamService;

	@GetMapping(value = "/admin/quan-ly-san-pham")
	public ModelAndView quanLySanPham(HttpServletRequest request) {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		SanPhamDto sanphamdto = new SanPhamDto();
		sanphamdto.setPage(page);
		sanphamdto.setLimit(limit);

		ModelAndView mav = new ModelAndView("admin/quanlysanpham");

		Pageable pageable = new PageRequest(page - 1, limit);
		sanphamdto.setListResult(sanPhamService.findAll(pageable));
		sanphamdto.setTotalItem(sanPhamService.getTotalItem());
		sanphamdto.setTotalPage((int) Math.ceil((double) sanphamdto.getTotalItem() / sanphamdto.getLimit()));
		mav.addObject("sanpham", sanphamdto);
		return mav;
	}

	@GetMapping(value = "/admin/them-san-pham")
	public ModelAndView themSanPham() {
		ModelAndView mv = new ModelAndView("admin/themsanpham");
		return mv;
	}

	@RequestMapping(value = "/admin/them")
	public ModelAndView them(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/themsanpham");

		

		sanPhamService.saveSanPham(request.getParameter("cpu"), Integer.parseInt(request.getParameter("don_gia")),
				Integer.parseInt(request.getParameter("so_luong_ban")),
				Integer.parseInt(request.getParameter("so_luong_kho")), request.getParameter("dung_luong_pin"),
				request.getParameter("he_dieu_hanh"), request.getParameter("man_hinh"), request.getParameter("ram"),
				request.getParameter("ten_san_pham"), request.getParameter("thiet_ke"),
				request.getParameter("thong_tin_bao_hanh"), request.getParameter("thong_tin_chung"), Integer.parseInt(request.getParameter("id-hang")),
				request.getParameter("anh_san_pham"));

		return mv;
	}

	@GetMapping(value = "/admin/xoa-san-pham")
	public ModelAndView xoaSanPham(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:"+"quan-ly-san-pham?page=1&limit=14");
		Integer id = Integer.parseInt(request.getParameter("id"));
		sanPhamService.deleteById(id);
		return mv;
	}

	@PostMapping(value = "/admin/sua")
	public ModelAndView sua(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/suasanpham");
		sanPhamService.updateSanPham(Integer.parseInt(request.getParameter("don_gia")),Integer.parseInt(request.getParameter("so_luong_kho")), Integer.parseInt(request.getParameter("id")));
		mv.addObject("sanpham", sanPhamService.findById(Integer.parseInt(request.getParameter("id"))));
		mv.addObject("page", request.getParameter("page1"));
		mv.addObject("limit", request.getParameter("limit1"));
		return mv;
	}

	@GetMapping(value = "/admin/sua-san-pham")
	public ModelAndView suaSanPham(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/suasanpham");
		Integer id = Integer.parseInt(request.getParameter("id"));
		mv.addObject("page", request.getParameter("page1"));
		mv.addObject("limit", request.getParameter("limit1"));
		mv.addObject("sanpham", sanPhamService.findById(id));
		return mv;
	}
	@GetMapping(value = "/admin/trang-chu")
	public ModelAndView trangChu(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/trangchu");
		
		return mv;
	}
	
	
}
