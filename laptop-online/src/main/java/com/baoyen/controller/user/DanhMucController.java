package com.baoyen.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baoyen.dto.SanPhamDto;
import com.baoyen.service.user.DanhMucService;
import com.baoyen.service.user.SanPhamService;

@Controller
public class DanhMucController {

	@Autowired
	DanhMucService danhMucService;

	@Autowired
	SanPhamService sanPhamSevice;

	

	@GetMapping(value = "/user/danh-muc")
	public ModelAndView showList(HttpServletRequest request) {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		SanPhamDto sanphamdto = new SanPhamDto();
		sanphamdto.setPage(page);
		sanphamdto.setLimit(limit);
		
		HttpSession session=request.getSession();
		Integer iddm=(Integer) session.getAttribute("id");
		ModelAndView mav = new ModelAndView("user/danhmuc");
		mav.addObject("danhmuc", danhMucService.findAll());
		Pageable pageable = new PageRequest(page - 1, limit);
		
		if(request.getParameter("id") != null){
			sanphamdto.setListResult(sanPhamSevice.findByDanhMuc(Integer.parseInt(request.getParameter("id")), pageable));
			sanphamdto.setTotalItem(sanPhamSevice.getcountItemById(Integer.parseInt(request.getParameter("id"))));
			
			 
		}
		if(request.getParameter("id") == null) {
			sanphamdto.setListResult(sanPhamSevice.findByDanhMuc(iddm, pageable));
			sanphamdto.setTotalItem(sanPhamSevice.getcountItemById(iddm));
		}
		/* model.setTotalItem(sanPhamSevice.getcountItemById(id)); */
		sanphamdto.setTotalPage((int) Math.ceil((double) sanphamdto.getTotalItem() / sanphamdto.getLimit()));
		mav.addObject("sanpham", sanphamdto);
		return mav;
	}

}
