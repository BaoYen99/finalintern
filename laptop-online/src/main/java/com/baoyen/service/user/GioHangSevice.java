package com.baoyen.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baoyen.entities.user.GioHang;
import com.baoyen.repositories.user.GioHangRepo;

@Service
public class GioHangSevice {
	@Autowired
	GioHangRepo  gioHangRepo;
	
	public void save(Long tongtien,Integer manguoidung) {
		
		gioHangRepo.save(tongtien,manguoidung);
	}
	
	public GioHang findByMaNguoidung(Integer ma) {
		return gioHangRepo.findByMaNguoiDung(ma);
	}
	
	public void updateGioHang(Long tongtien,Integer mand) {
		gioHangRepo.updateGioHang(tongtien,mand);
	}
	public boolean checkUser(Integer id) {
		if(gioHangRepo.findByMadung(id).equals(null)==true) {
			return false;
		}
		return true;
	}
	public Long getTongTien(Integer mand) {
		return gioHangRepo.getTongTien(mand);
	}

	public void deleteById(Integer id) {
		gioHangRepo.deleteByIdUser(id);
		
	}
}
