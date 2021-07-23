package com.baoyen.entities.user;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="san_pham")
public class SanPham {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id",unique = true)
		private Integer id;
		
		@Column(name="cpu")
		private String cpu;
		
		@Column(name="don_gia")
		private Integer donGia;
		
		@Column(name="so_luong_ban")
		private Integer soLuongBan;
		
		@Column(name="so_luong_kho")
		private Integer soLuongKho;
		
		@Column(name="dung_luong_pin")
		private String dungLuongPin;
		
		@Column(name="he_dieu_hanh")
		private String heDieuHanh;
		
		@Column(name="man_hinh")
		private String manHinh;
		
		@Column(name="ram")
		private String ram;
		
		@Column(name="ten_san_pham")
		private String teSanPham;
		
		@Column(name="thiet_ke")
		private String thietKe;
		
		@Column(name="thong_tin_bao_hanh")
		private String thongTinBaoHanh;
		
		@Column(name="thong_tin_chung")
		private String thongTinchung;
		
		@ManyToOne(fetch = FetchType.EAGER)
		@JoinColumn(name = "ma_hang_san_xuat" ,referencedColumnName = "id")
		private DanhMuc danhMuc;
		
		@Column(name="anh_san_pham")
		private String anhSanPham;
		
		@OneToMany(mappedBy = "sanPham",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
		public Set<ChiTietGioHang>  chiTietGioHang;
		
		@OneToMany(mappedBy = "sanPham",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
		public Set<ChiTietDonHang> chiTietDonHang;
		
		
		
		public SanPham() {
			// TODO Auto-generated constructor stub
		}

		public SanPham(Integer id, String cpu, Integer donGia, Integer soLuongBan, Integer soLuongKho,
				String dungLuongPin, String heDieuHanh, String manHinh, String ram, String teSanPham, String thietKe,
				String thongTinBaoHanh, String thongTinchung, DanhMuc danhMuc, String anhSanPham) {
			super();
			this.id = id;
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
			this.danhMuc = danhMuc;
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

		public Set<ChiTietGioHang> getChiTietGioHang() {
			return chiTietGioHang;
		}

		public void setChiTietGioHang(Set<ChiTietGioHang> chiTietGioHang) {
			this.chiTietGioHang = chiTietGioHang;
		}

		public Set<ChiTietDonHang> getChiTietDonHang() {
			return chiTietDonHang;
		}

		public void setChiTietDonHang(Set<ChiTietDonHang> chiTietDonHang) {
			this.chiTietDonHang = chiTietDonHang;
		}

		
}
