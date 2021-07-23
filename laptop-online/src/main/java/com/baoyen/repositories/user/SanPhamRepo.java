package com.baoyen.repositories.user;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.SanPham;


public interface SanPhamRepo extends JpaRepository<SanPham, Integer>{

	
	
	SanPham findById(Integer id);
	
	@Query(value = "SELECT * FROM san_pham WHERE ma_hang_san_xuat =:mahang", nativeQuery=true)
	List<SanPham>	findByDanhMuc(@Param("mahang") Integer mahang);
	
	@Query(value = "SELECT * FROM san_pham WHERE ma_hang_san_xuat = ?1 ORDER BY ?#{#pageable}",
		       countQuery = "SELECT count(*) FROM san_pham WHERE ma_hang_san_xuat = ?1",
		       nativeQuery = true)
	Page<SanPham> findByIdDanhMuc(Integer id, Pageable pageable);   
	
	@Query(value = "SELECT COUNT(*) FROM san_pham WHERE ma_hang_san_xuat =:ma",nativeQuery = true)
	int countId(@Param("ma")Integer ma );
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE san_pham SET don_gia =:dg,so_luong_kho =:slkho  WHERE id =:id",nativeQuery = true)
	void updateSanPham(@Param("dg")Integer dg,@Param("slkho")Integer slkho,@Param("id")Integer id);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE san_pham SET so_luong_ban =:slban,so_luong_kho =:slkho  WHERE id =:id",nativeQuery = true)
	void updateSanPhamSl(@Param("slban") Integer slban,@Param("slkho")Integer slkho,@Param("id")Integer id);
	
	
	@Query(value = "SELECT so_luong_kho FROM san_pham  WHERE id =:id",nativeQuery = true)
	Integer getSoLuongKho(@Param("id")Integer id);
	
	 @Transactional
	 @Modifying
	 @Query( value = "insert into san_pham (cpu,don_gia,so_luong_ban,so_luong_kho,dung_luong_pin,he_dieu_hanh,man_hinh,ram,ten_san_pham,thiet_ke,thong_tin_bao_hanh,thong_tin_chung,ma_hang_san_xuat,anh_san_pham) values (:cpu,:dongia,:slban,:slkho,:dlpin,:hdh,:mh,:ram,:ten,:tke,:ttbhanh,:ttchung,:mahsx,:anh)",nativeQuery = true)
	 void savesp(@Param("cpu")String cpu, @Param("dongia") Integer dongia,@Param("slban") Integer slban,@Param("slkho") Integer slkho,
			 @Param("dlpin") String dlpin,@Param("hdh") String hdh,@Param("mh") String mh,@Param("ram") String ram,@Param("ten")String ten,@Param("tke")String tke,
			 @Param("ttbhanh") String ttbhanh,@Param("ttchung") String ttchung,@Param("mahsx") Integer mahsx,@Param("anh") String anh);

	 @Modifying
	 @Transactional
	 @Query(value = "DELETE from san_pham WHERE id =:id",nativeQuery = true)
	void deleteById(@Param("id")Integer id);
	 
	
	 @Query(value = "SELECT * FROM san_pham where LOWER(ten_san_pham) like LOWER(concat('%',:ten,'%'))",nativeQuery = true)
	 List<SanPham> getSanPhamByName(@Param("ten") String ten);
	 
}
	
	
	

