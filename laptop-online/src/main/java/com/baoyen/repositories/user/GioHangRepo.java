package com.baoyen.repositories.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.GioHang;

public interface GioHangRepo extends JpaRepository<GioHang, Integer>{

	@Modifying
	@Transactional
	@Query(value = "insert into gio_hang (tong_tien,ma_nguoi_dung) values (:tongtien, :manguoidung)",nativeQuery = true)
	void save(@Param("tongtien") Long tongtien,@Param("manguoidung")Integer manguoidung);

	@Query(value = "SELECT * FROM gio_hang WHERE ma_nguoi_dung =:ma",nativeQuery = true)
	GioHang findByMaNguoiDung(@Param("ma") Integer ma);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE gio_hang SET tong_tien =:tongtien WHERE ma_nguoi_dung =:mand",nativeQuery = true)
	public void updateGioHang(@Param("tongtien") Long tongtien,@Param("mand") Integer mand);
	
	@Query(value = "SELECT id FROM gio_hang WHERE ma_nguoi_dung =:isnguoidung",nativeQuery = true)
	Integer findByMadung(@Param("isnguoidung") Integer isnguoidung);
	
	@Query(value = "SELECT tong_tien FROM gio_hang WHERE ma_nguoi_dung =:mand",nativeQuery = true)
	Long getTongTien(@Param("mand") Integer mand);

	@Modifying
	@Transactional
	@Query(value = "DELETE from gio_hang WHERE ma_nguoi_dung =:ma",nativeQuery = true)
	void deleteByIdUser(@Param("ma")Integer ma);
	
}
