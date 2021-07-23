package com.baoyen.service.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.baoyen.dto.DonHangDto;
import com.baoyen.entities.user.DonHang;
import com.baoyen.entities.user.NguoiDung;
import com.baoyen.repositories.user.DonHangRepo;
import com.baoyen.repositories.user.NguoiDungRepo;

@Service
public class DonHangService {

	@Autowired
	DonHangRepo donHangRepo;
	
	public void saveDonHang(String dc,String ten,String std,Integer manguoidung,Integer tttt, Integer ttdh,Integer lhtt,Date ngay) {
		donHangRepo.saveDonHang(dc, ten, std, manguoidung,tttt,ttdh,lhtt,ngay);
	}
	
	public Integer getIdDonHang(Integer ma) {
		return donHangRepo.getIdDonHang(ma);
	}
	public List<DonHang> findAll(){
		return donHangRepo.findAll();
	}
	public List<DonHangDto> findAll(Pageable pageable) {
		List<DonHangDto> donhangDto = new ArrayList<DonHangDto>();
		List<DonHang> entities = donHangRepo.findAll(pageable).getContent();
		
		for (DonHang item : entities) {
			DonHangDto dh = new DonHangDto();
			dh.setId(item.getId());
			dh.setDiaChiNhan(item.getDiaChiNhan());
			dh.setHoTen(item.getHoTen());
			dh.setSdt(item.getSdt());
			dh.setNguoiDung(item.getNguoiDung());
			dh.setTrangThaiThanhToan(item.getTrangThaiThanhToan());
			dh.setTrangThaiDonHang(item.getTrangThaiDonHang());
			dh.setPhuongThucThanhToan(item.getPhuongThucThanhToan());
			dh.setNgayDatHang(item.getNgayDatHang());
			dh.setNgayNhanHang(item.getNgayNhanHang());
			dh.setNgayThanhToan(item.getNgayThanhToan());
			dh.setIdShipper(item.getIdShipper());
			donhangDto.add(dh);
		}
		
		return donhangDto;
	}
	public List<DonHangDto> findByShipper() {
		List<DonHangDto> donhangDto = new ArrayList<DonHangDto>();
		List<DonHang> entities = donHangRepo.findByShipper();
		
		for (DonHang item : entities) {
			DonHangDto dh = new DonHangDto();
			dh.setId(item.getId());
			dh.setDiaChiNhan(item.getDiaChiNhan());
			dh.setHoTen(item.getHoTen());
			dh.setSdt(item.getSdt());
			dh.setNguoiDung(item.getNguoiDung());
			dh.setTrangThaiThanhToan(item.getTrangThaiThanhToan());
			dh.setTrangThaiDonHang(item.getTrangThaiDonHang());
			dh.setPhuongThucThanhToan(item.getPhuongThucThanhToan());
			dh.setNgayDatHang(item.getNgayDatHang());
			dh.setNgayNhanHang(item.getNgayNhanHang());
			dh.setNgayThanhToan(item.getNgayThanhToan());
			dh.setIdShipper(item.getIdShipper());
			donhangDto.add(dh);
		}
		
		return donhangDto;
	}
 public  List<DonHang>	findByIdShipper(Integer id){
	 return donHangRepo.findByIdShipper(id);
 }
	public int getTotalItem() {
		return (int) donHangRepo.count();
	}

	public void deleteById(Integer id) {
		donHangRepo.deleteById(id);
		
	}

	public DonHang findById(Integer id) {
		return donHangRepo.findById(id);
		
	}
	public void updatett1(Integer ttdh,Integer tttt,Integer id,Date date) {
		donHangRepo.updatett1(ttdh,tttt,id,date);
		
	}

	public void updatett(Integer ttdh,Integer tttt,Integer id) {
		donHangRepo.updatett(ttdh,tttt,id);
		
	}

	public List<DonHang> getDonHangByUserName(String username) {
		// TODO Auto-generated method stub
		return donHangRepo.getDonHangByUserName(username);
	}

	public void saveDonHang1(String dc,String ten,String std,Integer manguoidung,Integer tttt, Integer ttdh,Integer lhtt,Date ngay ,Date date2) {
		donHangRepo.saveDonHang1(dc, ten, std, manguoidung,tttt,ttdh,lhtt,ngay,date2);
		
	}

	public void updatett2(Integer ttdh, Integer tttt, Integer id_don_hang, Date date, Date date2) {
		donHangRepo.updatett2(ttdh,tttt,id_don_hang,date,date2);
		
	}
	public void updateshipper(Integer idshipper,Integer id) {
		donHangRepo.updateshipper(idshipper, id);
	}

	
}
