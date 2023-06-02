package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hv.dao.UsuarioRepository;
import com.hv.entity.Enlace;
import com.hv.entity.Usuario;

@Service
public class UsuarioServices {
	@Autowired
	private UsuarioRepository repo;
	
	public Usuario validarUsuario(String vLogin) {
		return repo.iniciarSesion(vLogin);
	}
	public List<Enlace> enlacesDelUsuario(int codRol){
		return repo.traerEnlacesDelUsuario(codRol);
	}
	
	public void Guardar (Usuario usuario) {
		 repo.save(usuario);
	}
	public List<Usuario> listarTodos(){
		return repo.findAll();
	}
	public void eliminarPorID(Integer cod) {
		repo.deleteById(cod);
	}
	public Usuario buscarPorID(Integer cod) {
		return repo.findById(cod).orElse(null);
	}
}





