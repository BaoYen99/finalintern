package com.baoyen.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.dto.SanPhamDto;
import com.baoyen.service.user.DanhMucService;
import com.baoyen.service.user.GioHangSevice;
import com.baoyen.service.user.SanPhamService;

@Controller

public class Home {

	@Autowired
	DanhMucService danhMucService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	GioHangSevice gioHangSevice;

	

	@GetMapping(value = { "/", "/user/trang-chu" })
	public ModelAndView showList(HttpServletRequest request) {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		SanPhamDto sanphamdto = new SanPhamDto();
		sanphamdto.setPage(page);
		sanphamdto.setLimit(limit);

		ModelAndView mav = new ModelAndView("user/trangchu");
		mav.addObject("danhmuc", danhMucService.findAll());
		Pageable pageable = new PageRequest(page - 1, limit);
		sanphamdto.setListResult(sanPhamService.findAll(pageable));
		sanphamdto.setTotalItem(sanPhamService.getTotalItem());
		sanphamdto.setTotalPage((int) Math.ceil((double) sanphamdto.getTotalItem() / sanphamdto.getLimit()));
		mav.addObject("sanpham", sanphamdto);
		return mav;
	}

}
