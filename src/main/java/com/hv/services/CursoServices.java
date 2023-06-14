package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.CursosRepository;
import com.hv.entity.Cursos;

@Service
public class CursoServices {

	@Autowired
	private CursosRepository repo;
	
	public void registrar(Cursos c) {
		repo.save(c);
	}
	
	public void actualizar(Cursos c) {
		repo.save(c);
	}
	
	public void eliminar(Cursos cursos) {
		repo.delete(cursos);
	}
	
	public Cursos buscar(Cursos cursos) {
		return repo.findById(cursos.getId_curso()).orElse(null);
	}
	
	public List<Cursos> listarCursos(){
		return repo.findAll();
	}
	
}
