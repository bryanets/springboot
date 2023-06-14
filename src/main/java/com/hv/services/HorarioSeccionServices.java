package com.hv.services;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.HorarioSeccionRepository;
import com.hv.entity.Horarios;

@Service
public class HorarioSeccionServices {
	@Autowired
	private HorarioSeccionRepository repo;
	
	public void registrar(Horarios hs) {
		repo.save(hs);
	}
	public void actualizar(Horarios hs) {
		repo.save(hs);
	}
	public void eliminarPorId(Horarios horarios) {
		repo.delete(horarios);
	}
	public Horarios buscar(Horarios horarios) {
		return repo.findById(horarios.getIdHorario()).orElse(null);
	}
	public List<Horarios> listarTodo(){
		return repo.findAll();
	}
}
