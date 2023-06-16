package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.CarreraRepository;
import com.hv.entity.Carrera;

@Service
public class CarreraService {
	@Autowired
	private CarreraRepository repo;
	
	public void registrar(Carrera c) {
		repo.save(c);
	}
	
	public void actualizar(Carrera c) {
		repo.save(c);
	}
	

	public void eliminar(Carrera carrera) {
		repo.delete(carrera);
	}
	
	public Carrera buscar(Carrera carrera) {
		return repo.findById(carrera.getIdCarrera()).orElse(null);
	}
	public void eliminarPorID(Integer cod) {
		repo.deleteById(cod);
	}
	
	public Carrera buscarPorID(Integer cod) {
		return repo.findById(cod).orElse(null);

	}
	
	public List<Carrera> listarCarreras(){
		return repo.findAll();
	}
	
	public List<Carrera> findByCarrera(Integer carrera){
		return repo.findAllByCarrera(carrera);
	}
}
