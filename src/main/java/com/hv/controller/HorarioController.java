package com.hv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Carrera;
import com.hv.entity.Cursos;
import com.hv.entity.Horarios;
import com.hv.services.CursoServices;
import com.hv.services.HorarioSeccionServices;

@Controller
@RequestMapping("/horario")
public class HorarioController {
	@Autowired
	private HorarioSeccionServices serHora;
	@Autowired 
	private CursoServices serCur;
	
	
	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("horarios", serHora.listarTodo());
		return "horario";
	}

	@GetMapping("/agregar")
	public String agregar(Horarios horarios, Model model) {
		model.addAttribute("cursos", serCur.listarCursos());
		return "modificarHorarios";
	}

	@PostMapping("/grabar")
	public String guardar(Horarios horarios) {
		serHora.registrar(horarios);
		return "redirect:/horario/lista";
	}
	
	
	@GetMapping("/editar/{idHorario}")
	public String editar(Horarios horarios, Model model) {
		horarios = serHora.buscar(horarios);
		model.addAttribute("cursos", serCur.listarCursos());
		model.addAttribute("horarios", horarios);

		return "modificarHorarios";
	}

	@GetMapping("/eliminar/{idHorario}")
	public String eliminar(Horarios horarios) {
		serHora.eliminarPorId(horarios);
		return "redirect:/horario/lista";
	}
	
}
