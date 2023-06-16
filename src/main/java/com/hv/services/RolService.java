package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.RolRepository;
import com.hv.entity.Rol;

@Service
public class RolService {

	@Autowired
	private RolRepository rolRepository;
	
	public List<Rol> listarTodos(){
		return rolRepository.findAll();
	}
}
