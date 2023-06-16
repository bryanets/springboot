package com.hv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hv.entity.Usuario;
import com.hv.services.CarreraService;
import com.hv.services.UsuarioServices;

@Controller
@RequestMapping("/matricula")
public class MatriculaController {

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
	public String agregar(Usuario usuario,Model model) {
		usuario = usuarioService.buscarPorID(usuario);
		 model.addAttribute("carrera", carreraService.listarCarreras());
		// model.addAttribute("profesores", serProfesor.listarProfesores());
		 model.addAttribute("usuario", usuario);
		return "matricula";
	}
	
	@PostMapping("/grabar")
	public String guardar(Usuario usuario) {
		//usuService.Guardar(usuario);
		return "redirect:/usuario/lista";
	}
}
