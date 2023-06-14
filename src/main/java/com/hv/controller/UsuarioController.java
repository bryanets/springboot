package com.hv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Usuario;
import com.hv.services.UsuarioServices;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	@Autowired
	private UsuarioServices servicio;

	
	@RequestMapping("/validar")
	public String index() {

		return "login";
	}
	
	@RequestMapping("/index")
	public String home() {

		return "index";
	}

	@RequestMapping("/intranet")
	public String itranet(Model model) {

		return "intranet";
	}

	@RequestMapping("/guardar")
	public String guardar() {

		System.out.println("ni esta saliendo creo");

		try {

			//servicio.Guardar(usu);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/usuario/lista";
	}

	@RequestMapping("/solicitante")
	public String guardarSolicitante() {


		try {

			//servicio.Guardar(usu);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/usuario/index";
	}
	
	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("listaUsuarios",servicio.listarTodos());
		return "mantenimientoUsuario";
	}
	
	@RequestMapping("/eliminar")
	public String eliminarPorID(@RequestParam("codigo") Integer cod,
								RedirectAttributes redirect) {
		servicio.eliminarPorID(cod);
		redirect.addFlashAttribute("MENSAJE","Usuario eliminado");
		
		return "redirect:/usuario/lista";
	}
	
	@RequestMapping("/registroUsuario")
	public String prueba(RedirectAttributes redirect) {	
		return "registroUsuario";
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public Usuario buscarPorID(@RequestParam("codigo") Integer cod) {
		return servicio.buscarPorID(cod);
	}
}
