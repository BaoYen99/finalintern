package com.baoyen.dto;

import java.util.Set;

import com.baoyen.entities.user.ChiTietGioHang;
import com.baoyen.entities.user.DanhMuc;

public class SanPhamDto extends AbtractDto<SanPhamDto>{

	private Integer id;

	private String cpu;

	private Integer donGia;

	private Integer soLuongBan;

	private Integer soLuongKho;

	private String dungLuongPin;

	private String heDieuHanh;

	private String manHinh;

	private String ram;

	private String teSanPham;

	private String thietKe;

	private String thongTinBaoHanh;

	private String thongTinchung;

	private DanhMuc danhMuc;

	private String anhSanPham;

	public Set<ChiTietGioHang> chiTietGioHang;
	

	public SanPhamDto() {
		// TODO Auto-generated constructor stub
	}

	public SanPhamDto( String cpu, Integer donGia, Integer soLuongBan, Integer soLuongKho,
			String dungLuongPin, String heDieuHanh, String manHinh, String ram, String teSanPham, String thietKe,
			String thongTinBaoHanh, String thongTinchung,String anhSanPham) {
		super();
		this.cpu = cpu;
		this.donGia = donGia;
		this.soLuongBan = soLuongBan;
		this.soLuongKho = soLuongKho;
		this.dungLuongPin = dungLuongPin;
		this.heDieuHanh = heDieuHanh;
		this.manHinh = manHinh;
		this.ram = ram;
		this.teSanPham = teSanPham;
		this.thietKe = thietKe;
		this.thongTinBaoHanh = thongTinBaoHanh;
		this.thongTinchung = thongTinchung;
		this.anhSanPham = anhSanPham;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public Integer getDonGia() {
		return donGia;
	}

	public void setDonGia(Integer donGia) {
		this.donGia = donGia;
	}

	public Integer getSoLuongBan() {
		return soLuongBan;
	}

	public void setSoLuongBan(Integer soLuongBan) {
		this.soLuongBan = soLuongBan;
	}

	public Integer getSoLuongKho() {
		return soLuongKho;
	}

	public void setSoLuongKho(Integer soLuongKho) {
		this.soLuongKho = soLuongKho;
	}

	public String getDungLuongPin() {
		return dungLuongPin;
	}
	
	public void setDungLuongPin(String dungLuongPin) {
		this.dungLuongPin = dungLuongPin;
	}

	public String getHeDieuHanh() {
		return heDieuHanh;
	}

	public void setHeDieuHanh(String heDieuHanh) {
		this.heDieuHanh = heDieuHanh;
	}

	public String getManHinh() {
		return manHinh;
	}

	public void setManHinh(String manHinh) {
		this.manHinh = manHinh;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getTeSanPham() {
		return teSanPham;
	}

	public void setTeSanPham(String teSanPham) {
		this.teSanPham = teSanPham;
	}

	public String getThietKe() {
		return thietKe;
	}

	public void setThietKe(String thietKe) {
		this.thietKe = thietKe;
	}

	public String getThongTinBaoHanh() {
		return thongTinBaoHanh;
	}

	public void setThongTinBaoHanh(String thongTinBaoHanh) {
		this.thongTinBaoHanh = thongTinBaoHanh;
	}

	public String getThongTinchung() {
		return thongTinchung;
	}

	public void setThongTinchung(String thongTinchung) {
		this.thongTinchung = thongTinchung;
	}

	public DanhMuc getDanhMuc() {
		return danhMuc;
	}

	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}

	public String getAnhSanPham() {
		return anhSanPham;
	}

	public void setAnhSanPham(String anhSanPham) {
		this.anhSanPham = anhSanPham;
	}

}
