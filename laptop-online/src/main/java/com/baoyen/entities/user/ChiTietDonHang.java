package com.baoyen.entities.user;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="chi_tiet_don_hang")
public class ChiTietDonHang {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id",unique = true)
	private Integer id;
	
	@Column(name = "don_gia")
	private Integer donGia;
	
	@Column(name = "so_luong")
	private Integer soLuong;
	
	@Column(name = "tong_tien")
	private Long tongTien;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "ma_don_hang",referencedColumnName = "id")
	private DonHang donHang;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_san_pham",referencedColumnName = "id")
	private SanPham sanPham;
	
	public ChiTietDonHang() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietDonHang(Integer donGia, Integer soLuong, Long tongTien, DonHang donHang, SanPham sanPham) {
		super();
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
		this.donHang = donHang;
		this.sanPham = sanPham;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDonGia() {
		return donGia;
	}

	public void setDonGia(Integer donGia) {
		this.donGia = donGia;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public Long getTongTien() {
		return tongTien;
	}

	public void setTongTien(Long tongTien) {
		this.tongTien = tongTien;
	}

	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	
}
