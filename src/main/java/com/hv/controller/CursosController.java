package com.hv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Cursos;
import com.hv.services.CarreraService;
import com.hv.services.CursoServices;
import com.hv.services.ProfesoresServices;

@Controller
@RequestMapping("/curso")
public class CursosController {

	@Autowired
	private CursoServices serCurso;

	@Autowired
	private CarreraService serCarrera;

	@Autowired
	private ProfesoresServices serProfesor;

	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("cursos", serCurso.listarCursos());
		return "curso";
	}

	@GetMapping("/agregar")
	public String agregar(Cursos cursos, Model model) {
		model.addAttribute("carrera", serCarrera.listarCarreras());
		model.addAttribute("profesores", serProfesor.listarProfesores());
		return "modificarCursos";
	}

	@PostMapping("/grabar")
	public String guardar(Cursos cursos,RedirectAttributes redirect) {
		serCurso.registrar(cursos);
		redirect.addFlashAttribute("MENSAJE","Curso registrado");
		return "redirect:/curso/lista";
	}

	@GetMapping("/editar/{id_curso}")
	public String editar(Cursos cursos, Model model) {
		cursos = serCurso.buscar(cursos);
		model.addAttribute("carrera", serCarrera.listarCarreras());
		model.addAttribute("profesores", serProfesor.listarProfesores());
		model.addAttribute("cursos", cursos);

		return "modificarCursos";
	}

	@GetMapping("/eliminar/{id_curso}")
	public String eliminar(Cursos cursos,RedirectAttributes redirect) {
		serCurso.eliminar(cursos);
		redirect.addFlashAttribute("MENSAJE","Curso eliminado");
		return "redirect:/curso/lista";
	}

}
