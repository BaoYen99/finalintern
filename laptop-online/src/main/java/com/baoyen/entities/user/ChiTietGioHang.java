
package com.baoyen.entities.user;

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

@Table(name = "chi_tiet_gio_hang")
public class ChiTietGioHang {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "id", unique = true)
	private Integer id;

	@Column(name = "so_luong")
	private Integer soLuong;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_gio_hang", referencedColumnName = "id")
	private GioHang gioHang;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_san_pham", referencedColumnName = "id")
	private SanPham sanPham;

	public ChiTietGioHang() {
	}

	public ChiTietGioHang(Integer soLuong, GioHang gioHang, SanPham sanPham) {
		super();
		this.soLuong = soLuong;
		this.gioHang = gioHang;
		this.sanPham = sanPham;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public GioHang getGioHang() {
		return gioHang;
	}

	public void setGioHang(GioHang gioHang) {
		this.gioHang = gioHang;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

}
