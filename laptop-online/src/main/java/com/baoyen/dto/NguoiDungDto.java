package com.baoyen.dto;

public class NguoiDungDto extends AbtractDto<NguoiDungDto> {

	
	private Integer id;

	
	private String diaChi;

	
	private String fullName;

	
	private String tenNguoiDung;


	private String pass;

	
	private String std;

	
	public NguoiDungDto() {
		super();
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

	

}