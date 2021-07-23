package com.baoyen.service.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.baoyen.dto.UserIm;
import com.baoyen.entities.user.NguoiDung;
import com.baoyen.repositories.user.NguoiDungRepo;

@Service
public class NguoiDungDetailsService implements UserDetailsService {

	@Autowired
	NguoiDungRepo nguoiDungRepo;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		NguoiDung nguoidung=nguoiDungRepo.findOneByTenNguoiDung(username);
		
		if(nguoidung == null) {
			throw new UsernameNotFoundException("user not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		 
			authorities.add(new SimpleGrantedAuthority(nguoidung.getVaiTro().getTenPhanQuyen()));
		
		UserIm userIm = new UserIm(nguoidung.getTenNguoiDung(), nguoidung.getPass(), 
							true, true, true, true, authorities);
		userIm.setId(nguoidung.getId());
		userIm.setFullName(nguoidung.getFullName());
		return userIm;
	}

}