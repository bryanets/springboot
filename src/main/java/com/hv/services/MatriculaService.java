package com.hv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hv.dao.CursosRepository;
import com.hv.dao.DetalleHorarioRepository;
import com.hv.dao.MatriculaRepository;
import com.hv.dao.NotasRepository;
import com.hv.entity.Cursos;
import com.hv.entity.DetalleHorario;
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
	@Autowired
	private DetalleHorarioRepository detalleRepository;

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

			List<DetalleHorario> dh = m.getDetalleHorario();
			for (DetalleHorario dhf : dh) {
				dhf.setMatriculaDetalle(m);
				detalleRepository.save(dhf);
				System.out.println("id del curso: "+dhf.getId_curso());
				System.out.println("id del horario: "+dhf.getId_horario());
				System.out.println("id de la matricula: "+dhf.getMatriculaDetalle().getIdMatricula());
			}

			Rol r = new Rol();
			r.setCodigo(2);
			usu.setRol(r);
			serUsuario.Guardar(usu);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
