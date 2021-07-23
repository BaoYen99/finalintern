package com.baoyen.service.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.baoyen.dto.SanPhamDto;
import com.baoyen.entities.user.SanPham;
import com.baoyen.repositories.user.SanPhamRepo;

@Service
public class SanPhamService {

	@Autowired
	SanPhamRepo sanPhamRepo;

	public void saveSanPham(String cpu, Integer donGia, Integer soLuongBan, Integer soLuongKho, String dungLuongPin,
			String heDieuHanh, String manHinh, String ram, String teSanPham, String thietKe, String thongTinBaoHanh,
			String thongTinchung, Integer id, String anhSanPham) {

		sanPhamRepo.savesp(cpu, donGia, soLuongBan, soLuongKho, dungLuongPin, heDieuHanh, manHinh, ram, teSanPham, thietKe, thongTinBaoHanh, thongTinchung, id,anhSanPham);
	}

	public List<SanPham> findByDanhMuc(Integer mahang) {
		return sanPhamRepo.findByDanhMuc(mahang);
	}

	public SanPham findById(Integer id) {
		return sanPhamRepo.findById(id);
	}

	public List<SanPham> findAll() {
		return sanPhamRepo.findAll();
	}

	public void delete(Integer id) {
		sanPhamRepo.delete(id);
	}
	public Integer getSoLuongKho(Integer id) {
		return sanPhamRepo.getSoLuongKho(id);
	}
	public void updateSanPham(Integer dg,Integer slkho,Integer id ) {
		sanPhamRepo.updateSanPham( dg, slkho, id);
	}
	public void updateSanPhamSl(Integer slban,Integer slkho,Integer id ) {
		sanPhamRepo.updateSanPhamSl(slban, slkho, id);
	}
	public List<SanPham> getSanPhamByName(String ten){
		return sanPhamRepo.getSanPhamByName(ten);
	}
	public List<SanPhamDto> findAll(Pageable pageable) {
		List<SanPhamDto> sanpham = new ArrayList<>();
		List<SanPham> entities = sanPhamRepo.findAll(pageable).getContent();
		for (SanPham item : entities) {
			SanPhamDto sanPhamDTO = new SanPhamDto();
			sanPhamDTO.setAnhSanPham(item.getAnhSanPham());
			sanPhamDTO.setCpu(item.getCpu());
			sanPhamDTO.setDanhMuc(item.getDanhMuc());
			sanPhamDTO.setDonGia(item.getDonGia());
			sanPhamDTO.setDungLuongPin(item.getDungLuongPin());
			sanPhamDTO.setHeDieuHanh(item.getHeDieuHanh());
			sanPhamDTO.setManHinh(item.getManHinh());
			sanPhamDTO.setId(item.getId());
			sanPhamDTO.setRam(item.getRam());
			sanPhamDTO.setSoLuongBan(item.getSoLuongBan());
			sanPhamDTO.setSoLuongKho(item.getSoLuongKho());
			sanPhamDTO.setTeSanPham(item.getTeSanPham());
			sanPhamDTO.setThietKe(item.getThietKe());
			sanPhamDTO.setThongTinBaoHanh(item.getThongTinBaoHanh());
			sanPhamDTO.setThongTinchung(item.getThongTinchung());
			
			sanpham.add(sanPhamDTO);

		}
		return sanpham;
	}

	public List<SanPhamDto> findByDanhMuc(Integer id, Pageable pageable) {
		List<SanPhamDto> sanpham = new ArrayList<>();
		List<SanPham> entities = sanPhamRepo.findByIdDanhMuc(id, pageable).getContent();

		for (SanPham item : entities) {
			SanPhamDto sanPhamDTO = new SanPhamDto();
			sanPhamDTO.setAnhSanPham(item.getAnhSanPham());
			sanPhamDTO.setCpu(item.getCpu());
			sanPhamDTO.setDanhMuc(item.getDanhMuc());
			sanPhamDTO.setDonGia(item.getDonGia());
			sanPhamDTO.setDungLuongPin(item.getDungLuongPin());
			sanPhamDTO.setHeDieuHanh(item.getHeDieuHanh());
			sanPhamDTO.setManHinh(item.getManHinh());
			sanPhamDTO.setId(item.getId());
			sanPhamDTO.setRam(item.getRam());
			sanPhamDTO.setSoLuongBan(item.getSoLuongBan());
			sanPhamDTO.setSoLuongKho(item.getSoLuongKho());
			sanPhamDTO.setTeSanPham(item.getTeSanPham());
			sanPhamDTO.setThietKe(item.getThietKe());
			sanPhamDTO.setThongTinBaoHanh(item.getThongTinBaoHanh());
			sanPhamDTO.setThongTinchung(item.getThongTinchung());
			

			sanpham.add(sanPhamDTO);

		}
		return sanpham;

	}

	public int getcountItemById(Integer id) {
		return sanPhamRepo.countId(id);
	}

	public int getTotalItem() {

		return (int) sanPhamRepo.count();
	}

	public void deleteById(Integer id) {
		sanPhamRepo.deleteById(id);
		
	}
}
