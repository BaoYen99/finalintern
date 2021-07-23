package com.baoyen.repositories.user;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Parent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.baoyen.entities.user.DonHang;
import com.baoyen.entities.user.SanPham;

public interface DonHangRepo extends JpaRepository<DonHang, Integer>{
	
	 @Modifying
	 @Transactional
	 @Query( value = "insert into don_hang (dia_chi_nhan, ho_ten_nguoi_nhan, std,ma_nguoi_dung,id_trang_thai,id_trang_thai_don_hang,id_phuong_thuc,ngay_dat_hang) values (:dc, :ten, :std,:manguoidung, :idtt,:idttdh, :lhtt, :ngay)",nativeQuery = true)
	 void saveDonHang(@Param("dc") String dc,@Param("ten") String ten,@Param("std")String std,@Param("manguoidung") Integer manguoidung,@Param("idtt") Integer idtt,@Param("idttdh") Integer idttdh,@Param("lhtt")Integer lhtt,@Param("ngay") Date ngay);

	 @Query(value = "SELECT id from don_hang where ma_nguoi_dung =:ma  order by id desc limit 1",nativeQuery = true)
	 Integer getIdDonHang(@Param("ma") Integer ma);

	 @Modifying
	 @Transactional
	 @Query(value = "DELETE FROM don_hang WHERE id =:id",nativeQuery = true)
	void deleteById(@Param("id")Integer id);

	DonHang findById(Integer id);

	@Modifying
	 @Transactional
	 @Query(value = "update  don_hang SET id_trang_thai_don_hang =:ttdh, id_trang_thai =:tttt  WHERE id =:id",nativeQuery = true)
	void updatett(@Param("ttdh")Integer ttdh,@Param("tttt")Integer tttt,@Param("id")Integer id);

	@Query(value = "SELECT * FROM don_hang dh\r\n" + 
			"join nguoi_dung nd on dh.ma_nguoi_dung = nd.id\r\n" + 
			" where LOWER(ten_nguoi_dung) like LOWER(concat('%',:username,'%'))",nativeQuery = true)
	List<DonHang> getDonHangByUserName(@Param("username") String username);

	
	@Modifying
	 @Transactional
	 @Query(value = "update  don_hang SET id_trang_thai_don_hang =:ttdh, id_trang_thai =:tttt, ngay_nhan_hang =:date  WHERE id =:id",nativeQuery = true)
	void updatett1(@Param("ttdh")Integer ttdh,@Param("tttt")Integer tttt,@Param("id")Integer id,@Param("date") Date date);
	
	@Modifying
	 @Transactional
	 @Query( value = "insert into don_hang (dia_chi_nhan, ho_ten_nguoi_nhan, std,ma_nguoi_dung,id_trang_thai,id_trang_thai_don_hang,id_phuong_thuc,ngay_dat_hang,ngay_thanh_toan) values (:dc, :ten, :std,:manguoidung, :idtt,:idttdh, :lhtt, :ngay, :date2)",nativeQuery = true)
	 void saveDonHang1(@Param("dc") String dc,@Param("ten") String ten,@Param("std")String std,@Param("manguoidung") Integer manguoidung,@Param("idtt") Integer idtt,@Param("idttdh") Integer idttdh,@Param("lhtt")Integer lhtt,@Param("ngay") Date ngay,@Param("date2") Date date2);

	@Modifying
	 @Transactional
	 @Query(value = "update  don_hang SET id_trang_thai_don_hang =:ttdh, id_trang_thai =:tttt, ngay_nhan_hang =:date, ngay_thanh_toan =:date2  WHERE id =:id",nativeQuery = true)
	void updatett2(@Param("ttdh")Integer ttdh,@Param("tttt")Integer tttt,@Param("id")Integer id,@Param("date") Date date,@Param("date2") Date date2);

	
	@Query(value = "SELECT * FROM don_hang WHERE id_shipper is  null ",nativeQuery =  true)
	List<DonHang> findByShipper();  
	
	@Query(value = "SELECT * FROM don_hang WHERE id_shipper =:id ",nativeQuery =  true)
	List<DonHang> findByIdShipper(@Param("id") Integer id);  
	
	@Modifying
	 @Transactional
	@Query(value = "update don_hang SET id_shipper =:idshipper  WHERE id =:id",nativeQuery = true)
	void updateshipper( @Param("idshipper")Integer idshipper,@Param("id") Integer id);
}
