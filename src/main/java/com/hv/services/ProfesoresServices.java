package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.CursosRepository;
import com.hv.dao.ProfesorRepository;
import com.hv.entity.Cursos;
import com.hv.entity.Profesores;

@Service
public class ProfesoresServices {

	@Autowired
	private ProfesorRepository repo;
	
	public void registrar(Profesores p) {
		repo.save(p);
	}
	
	public void actualizar(Profesores p) {
		repo.save(p);
	}
	
	public void eliminar(Profesores p) {
		repo.delete(p);
	}
	
	public Profesores buscar(Profesores p) {
		return repo.findById(p.getIdProfesor()).orElse(null);
	}
	
	public List<Profesores> listarProfesores(){
		return repo.findAll();
	}
	
}
