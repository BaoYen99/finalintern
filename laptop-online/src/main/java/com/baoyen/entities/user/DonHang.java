package com.baoyen.entities.user;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "don_hang")
public class DonHang {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id",unique = true)
	private Integer id;
	
	@Column(name="dia_chi_nhan")
	private String diaChiNhan;
	
	@Column(name="ho_ten_nguoi_nhan")
	private String hoTen;
	
	@Column(name="std")
	private String sdt;
	
	
	@Column(name = "ngay_dat_hang")
	private Date ngayDatHang;
	
	@Column(name = "ngay_nhan_hang")
	private Date ngayNhanHang;
	
	@Column(name = "ngay_thanh_toan")
	private Date ngayThanhToan;

	@Column(name = "id_shipper")
	private Integer idShipper;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="ma_nguoi_dung",referencedColumnName = "id")
	private NguoiDung nguoiDung;
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_trang_thai",referencedColumnName = "id")
	private TrangThaiThanhToan trangThaiThanhToan;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_trang_thai_don_hang",referencedColumnName = "id")
	private TrangThaiDonHang trangThaiDonHang;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_phuong_thuc",referencedColumnName = "id")
	private PhuongThucThanhToan phuongThucThanhToan;
	
	
	public DonHang() {
		// TODO Auto-generated constructor stub
	}

	
	public DonHang(String diaChiNhan, String hoTen, String sdt, NguoiDung nguoiDung,
			TrangThaiThanhToan trangThaiThanhToan, TrangThaiDonHang trangThaiDonHang) {
		super();
		this.diaChiNhan = diaChiNhan;
		this.hoTen = hoTen;
		this.sdt = sdt;
		this.nguoiDung = nguoiDung;
		this.trangThaiThanhToan = trangThaiThanhToan;
		this.trangThaiDonHang = trangThaiDonHang;
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
	public PhuongThucThanhToan getPhuongThucThanhToan() {
		return phuongThucThanhToan;
	}


	public void setPhuongThucThanhToan(PhuongThucThanhToan phuongThucThanhToan) {
		this.phuongThucThanhToan = phuongThucThanhToan;
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
	
}
