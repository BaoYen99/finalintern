package com.baoyen.service.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.baoyen.dto.NguoiDungDto;
import com.baoyen.entities.user.NguoiDung;
import com.baoyen.repositories.user.NguoiDungRepo;

@Service
public class NguoiDungService {

	@Autowired
	NguoiDungRepo nguoiDungRepo;
	
	
	
	
	public void save(String dc,String fullname,String ten,String pass,String sdt,Integer id) {

		nguoiDungRepo.save(dc, fullname, ten, pass, sdt, id);
	}
	
		
	
	public NguoiDung findById(Integer id) {
		return nguoiDungRepo.findById(id);
	}
	public NguoiDung findOneByTenNguoiDung(String ten) {
		return nguoiDungRepo.findOneByTenNguoiDung(ten);
	}
	public void updateNguoiDung(String dc,String fullname,String ten, String pass, String sdt,Integer id) {
		nguoiDungRepo.updateSanPham(dc, fullname, ten, pass, sdt, id);
	}

	public boolean findByTenNguoiDung(String ten) {
		if(nguoiDungRepo.findOneByTenNguoiDung(ten) == null) {
			return true;
		}
		return false;
		}

	public List<NguoiDung> findAll() {
		// TODO Auto-generated method stub
		return nguoiDungRepo.findAll();
	}
	
	public List<NguoiDungDto> findAll(Pageable pageable){
		List<NguoiDungDto> nguoidungDto=new ArrayList<NguoiDungDto>();
		List<NguoiDung> entities= nguoiDungRepo.findAll(pageable).getContent();
		for(NguoiDung item:entities) {
			NguoiDungDto ng=new NguoiDungDto();
			ng.setDiaChi(item.getDiaChi());
			ng.setFullName(item.getFullName());
			ng.setPass(item.getPass());
			ng.setTenNguoiDung(item.getTenNguoiDung());
			ng.setStd(item.getStd());
			ng.setId(item.getId());
			nguoidungDto.add(ng);
		}
		return nguoidungDto;
	}
	
	public int getTotalItem() {
		return (int) nguoiDungRepo.count();
	}



	public List<NguoiDung> getNguoiDungByUserName(String username) {
		// TODO Auto-generated method stub
		return nguoiDungRepo.getNguoiDungByUserName(username);
	}




}
