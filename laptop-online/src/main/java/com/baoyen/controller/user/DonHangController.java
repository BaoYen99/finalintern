package com.baoyen.controller.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.entities.user.ChiTietDonHang;
import com.baoyen.entities.user.ChiTietGioHang;
import com.baoyen.service.user.ChiTietDonHangService;
import com.baoyen.service.user.ChiTietGioHangService;
import com.baoyen.service.user.DonHangService;
import com.baoyen.service.user.GioHangSevice;
import com.baoyen.service.user.SanPhamService;
import com.baoyen.utils.SecurityUtils;

@Controller
public class DonHangController {

	@Autowired
	DonHangService donHangService;
	@Autowired
	ChiTietDonHangService chiTietDonHangService;
	@Autowired
	GioHangSevice gioHangSevice;
	@Autowired
	ChiTietGioHangService chiTietGioHangService;
	@Autowired
	SanPhamService sanPhamService;

	@GetMapping(value = "/user/don-hang")
	public ModelAndView donHang() {
		ModelAndView mv = new ModelAndView("user/donhang");
		return mv;
	}

	@PostMapping(value = "/user/hoan-thanh-dat-hang")
	public ModelAndView hoanThanhDatHang(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("user/donhang");
		HttpSession session = request.getSession();
		Integer idUser = SecurityUtils.getPrincipal().getId();
		String ten = request.getParameter("ten");
		String sdt = request.getParameter("sdt");
		String diachi = request.getParameter("diachi");
		Integer loaihinhthanhtoan=Integer.parseInt(request.getParameter("thanhtoan"));
		Integer idGioHang = Integer.parseInt(request.getParameter("id"));
		Integer idttthanhtoan=0;
		if(loaihinhthanhtoan.equals(1)==true) {
			idttthanhtoan= 2;
		}
		else {
			idttthanhtoan=1;
		}
		if(loaihinhthanhtoan.equals(2)) {
			donHangService.saveDonHang1(diachi, ten, sdt, idUser,idttthanhtoan,2,loaihinhthanhtoan,new Date(),new Date());
		}
		else {
			donHangService.saveDonHang(diachi, ten, sdt, idUser,idttthanhtoan,2,loaihinhthanhtoan,new Date());
		}
		
		Long tongtien = (Long) session.getAttribute("tongtien");
		Object oject = session.getAttribute("cart");

		if (oject != null) {
			@SuppressWarnings("unchecked")
			Map<Integer, ChiTietGioHang> ct = (Map<Integer, ChiTietGioHang>) oject;
			List<ChiTietDonHang> chitiet = new ArrayList<ChiTietDonHang>();
			for (Entry<Integer, ChiTietGioHang> item : ct.entrySet()) {
				ChiTietDonHang chiTietDonHang = new ChiTietDonHang();
				chiTietDonHang.setDonGia(item.getValue().getSanPham().getDonGia());
				chiTietDonHang.setSoLuong(item.getValue().getSoLuong());
				chiTietDonHang.setTongTien(tongtien);
				chiTietDonHang.setSanPham(item.getValue().getSanPham());
				chitiet.add(chiTietDonHang);
			}
			for (ChiTietDonHang it : chitiet) {
				chiTietDonHangService.saveCTDH(it.getDonGia(), it.getSoLuong(), it.getTongTien(),
						donHangService.getIdDonHang(idUser), it.getSanPham().getId());
				sanPhamService.updateSanPhamSl(it.getSanPham().getSoLuongBan() + it.getSoLuong(),
						sanPhamService.getSoLuongKho(it.getSanPham().getId()) - it.getSoLuong(),
						it.getSanPham().getId());
			}

			chiTietGioHangService.deleteById(idGioHang);
			gioHangSevice.deleteById(SecurityUtils.getPrincipal().getId());
			session.removeAttribute("cart");
			session.removeAttribute("tongtien");
			
		}
		return mv;
	}
}
