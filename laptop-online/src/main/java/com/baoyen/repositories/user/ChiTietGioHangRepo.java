
  package com.baoyen.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.ChiTietGioHang;

public interface ChiTietGioHangRepo extends JpaRepository<ChiTietGioHang, Integer>{
  
	@Modifying
	@Transactional
	@Query(value = "UPDATE chi_tiet_gio_hang SET so_luong =:soluong WHERE id =:id",nativeQuery = true)
	Integer updateSoLuong(@Param("soluong") Integer soluong,@Param("id")Integer id);
	
	@Transactional
	 void deleteAll() ;
	 
	 @Modifying
	 @Transactional
	 @Query(value = "DELETE FROM chi_tiet_gio_hang WHERE ma_san_pham =:ma",nativeQuery = true)
	 void deleteId(@Param("ma") Integer ma);
	 
	 @Modifying
	 @Transactional
	 @Query( value = "insert into chi_tiet_gio_hang (so_luong, ma_gio_hang, ma_san_pham) values (:sl, :magh, :masp)",nativeQuery = true)
	 void saveCtgh(@Param("sl") Integer sl, @Param("magh") Integer magh,  @Param("masp") Integer masp);

	 @Query(value = "SELECT * FROM chi_tiet_gio_hang WHERE ma_san_pham =:ma",nativeQuery = true)
	 ChiTietGioHang findByIdSanPham(@Param("ma")Integer ma);
	 
	 @Transactional
	 List<ChiTietGioHang> findAll();
	 
	 @Transactional
	  @Query(value ="select * from chi_tiet_gio_hang ct  join gio_hang lh on ct.ma_gio_hang=lh.id where ma_nguoi_dung =:manguoidung",nativeQuery = true ) 
	  List<ChiTietGioHang> findByIdUser(@Param("manguoidung") Integer manguoidung);

	 @Modifying
	 @Transactional
	 @Query(value = "DELETE from chi_tiet_gio_hang WHERE ma_gio_hang =:ma",nativeQuery = true)
	 void deleteById(@Param("ma")Integer id);
	 
  }
 