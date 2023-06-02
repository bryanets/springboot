package com.hv;



import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hv.entity.Curso;
import com.hv.services.CursoServices;

class cursos {
@Autowired
private CursoServices servis;
	
	@Test
	void test() {

		
			System.out.println(servis.listarCursos());
		
		
		
	}

}
