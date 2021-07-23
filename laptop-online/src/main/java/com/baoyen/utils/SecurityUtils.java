package com.baoyen.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;


import com.baoyen.dto.UserIm;

public class SecurityUtils {
	public static UserIm getPrincipal() {
		UserIm userIm = (UserIm) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
        return userIm;
    }
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
		return results;
	}
}