package com.baoyen.dto;

import java.util.Date;

import com.baoyen.entities.user.NguoiDung;
import com.baoyen.entities.user.PhuongThucThanhToan;
import com.baoyen.entities.user.TrangThaiDonHang;
import com.baoyen.entities.user.TrangThaiThanhToan;

public class DonHangDto extends AbtractDto<DonHangDto>{
	private Integer id;

	private String diaChiNhan;

	private String hoTen;

	private String sdt;

	private NguoiDung nguoiDung;
	private Date ngayDatHang;
	private Date ngayNhanHang;
	private Date ngayThanhToan;
	
	private TrangThaiThanhToan trangThaiThanhToan;
	private TrangThaiDonHang trangThaiDonHang;
	private PhuongThucThanhToan phuongThucThanhToan;
	private Integer idShipper;
	public DonHangDto() {
	// TODO Auto-generated constructor stub
	}


public Integer getIdShipper() {
		return idShipper;
	}


	public void setIdShipper(Integer idShipper) {
		this.idShipper = idShipper;
	}


public Date getNgayThanhToan() {
		return ngayThanhToan;
	}


	public void setNgayThanhToan(Date ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}


public Date getNgayNhanHang() {
		return ngayNhanHang;
	}


	public void setNgayNhanHang(Date ngayNhanHang) {
		this.ngayNhanHang = ngayNhanHang;
	}


public Date getNgayDatHang() {
	return ngayDatHang;
}


public void setNgayDatHang(Date ngayDatHang) {
	this.ngayDatHang = ngayDatHang;
}


public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getDiaChiNhan() {
	return diaChiNhan;
}
public void setDiaChiNhan(String diaChiNhan) {
	this.diaChiNhan = diaChiNhan;
}
public String getHoTen() {
	return hoTen;
}
public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
}
public String getSdt() {
	return sdt;
}
public void setSdt(String sdt) {
	this.sdt = sdt;
}
public NguoiDung getNguoiDung() {
	return nguoiDung;
}
public void setNguoiDung(NguoiDung nguoiDung) {
	this.nguoiDung = nguoiDung;
}
public TrangThaiThanhToan getTrangThaiThanhToan() {
	return trangThaiThanhToan;
}
public void setTrangThaiThanhToan(TrangThaiThanhToan trangThaiThanhToan) {
	this.trangThaiThanhToan = trangThaiThanhToan;
}
public TrangThaiDonHang getTrangThaiDonHang() {
	return trangThaiDonHang;
}
public void setTrangThaiDonHang(TrangThaiDonHang trangThaiDonHang) {
	this.trangThaiDonHang = trangThaiDonHang;
}
public PhuongThucThanhToan getPhuongThucThanhToan() {
	return phuongThucThanhToan;
}
public void setPhuongThucThanhToan(PhuongThucThanhToan phuongThucThanhToan) {
	this.phuongThucThanhToan = phuongThucThanhToan;
}


}
