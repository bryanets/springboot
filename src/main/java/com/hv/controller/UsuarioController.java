package com.hv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Enlace;
import com.hv.entity.Rol;
import com.hv.entity.Usuario;
import com.hv.services.RolService;
import com.hv.services.UsuarioServices;

@SessionAttributes({ "datos", "enlaces" })
@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	@Autowired
	private UsuarioServices servicio;
	
	@Autowired
	private RolService rolService;
	
	
	@RequestMapping("/validar")
	public String index() {

		return "login";
	}
	
	@RequestMapping("/index")
	public String home(Model model) {
        model.addAttribute("datos", "valor de datos");
        model.addAttribute("enlaces", "valor de enlaces");
		return "index";
	}

	@RequestMapping("/intranet")
	public String itranet(Authentication auth, Model model) {
		String nomLogin = auth.getName();
		Usuario bean = servicio.validarUsuario(nomLogin);
		List<Enlace> datos = servicio.enlacesDelUsuario(bean.getRol().getCodigo());
		model.addAttribute("enlaces", datos);
		model.addAttribute("datos", bean.getApellido() + " " + bean.getNombre());
		return "intranet";
	}

	@RequestMapping("/guardar")
	public String guardar(@RequestParam("codigo") Integer cod, @RequestParam("nombre") String nom,@RequestParam("pas") String pas,
			@RequestParam("apellido") String ape, @RequestParam("dni") String dni, @RequestParam("celular") String cel,
			@RequestParam("edad") int edad, @RequestParam("email") String email, @RequestParam("sexo") String sexo,
			@RequestParam("login") String login,@RequestParam("rol") int rol, RedirectAttributes redirect) {

		System.out.println("ni esta saliendo creo");

		try {

			Usuario usu = new Usuario();
			usu.setCodigo(cod);
			usu.setLogin(login);
			usu.setClave(pas);
			usu.setNombre(nom);
			usu.setApellido(ape);
			usu.setDni(dni);
			usu.setCelular(cel);
			usu.setEdad(edad);
			usu.setEmail(email);
			usu.setSexo(sexo);

			Rol r = new Rol();
			r.setCodigo(rol);
			usu.setRol(r);

			servicio.Guardar(usu);

			if (cod == 0) {
				redirect.addFlashAttribute("MENSAJE", "Usuario registrado");
			} else {
				redirect.addFlashAttribute("MENSAJE", "Usuario actualizado");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/usuario/lista";
	}

	@RequestMapping("/solicitante")
	public String guardarSolicitante(@RequestParam("codigo") Integer cod, @RequestParam("nombre") String nom,
			@RequestParam("apellido") String ape, @RequestParam("dni") String dni, @RequestParam("celular") String cel,
			@RequestParam("edad") int edad, @RequestParam("email") String email, @RequestParam("sexo") String sexo,
			@RequestParam("login") String login,@RequestParam("rol") int rol, RedirectAttributes redirect) {


		try {

			Usuario usu = new Usuario();
			usu.setCodigo(cod);
			usu.setLogin(login);
			usu.setNombre(nom);
			usu.setApellido(ape);
			usu.setDni(dni);
			usu.setCelular(cel);
			usu.setEdad(edad);
			usu.setEmail(email);
			usu.setSexo(sexo);

			Rol r = new Rol();
			r.setCodigo(rol);
			usu.setRol(r);

			servicio.Guardar(usu);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/usuario/index";
	}
	
	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("listaUsuarios",servicio.listarTodos());
		model.addAttribute("listaRol",rolService.listarRol());
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
