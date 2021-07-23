
  package com.baoyen.service.user;
  
  import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baoyen.entities.user.ChiTietGioHang;
import com.baoyen.repositories.user.ChiTietGioHangRepo;
  
  @Service 
  public class ChiTietGioHangService {
  
	  @Autowired 
	  ChiTietGioHangRepo chiTietGioHangRepo;
	  
	  public Integer updateSoLuong(Integer soluong,Integer id) {
		return  chiTietGioHangRepo.updateSoLuong(soluong ,id);
	  }
	  
	  public void deleteId(Integer id) {
		 chiTietGioHangRepo.deleteId(id);
	  }
	  
	  public void deleteAll() {
		  chiTietGioHangRepo.deleteAll();
	  }
	  
	  public void  saveCtgh(Integer sl,Integer magh,Integer masp){
		  chiTietGioHangRepo.saveCtgh(sl, magh, masp);
	  }
	  public List<ChiTietGioHang> findAll(){
		  return chiTietGioHangRepo.findAll();
	  }
	  public ChiTietGioHang findByIdSanPham(Integer idsanpham) {
		  return chiTietGioHangRepo.findByIdSanPham( idsanpham);
	  }
	  
	  public Long size() {
		  return chiTietGioHangRepo.count();
	  }
	  public List<ChiTietGioHang> findByIdUser(Integer mand) {
			return chiTietGioHangRepo.findByIdUser(mand);
		}

	public void deleteById(Integer id) {
		chiTietGioHangRepo.deleteById(id);
		
	}
  }
 