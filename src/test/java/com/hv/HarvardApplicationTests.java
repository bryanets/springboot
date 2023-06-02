package com.hv;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hv.entity.Rol;
import com.hv.entity.Usuario;
import com.hv.services.CicloServices;
import com.hv.services.CursoServices;
import com.hv.services.UsuarioServices;

@SpringBootTest
class HarvardApplicationTests {
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private UsuarioServices service;
	
	@Autowired
	private CursoServices servis;
	
	@Autowired
	private CicloServices ciclo;

	@Test
	void contextLoads() {
		//System.out.println("Clave es :" + encoder.encode("123"));
		//servis.listarCursos();
		//System.out.println(servis.listarCursos());
		System.out.println(ciclo.listarCiclos());

	}

}
