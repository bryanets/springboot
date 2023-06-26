package com.hv;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.hv.entity.Carrera;
import com.hv.entity.Cursos;
import com.hv.entity.Rol;
import com.hv.entity.Usuario;
import com.hv.services.CarreraService;
import com.hv.services.CursoServices;
import com.hv.services.UsuarioServices;

@SpringBootTest
class HarvardApplicationTests {

	@Autowired
	private UsuarioServices service;

	@Autowired
	private CarreraService serCarrera;

	@Autowired
	private CursoServices serCursos;

	@Autowired
	private UsuarioServices serUsuario;

	@Test
	void contextLoads() {
		Usuario usu = new Usuario();
		usu.setIdUsuario(16);
		usu = serUsuario.buscarPorID(usu);

		Rol r = new Rol();
		r.setCodigo(2);
		usu.setRol(r);
		serUsuario.Guardar(usu);
	}

}
