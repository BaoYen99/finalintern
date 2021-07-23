package com.baoyen.entities.user;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "phan_quyen")
public class VaiTro {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_vai_tro", unique = true)
	private Integer id;

	@Column(name = "ten_phan_quyen")
	private String tenPhanQuyen;

	@OneToMany(mappedBy = "vaiTro")
	private List<NguoiDung> nguoidung = new ArrayList<>();

	public VaiTro() {
		// TODO Auto-generated constructor stub
	}

	public VaiTro(String tenPhanQuyen) {
		super();
		this.tenPhanQuyen = tenPhanQuyen;

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenPhanQuyen() {
		return tenPhanQuyen;
	}

	public void setTenPhanQuyen(String tenPhanQuyen) {
		this.tenPhanQuyen = tenPhanQuyen;
	}

	public List<NguoiDung> getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(List<NguoiDung> nguoidung) {
		this.nguoidung = nguoidung;
	}

}