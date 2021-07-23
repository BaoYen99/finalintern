package com.baoyen.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baoyen.entities.user.DanhMuc;
import com.baoyen.repositories.user.DanhMucRepo;

@Service
public class DanhMucService {

	@Autowired
	DanhMucRepo danhMucRepo;
	
	public List<DanhMuc> findAll(){
		return danhMucRepo.findAll();
	}
}
