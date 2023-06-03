package com.hv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Ciclo;
import com.hv.entity.Curso;
import com.hv.entity.HorarioSeccion;
import com.hv.services.CursoServices;
import com.hv.services.HorarioSeccionServices;

@Controller
@RequestMapping("/horario")
public class HorarioSeccionController {
	@Autowired
	private HorarioSeccionServices serHora;
	
	@Autowired
	private CursoServices serCurso;
	
	@RequestMapping("/lista")
	public String index(Model model) {
		model.addAttribute("listaCursos",serCurso.listarCursos());
		model.addAttribute("listaHorario",serHora.listarTodo());
		return "horario";
	}
	
	@RequestMapping("/grabar")
	public String grabar(@RequestParam("codigo") Integer cod,
						 @RequestParam("horario") String hor,
						 @RequestParam("seccion") String sec,
						 @RequestParam("dia") String dia,
						 @RequestParam("curso") int codCurso,
						 RedirectAttributes redirect) {
		try {
			HorarioSeccion hs=new HorarioSeccion();
			hs.setHorario(hor);
			hs.setSeccion(sec);
			hs.setDia(dia);
			Curso cu=new Curso();
			cu.setCodigo(codCurso);
			hs.setCurso(cu);
			if(cod==0) {
				serHora.registrar(hs);
				redirect.addFlashAttribute("MENSAJE", "Horario y Seccion registrado con éxito");
			}
			else {
				hs.setCodigo(cod);
				serHora.actualizar(hs);
				redirect.addFlashAttribute("MENSAJE", "Horario y Seccion actualizado con éxito");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/horario/lista";
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public HorarioSeccion buscarPorID(@RequestParam("codigo") Integer cod) {
		return serHora.buscarPorId(cod);
	}
	
	
	@RequestMapping("/eliminar")
	public String eliminarPorID(@RequestParam("codigo") Integer cod,
								RedirectAttributes redirect) {
		serCurso.eliminarPorID(cod);
		redirect.addFlashAttribute("MENSAJE", "Horario y Seccion eliminado con éxito");
		return "redirect:/horario/lista";
	}
	
}
