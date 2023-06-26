package com.hv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hv.entity.Carrera;
import com.hv.entity.Enlace;
import com.hv.entity.Rol;
import com.hv.entity.Usuario;
import com.hv.services.RolService;
import com.hv.services.UsuarioServices;

@SessionAttributes({ "datos", "enlaces","tipo" })
@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	@Autowired
	private UsuarioServices usuService;
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	

	@GetMapping("/lista")
	public String index(Model model) {
		model.addAttribute("listaUsuarios", usuService.listarTodos());
		return "usuario";
	}

	@GetMapping("/agregar")
	public String agregar(Usuario usuario, Model model) {
		 model.addAttribute("rol", rolService.listarTodos());
		// model.addAttribute("profesores", serProfesor.listarProfesores());
		return "mantenimientoUsuario";
	}

	@PostMapping("/grabar")
	public String guardar(Usuario usuario) {
		usuService.Guardar(usuario);
		return "redirect:/usuario/lista";
	}

	@PostMapping("/grabarSolicitante")
	public String guardarSolicitante(@RequestParam("nombre") String nom,
			@RequestParam("apellido") String ape, @RequestParam("dni") String dni, @RequestParam("email") String email,
			@RequestParam("clave") String clave, @RequestParam("login") String login) {

		Usuario usu = new Usuario();
		usu.setIdUsuario(0);
		usu.setNombre(nom);
		usu.setApellido(ape);
		usu.setDni(dni);
		usu.setCorreoElectronico(email);
		clave=encoder.encode(clave);
		usu.setClave(clave);
		usu.setLogin(login);
		
		
		Rol r = new Rol();
		r.setCodigo(3);
		usu.setRol(r);
		usuService.Guardar(usu);
		return "redirect:/usuario/validar";
	}

	@GetMapping("/editar/{idUsuario}")
	public String editar(Usuario usuario, Model model) {
		usuario = usuService.buscarPorID(usuario);
		model.addAttribute("rol", rolService.listarTodos());
		// model.addAttribute("profesores", serProfesor.listarProfesores());
		model.addAttribute("usuario", usuario);

		return "mantenimientoUsuario";
	}

	@GetMapping("/eliminar/{idUsuario}")
	public String eliminar(Usuario usuario,RedirectAttributes redirect) {
		usuService.eliminar(usuario);
		redirect.addFlashAttribute("MENSAJE","Usuario eliminado");
		return "redirect:/usuario/lista";
	}

	@RequestMapping("/intranet") // ingresar con http://localhost:8090/usuario/intranet
	public String intranet(Authentication auth, Model model) {
		String nomLogin = auth.getName();
		Usuario bean = usuService.validarUsuario(nomLogin);
		List<Enlace> datos = usuService.enlacesDelUsuario(bean.getRol().getCodigo());
		model.addAttribute("datos", bean.getApellido() + " " + bean.getNombre());
		model.addAttribute("enlaces", datos);
		model.addAttribute("usuario", bean);
		if(bean.getRol().getCodigo()==1){
			model.addAttribute("tipo", true);
			return "redirect:/usuario/lista";
		}else {
			model.addAttribute("tipo", false);
		return "intranet";}
	}

	@RequestMapping("/validar")
	public String index() {
		return "login";
	}
	
	@RequestMapping("/buscarPorId")
	@ResponseBody
	public Usuario buscar(@RequestParam("idUsuario") int cod) {

		Usuario u = new Usuario();
		u.setIdUsuario(cod);
		return usuService.buscarPorID(u);
	}

}
