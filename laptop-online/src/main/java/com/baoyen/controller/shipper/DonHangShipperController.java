package com.baoyen.controller.shipper;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.service.user.ChiTietDonHangService;
import com.baoyen.service.user.DonHangService;
import com.baoyen.utils.SecurityUtils;

@Controller
public class DonHangShipperController {

	@Autowired
	DonHangService donHangService;
	
	@Autowired
	ChiTietDonHangService chiTietDonHangService;
	
	@GetMapping(value = "shipper/xem-don-hang")
	public ModelAndView showDonHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("shipper/xemdonhang");
		mv.addObject("xemdonhang", "1");
		mv.addObject("donhang",donHangService.findByShipper());
		
		return mv;
	}
	@GetMapping(value = "shipper/luu-don-hang")
	public ModelAndView luuDonHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("shipper/xemdonhang");
		mv.addObject("xemdonhang", "1");
		Integer iddonhang=Integer.parseInt(request.getParameter("id_don_hang"));
		donHangService.updateshipper(SecurityUtils.getPrincipal().getId(), iddonhang);
		mv.addObject("donhang", donHangService.findByShipper());
		
		return mv;
	}
	@GetMapping(value = "shipper/xem-don-hang-da-chon")
	public ModelAndView showDonHangDaChon(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("shipper/donhangdanhan");
		mv.addObject("xemdonhang", "2");
		mv.addObject("donhang",donHangService.findByIdShipper(SecurityUtils.getPrincipal().getId()));
		return mv;
	}
	@GetMapping(value = "shipper/sua-don-hang")
	public ModelAndView SuaDonHang(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("shipper/suadonhang");
		Integer id_don_hang=Integer.parseInt(request.getParameter("iddonhang"));
		mv.addObject("donhang",donHangService.findById(id_don_hang));
		return mv;
	}
	
	@PostMapping(value = "shipper/sua-dh")
	public ModelAndView Sua(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("shipper/suadonhang");
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
		
		mv.addObject("donhang",donHangService.findById(id_don_hang));
		return mv;
	}
	
	@GetMapping(value = "shipper/xoa-khoi-chon")
	public ModelAndView xoakhoichon(HttpServletRequest request) {
		 ModelAndView mv =new ModelAndView("shipper/donhangdanhan");
		 Integer id_don_hang=Integer.parseInt(request.getParameter("iddonhang"));
		 donHangService.updateShipperNull(id_don_hang);
		 mv.addObject("xemdonhang", "2");
		mv.addObject("donhang",donHangService.findByIdShipper(SecurityUtils.getPrincipal().getId()));
		 return mv;
	}
	
	@GetMapping(value = "shipper/xem-chi-tiet-don-hang")
	public ModelAndView chiTietDonHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("shipper/chitietdonhang");
		Integer id_don_hang=Integer.parseInt(request.getParameter("id_don_hang"));
		mv.addObject("xemdonhang", request.getParameter("xemdonhang"));
		mv.addObject("chitietdonhang",chiTietDonHangService.getByMaGioHang(id_don_hang));
		return mv;
	}
}
