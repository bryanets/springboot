package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.NotasRepository;

import com.hv.entity.Notas;



@Service
public class NotasServices {
	@Autowired
	private NotasRepository repo;
	
	
	public void Guardar (Notas notas) {
		 repo.save(notas);
	}
	public List<Notas> listarTodos(){
		return repo.findAll();
	}
	public void eliminarPorID(Integer cod) {
		repo.deleteById(cod);
	}
	public Notas buscarPorID(Integer cod) {
		return repo.findById(cod).orElse(null);
	}

}
