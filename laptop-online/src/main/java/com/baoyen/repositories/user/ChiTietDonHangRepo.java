package com.baoyen.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.ChiTietDonHang;

public interface ChiTietDonHangRepo extends JpaRepository<ChiTietDonHang, Integer>{

	@Modifying
	@Transactional
	@Query(value = "insert into chi_tiet_don_hang (don_gia,so_luong,tong_tien,ma_don_hang,ma_san_pham) values(:dg,:sl,:tt,:madonhang,:masanpham)",nativeQuery = true)
	void saveCTDH(@Param("dg") Integer dg,@Param("sl")Integer sl,@Param("tt") Long tt,@Param("madonhang") Integer madonhang,@Param("masanpham") Integer masanpham);
	
	
	@Query(value = "SELECT *  FROM chi_tiet_don_hang WHERE ma_don_hang =:ma",nativeQuery =true)
	List<ChiTietDonHang> getByMaGioHang(@Param("ma")Integer ma);


	@Modifying
	@Transactional
	@Query(value = "DELETE from chi_tiet_don_hang WHERE id =:id",nativeQuery = true)
	void deleteById( @Param("id")Integer id);

	@Query(value = "SELECT *  FROM chi_tiet_don_hang WHERE ma_san_pham =:id",nativeQuery =true)
	List<ChiTietDonHang> getByMaSanPham(@Param("id")Integer id);
}
