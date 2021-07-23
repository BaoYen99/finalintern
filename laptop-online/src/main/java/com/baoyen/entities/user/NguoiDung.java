package com.baoyen.entities.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "nguoi_dung")
public class NguoiDung {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true)
	private Integer id;

	@Column(name = "dia_chi")
	private String diaChi;

	@Column(name = "full_name")
	private String fullName;

	@Column(name = "ten_nguoi_dung")
	private String tenNguoiDung;

	@Column(name = "password")
	private String pass;

	@Column(name = "sdt")
	private String std;

	
	@ManyToOne
	@JoinColumn(name = "id_vai_tro",referencedColumnName = "id_vai_tro")
	private VaiTro vaiTro;

	public NguoiDung() {
		// TODO Auto-generated constructor stub
	}

	

	public NguoiDung(String diaChi, String fullName, String tenNguoiDung, String pass, String std, VaiTro vaiTro) {
		super();
		this.diaChi = diaChi;
		this.fullName = fullName;
		this.tenNguoiDung = tenNguoiDung;
		this.pass = pass;
		this.std = std;
		this.vaiTro = vaiTro;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getTenNguoiDung() {
		return tenNguoiDung;
	}

	public void setTenNguoiDung(String tenNguoiDung) {
		this.tenNguoiDung = tenNguoiDung;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getStd() {
		return std;
	}

	public void setStd(String std) {
		this.std = std;
	}

	public VaiTro getVaiTro() {
		return vaiTro;
	}

	public void setVaiTro(VaiTro vaiTro) {
		this.vaiTro = vaiTro;
	}

	
}