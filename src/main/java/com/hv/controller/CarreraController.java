package com.hv.controller;

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
import com.hv.services.CarreraService;

@Controller
@RequestMapping("/carrera")
public class CarreraController {
	
	@Autowired
	private CarreraService serCarrera;

	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("carrera",serCarrera.listarCarreras());
		return "carrera";
	}
	
	@GetMapping("/agregar")
	public String agregar(Carrera carrera, Model model) {
		return "modificarCarrera";
	}
	
	@PostMapping("/grabar")
	public String guardar(Carrera carrera) {
		serCarrera.registrar(carrera);
		return "redirect:/carrera/lista";
	}
	
	@GetMapping("/editar/{idCarrera}")
	public String editar(Carrera carrera, Model model) {
		carrera = serCarrera.buscar(carrera);
		model.addAttribute("carrera",carrera);
		return "modificarCarrera";
	}
	
	@GetMapping("/eliminar/{idCarrera}")
	public String eliminar(Carrera carrera) {
		serCarrera.eliminar(carrera);
		return "redirect:/carrera/lista";
	}
}