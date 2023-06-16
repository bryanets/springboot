package com.hv.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hv.entity.Enlace;
import com.hv.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer>{
	@Query("select u from Usuario u where u.login=?1")
	public Usuario iniciarSesion(String vLogin);
	@Query("select e from RolEnlace re join re.enlace e where re.rol.codigo=?1")
	public List<Enlace> traerEnlacesDelUsuario(int codigoRol);
}
