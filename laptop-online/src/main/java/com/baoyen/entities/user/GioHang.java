
package com.baoyen.entities.user;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity

@Table(name = "gio_hang")
public class GioHang {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "id", unique = true)
	private Integer id;

	@Column(name = "tong_tien")
	private Long tong_tien;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_nguoi_dung", referencedColumnName = "id")
	private NguoiDung nguoiDung;

	@OneToMany(mappedBy = "gioHang",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	public List<ChiTietGioHang> chiTietGioHang;
	
	public GioHang() {
	}

	public GioHang(Long tong_tien, NguoiDung nguoiDung) {
		super();

		this.tong_tien = tong_tien;
		this.nguoiDung = nguoiDung;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getTong_tien() {
		return tong_tien;
	}

	public void setTong_tien(Long tong_tien) {
		this.tong_tien = tong_tien;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

}
