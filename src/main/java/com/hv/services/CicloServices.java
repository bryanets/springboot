package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.CicloRepository;
import com.hv.entity.Ciclo;

@Service
public class CicloServices {

	@Autowired
	private CicloRepository repo;
	
	public List<Ciclo> listarCiclos(){
		return repo.findAll();
	}
}
