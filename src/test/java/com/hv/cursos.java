package com.hv;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.hv.entity.Cursos;
import com.hv.entity.Usuario;
import com.hv.services.CarreraService;
import com.hv.services.CursoServices;
import com.hv.services.UsuarioServices;

@SpringBootTest
class cursos {
	@Autowired
	private UsuarioServices ser;

	@Autowired
	private CarreraService serCarrera;

	@Autowired
	private CursoServices serCurso;

	@Test
	void test() {
		try {

			System.out.println(serCurso.listarCursos());

		} catch (Exception e) {
			System.out.println(e);

		}

	}
}
