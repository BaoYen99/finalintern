package com.baoyen.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.entities.user.ChiTietGioHang;
import com.baoyen.entities.user.SanPham;
import com.baoyen.service.user.ChiTietGioHangService;
import com.baoyen.service.user.GioHangSevice;
import com.baoyen.service.user.NguoiDungService;
import com.baoyen.service.user.SanPhamService;
import com.baoyen.utils.SecurityUtils;

@Controller

public class ChiTietGioHangController {

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	NguoiDungService nguoiDungService;

	@Autowired
	ChiTietGioHangService chiTietGioHangService;

	@Autowired
	GioHangSevice gioHangSevice;

	@GetMapping(value = "/user/xem-gio-hang")
	public ModelAndView themGioHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/giohang");

		HttpSession session = request.getSession();

		int idUser = SecurityUtils.getPrincipal().getId();

		List<ChiTietGioHang> list = chiTietGioHangService.findByIdUser(idUser);
		Map<Integer, ChiTietGioHang> map = new HashMap<Integer, ChiTietGioHang>();

		if(list.size() != 0) {
			for (ChiTietGioHang item : list) {
				map.put(item.getSanPham().getId(), item);

			}
		}
		
		session.setAttribute("cart", map);
		if (gioHangSevice.findByMaNguoidung(idUser) != null) {
			session.setAttribute("tongtien", gioHangSevice.getTongTien(idUser));
		} else {
			session.setAttribute("tongtien", Long.parseLong("0"));
		}

		return mv;
	}

	@GetMapping(value = "/user/gio-hang-remove")
	public ModelAndView gioHangRemove(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/giohang");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("cart");
		SanPham sanPham = sanPhamService.findById(Integer.parseInt(request.getParameter("id")));
		long tongtien = (long) session.getAttribute("tongtien");

		Integer idUser = SecurityUtils.getPrincipal().getId();
		@SuppressWarnings("unchecked")
		Map<Integer, ChiTietGioHang> map = (Map<Integer, ChiTietGioHang>) obj;

		ChiTietGioHang chiTietGioHang = map.get(Integer.parseInt(request.getParameter("id")));

		if (chiTietGioHang.getSoLuong() > 1) {
			chiTietGioHang.setSoLuong(chiTietGioHang.getSoLuong() - 1);
			tongtien -= sanPham.getDonGia();
			chiTietGioHangService.updateSoLuong(chiTietGioHang.getSoLuong(),
					Integer.parseInt(request.getParameter("id")));

		} else {
			tongtien -= sanPham.getDonGia();
			chiTietGioHangService.deleteId(Integer.parseInt(request.getParameter("id")));
			map.remove(Integer.parseInt(request.getParameter("id")));

		}
		if (map.size() == 0) {
			session.setAttribute("tongtien", Long.parseLong("0"));
		}
		session.setAttribute("tongtien", tongtien);
		gioHangSevice.updateGioHang(tongtien, idUser);
		return mv;
	}

	@GetMapping(value = "/user/gio-hang-remove-all")
	public ModelAndView gioHangRemoveAll(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/giohang");
		HttpSession session = request.getSession();
		chiTietGioHangService.deleteById(Integer.parseInt(request.getParameter("id_gio_hang")));
		gioHangSevice.updateGioHang(Long.parseLong("0"), SecurityUtils.getPrincipal().getId());
		session.removeAttribute("cart");
		session.removeAttribute("tongtien");
		return mv;
	}

	@GetMapping(value = "/user/gio-hang")
	public ModelAndView gioHang(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:" + "trang-chu?page=1&limit=15");

		SanPham sanPham = sanPhamService.findById(Integer.parseInt(request.getParameter("id")));
		HttpSession session = request.getSession();
		Integer idUser = SecurityUtils.getPrincipal().getId();		
		
		
		List<ChiTietGioHang> list = chiTietGioHangService.findByIdUser(idUser);
		Map<Integer, ChiTietGioHang> map1 = new HashMap<Integer, ChiTietGioHang>();

		if(list.size() != 0) {
			for (ChiTietGioHang item : list) {
				map1.put(item.getSanPham().getId(), item);

			}
		}
		
		session.setAttribute("cart", map1);
		if (gioHangSevice.findByMaNguoidung(idUser) != null) {
			session.setAttribute("tongtien", gioHangSevice.getTongTien(idUser));
		} else {
			session.setAttribute("tongtien", Long.parseLong("0"));
		}
		
		
		Long tongtien = (Long) session.getAttribute("tongtien");
		if (gioHangSevice.findByMaNguoidung(idUser) == null) {
			gioHangSevice.save(tongtien, idUser);
		} else {
			gioHangSevice.updateGioHang(tongtien, idUser);
		}

		Object obj = session.getAttribute("cart");
		if (obj == null) {

			ChiTietGioHang chiTietGioHang = new ChiTietGioHang();
			chiTietGioHang.setSanPham(sanPham);
			chiTietGioHang.setSoLuong(1);
			tongtien=(long) 0;
			tongtien += sanPham.getDonGia();

			Map<Integer, ChiTietGioHang> map = new HashMap<>();
			
			chiTietGioHangService.saveCtgh(1, gioHangSevice.findByMaNguoidung(idUser).getId(), Integer.parseInt(request.getParameter("id")));
			gioHangSevice.updateGioHang(tongtien, idUser);
			map.put(Integer.parseInt(request.getParameter("id")), chiTietGioHang);
			session.setAttribute("cart", map);

		} else {

			@SuppressWarnings("unchecked")
			Map<Integer, ChiTietGioHang> map = (Map<Integer, ChiTietGioHang>) obj;

			ChiTietGioHang chiTietGioHang = map.get(Integer.parseInt(request.getParameter("id")));

			if (chiTietGioHang == null) {
				chiTietGioHang = new ChiTietGioHang();
				chiTietGioHang.setSanPham(sanPham);
				chiTietGioHang.setSoLuong(1);
				tongtien += sanPham.getDonGia();
				chiTietGioHangService.saveCtgh(1, gioHangSevice.findByMaNguoidung(idUser).getId(),
						Integer.parseInt(request.getParameter("id")));
				map.put(Integer.parseInt(request.getParameter("id")), chiTietGioHang);
				
				gioHangSevice.updateGioHang(tongtien, idUser);
				session.setAttribute("cart", map);

			} else {
				tongtien += sanPham.getDonGia();
				chiTietGioHangService.updateSoLuong(chiTietGioHang.getSoLuong()+1, chiTietGioHang.getId());
				gioHangSevice.updateGioHang(tongtien, idUser);
				session.setAttribute("cart", map);

			}
			
		}

		return mv;
	}

}