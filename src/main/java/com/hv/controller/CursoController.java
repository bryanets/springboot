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
import com.hv.services.CicloServices;
import com.hv.services.CursoServices;

@Controller
@RequestMapping("/curso")
public class CursoController {

	@Autowired
	private CursoServices serCurso;
	@Autowired
	private CicloServices serCiclo;
	
	
	@RequestMapping("/lista")
	public String index(Model model) {
		model.addAttribute("listaCursos",serCurso.listarCursos());
		model.addAttribute("listaCiclos",serCiclo.listarCiclos());
		return "curso";
	}

	
	@RequestMapping("/grabar")
	public String grabar(@RequestParam("codigo") Integer cod,
						 @RequestParam("nombre") String nom,
						 @RequestParam("creditos") int cre,
						 @RequestParam("horas") int hor,
						 @RequestParam("ciclo") int codCiclo,
						 RedirectAttributes redirect) {
		try {
			Curso cur=new Curso();
			cur.setNombre(nom);
			cur.setCreditos(cre);
			cur.setHoras(hor);
			Ciclo cic=new Ciclo();
			cic.setCodigo(codCiclo);
			cur.setCiclo(cic);
			if(cod==0) {
				serCurso.registrar(cur);
				redirect.addFlashAttribute("MENSAJE", "Curso registrado con éxito");
			}
			else {
				cur.setCodigo(cod);
				serCurso.actualizar(cur);
				redirect.addFlashAttribute("MENSAJE", "Curso actualizado con éxito");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/curso/lista";
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public Curso buscarPorID(@RequestParam("codigo") Integer cod) {
		return serCurso.buscarPorID(cod);
	}
	
	@RequestMapping("/eliminar")
	public String eliminarPorID(@RequestParam("codigo") Integer cod,
								RedirectAttributes redirect) {
		serCurso.eliminarPorID(cod);
		redirect.addFlashAttribute("MENSAJE", "Curso eliminado con éxito");
		return "redirect:/curso/lista";
	}
}
