package com.baoyen.entities.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "phuong_thuc_thanh_toan")
public class PhuongThucThanhToan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "ten_phuong_thuc_thanh_toan")
	private String tenPhuongThucThanhToan;
	
	public PhuongThucThanhToan() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenPhuongThucThanhToan() {
		return tenPhuongThucThanhToan;
	}

	public void setTenPhuongThucThanhToan(String tenPhuongThucThanhToan) {
		this.tenPhuongThucThanhToan = tenPhuongThucThanhToan;
	}
	
	

}
