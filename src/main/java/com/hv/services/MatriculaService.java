package com.hv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.MatriculaRepository;
import com.hv.entity.Matricula;

@Service
public class MatriculaService {
	@Autowired
	private MatriculaRepository repo;
	
	public void registrar(Matricula m) {
		repo.save(m);
	}
}
