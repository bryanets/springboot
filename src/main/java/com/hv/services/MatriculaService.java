package com.hv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hv.dao.CursosRepository;
import com.hv.dao.MatriculaRepository;
import com.hv.dao.NotasRepository;
import com.hv.entity.Cursos;
import com.hv.entity.Matricula;
import com.hv.entity.Notas;
import com.hv.entity.Rol;
import com.hv.entity.Usuario;

@Service
public class MatriculaService {
	@Autowired
	private MatriculaRepository repoMatricula;
	@Autowired
	private CursosRepository repoCursos;
	@Autowired
	private NotasRepository repoNotas;
	@Autowired
	private UsuarioServices serUsuario;

	@Transactional
	public void registrar(Matricula m) {
		try {
			repoMatricula.save(m);

			Cursos c = new Cursos();
			c.setMatriculaCursos(m);
			repoCursos.save(c);

			Notas n = new Notas();
			n.setCursos(c);
			n.setMatricula(m);
			repoNotas.save(n);

			Usuario usu = new Usuario();
			usu.setIdUsuario(m.getUsuario().getIdUsuario());
			usu = serUsuario.buscarPorID(usu);

			Rol r = new Rol();
			r.setCodigo(2);
			usu.setRol(r);
			serUsuario.Guardar(usu);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
