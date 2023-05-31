package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.CursoRepository;
import com.hv.entity.Curso;

@Service
public class CursoServices {

	@Autowired
	private CursoRepository repo;
	
	public void registrar(Curso c) {
		repo.save(c);
	}
	
	public void actualizar(Curso c) {
		repo.save(c);
	}
	
	public void eliminarPorID(Integer cod) {
		repo.deleteById(cod);
	}
	
	public Curso buscarPorID(Integer cod) {
		return repo.findById(cod).orElse(null);
	}
	
	public List<Curso> listarCursos(){
		return repo.findAll();
	}
}
