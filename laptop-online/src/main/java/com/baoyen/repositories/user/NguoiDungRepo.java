package com.baoyen.repositories.user;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.DonHang;
import com.baoyen.entities.user.NguoiDung;

public interface NguoiDungRepo extends JpaRepository<NguoiDung, Integer> {

	
	
	NguoiDung findById(Integer id);
	
	NguoiDung findOneByTenNguoiDung(String ten);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE nguoi_dung SET dia_chi =:dc ,full_name =:fullname, ten_nguoi_dung =:ten, password =:pass, sdt=:sdt WHERE id =:id",nativeQuery = true)
	void updateSanPham(@Param("dc") String dc,@Param("fullname")String fullname,@Param("ten")String ten,@Param("pass")String pass,@Param("sdt") String sdt,@Param("id")Integer id);
	
	@Modifying
	@Transactional
	@Query(value = "insert into nguoi_dung (dia_chi, full_name, ten_nguoi_dung, password ,sdt, id_vai_tro) values(:dc,:fullname,:ten,:pass,:sdt,:id)",nativeQuery = true)
	void save(@Param("dc") String dc,@Param("fullname") String fullname,@Param("ten") String ten,@Param("pass") String pass,@Param("sdt") String sdt,@Param("id") Integer id);

	 @Query(value = "SELECT * FROM nguoi_dung where LOWER(ten_nguoi_dung) like LOWER(concat('%',:username,'%'))",nativeQuery = true)
	
	List<NguoiDung> getNguoiDungByUserName(@Param("username")String username);
	 
	 @Query(value = "SELECT * FROM nguoi_dung    ORDER BY id desc , ?#{#pageable}",
		       countQuery = "SELECT * FROM nguoi_dung",
		       nativeQuery = true)
	  Page<NguoiDung> findAll(Pageable pageable);
	
}
