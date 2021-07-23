package com.baoyen.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.dto.DonHangDto;
import com.baoyen.entities.user.ChiTietDonHang;
import com.baoyen.service.user.ChiTietDonHangService;
import com.baoyen.service.user.DonHangService;

@Controller
public class QuanLyDonHangController {
	@Autowired
	ChiTietDonHangService chiTietDonHangService;
	
	@Autowired
	DonHangService donHangService;
	
	@GetMapping(value = "admin/quan-ly-don-hang")
	public ModelAndView showDonHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/quanlydonhang");
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		DonHangDto donhangdto = new DonHangDto();
		donhangdto.setPage(page);
		donhangdto.setLimit(limit);

		Pageable pageable = new PageRequest(page - 1, limit);
		donhangdto.setListResult(donHangService.findAll(pageable));
		donhangdto.setTotalItem(donHangService.getTotalItem());
		donhangdto.setTotalPage((int) Math.ceil((double) donhangdto.getTotalItem() / donhangdto.getLimit()));
		mv.addObject("donhang", donhangdto);
		
		return mv;
	}
	@GetMapping(value = "admin/xem-chi-tiet-don-hang")
	public ModelAndView chiTietDonHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/chitietdonhang");
		Integer id_don_hang=Integer.parseInt(request.getParameter("id_don_hang"));
		mv.addObject("page", request.getParameter("page1"));
		mv.addObject("limit", request.getParameter("limit1"));
		mv.addObject("chitietdonhang",chiTietDonHangService.getByMaGioHang(id_don_hang));
		return mv;
	}
	
	@GetMapping(value = "admin/xoa-don-hang")
	public ModelAndView xoaDonHang(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("redirect:" + "quan-ly-don-hang?page=1&limit=12");
		Integer id_don_hang=Integer.parseInt(request.getParameter("id"));
		
	List<ChiTietDonHang> list=	chiTietDonHangService.getByMaGioHang(id_don_hang);
		for (ChiTietDonHang item:list) {
			chiTietDonHangService.deleteById(item.getId());
		}
		
		donHangService.deleteById(id_don_hang);
		
		return mv;
	}
	
	@GetMapping(value = "admin/sua-don-hang")
	public ModelAndView SuaDonHang(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("admin/suadonhang");
		Integer id_don_hang=Integer.parseInt(request.getParameter("iddonhang"));
		mv.addObject("page", request.getParameter("page1"));
		mv.addObject("limit", request.getParameter("limit1"));
		mv.addObject("donhang",donHangService.findById(id_don_hang));
		return mv;
	}
	
	@PostMapping(value = "admin/sua-dh")
	public ModelAndView Sua(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("admin/suadonhang");
		Integer id_don_hang=Integer.parseInt(request.getParameter("id"));
		Integer ttdh= Integer.parseInt(request.getParameter("id-ttdonhang"));
		Integer tttt=Integer.parseInt(request.getParameter("id-ttthanhtoan"));
		Integer idphuongthucthanhtoan=Integer.parseInt(request.getParameter("idphuongthucthanhtoan"));
		if(ttdh.equals(1) && tttt.equals(1) && idphuongthucthanhtoan.equals(1)) {
			donHangService.updatett2(ttdh,tttt,id_don_hang,new Date(),new Date());
		}
		else if(ttdh.equals(1) && tttt.equals(1) ) {
			donHangService.updatett1(ttdh,tttt,id_don_hang,new Date());
		}
		else {
			donHangService.updatett(ttdh,tttt,id_don_hang);
		}
		mv.addObject("page", request.getParameter("page1"));
		mv.addObject("limit", request.getParameter("limit1"));
		mv.addObject("donhang",donHangService.findById(id_don_hang));
		return mv;
	}
}
