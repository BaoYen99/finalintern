package com.baoyen.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baoyen.entities.user.ChiTietDonHang;
import com.baoyen.repositories.user.ChiTietDonHangRepo;

@Service
public class ChiTietDonHangService {
	@Autowired
	ChiTietDonHangRepo chiTietDonHangRepo;

	public void saveCTDH(Integer dg, Integer sl, Long tt, Integer madonhang, Integer masanpham) {
		chiTietDonHangRepo.saveCTDH(dg, sl, tt, madonhang, masanpham);
	}

	public List<ChiTietDonHang> getByMaGioHang(Integer ma){
		return chiTietDonHangRepo.getByMaGioHang(ma);
	}

	public void deleteById(Integer id) {
		chiTietDonHangRepo.deleteById(id);
		
	}
	
}
