package com.baoyen.entities.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "hang_san_xuat")
public class DanhMuc {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id",unique = true)
	private Integer id;
	
	@Column(name = "ten_hang")
	private String tenHang;
	
	
	
	@OneToMany(mappedBy = "danhMuc")
	private List<SanPham> sanPham;
	public DanhMuc() {
		// TODO Auto-generated constructor stub
	}

	
	public DanhMuc(Integer id, String tenHang) {
		super();
		this.id = id;
		this.tenHang = tenHang;
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenHang() {
		return tenHang;
	}

	public void setTenHang(String tenHang) {
		this.tenHang = tenHang;
	}

	@Override
	public String toString() {
		return "DanhMuc [id=" + id + ", tenHang=" + tenHang + "]";
	}

	
	
}
