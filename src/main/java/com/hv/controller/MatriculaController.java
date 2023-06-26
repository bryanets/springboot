package com.hv.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hv.entity.Carrera;
import com.hv.entity.DetalleHorario;
import com.hv.entity.Matricula;
import com.hv.entity.Usuario;
import com.hv.services.CarreraService;
import com.hv.services.MatriculaService;
import com.hv.services.UsuarioServices;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/matricula")
public class MatriculaController {

	@Autowired
	private MatriculaService matriculaService;

	@Autowired
	private UsuarioServices usuarioService;

	@Autowired
	private CarreraService carreraService;

	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("solicitantes", usuarioService.solicitantes());
		return "solicitantes";
	}

	@GetMapping("/editar/{idUsuario}")
	public String registrar(Usuario usuario, Model model) {
		usuario = usuarioService.buscarPorID(usuario);
		model.addAttribute("carrera", carreraService.listarCarreras());
		// model.addAttribute("profesores", serProfesor.listarProfesores());
		model.addAttribute("usuario", usuario);
		return "matricula";
	}

	@RequestMapping("/adicionar")
	@ResponseBody
	public void adicionar(@RequestParam("id_horario") int idHorario, @RequestParam("id_curso") int idCurso,
			HttpSession session) {
		// declarar un arreglo de obejtos de clase Detalle
		List<DetalleHorario> lista = null;
		try {
			// validar si existe el atributo de tipo sesión "datos"
			if (session.getAttribute("horarios") == null)// no existe el atributo "datos"
				// crear el arreglo lista
				lista = new ArrayList<DetalleHorario>();
			else// si existe el atributo "datos"
				// recuperar el atributo "datos" y guardarlo en lista
				lista = (List<DetalleHorario>) session.getAttribute("horarios");

			// crear objeto de la clase Detalle con los valores de los parámetros del método
			// adiconar
			DetalleHorario det = new DetalleHorario();
			det.setId_curso(idCurso);
			det.setId_horario(idHorario);

			// adicionar objeto "det" dentro del arreglo "lista"
			lista.add(det);
			// crear o actualizar el atributo "datos"
			session.setAttribute("horarios", lista);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@PostMapping("/grabar")
	public String guardar(Usuario usuario, @RequestParam("carrera") int car,HttpSession session) {
		Matricula m = new Matricula();

		// Usuario usuario = new Usuario();
		// usuario.setIdUsuario(usu);
		m.setUsuario(usuario);

		Carrera c = new Carrera();
		c.setIdCarrera(car);
		m.setCarrera(c);
		m.setFechaMatricula(LocalDate.now());

		//recuperar atributo de tipo sesión "datos"
		List<DetalleHorario> lista=(List<DetalleHorario>) session.getAttribute("horarios");


		m.setDetalleHorario(lista);

		matriculaService.registrar(m);

		return "redirect:/usuario/lista";
	}
}
