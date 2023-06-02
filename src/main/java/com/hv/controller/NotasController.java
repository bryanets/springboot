package com.hv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Notas;
import com.hv.services.NotasServices;

@Controller
@RequestMapping("/notas")
public class NotasController {
	
	@Autowired
	private NotasServices servicio;
	
	@RequestMapping("/guardar")
	public String guardar(@RequestParam("codigo") Integer cod, @RequestParam("nota1") int not_1,
			@RequestParam("nota2") int not2, @RequestParam("nota3") int not3, 
			@RequestParam("nota4") int not4 , @RequestParam("nom_curso") String nombre ,RedirectAttributes redirect) {
				
				System.out.println("Ya valio xd");
				
				try {
					
					Notas not = new Notas();
					not.setCodigo(cod);
					not.setNot1(not_1);
					not.setNot2(not2);
					not.setNot3(not3);
					not.setNot4(not4);
					not.setNom_curso(nombre);
					
					servicio.Guardar(not);
					
					if (cod == 0) {
						redirect.addFlashAttribute("MENSAJE", "Usuario registrado");
					} else {
						redirect.addFlashAttribute("MENSAJE", "Usuario actualizado");
						
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "redirect:/notas/lista";
			}
	
			@GetMapping("/lista")
			public String index(Model model) { 
				model.addAttribute("listaNotas",servicio.listarTodos());
				return "mantenimientoNotas";
			}

}
