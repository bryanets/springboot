package com.hv.dao;



import org.springframework.data.jpa.repository.JpaRepository;


import com.hv.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer>{

}
