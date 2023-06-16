package com.hv;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;





import com.hv.security.SecurityInfo;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeHttpRequests().requestMatchers("/usuario/**","/imagenes/**").permitAll().and()
				.authorizeHttpRequests().requestMatchers("/curso/**", "/horario/**", "/carrera/**", "/mantenimiento/**", "/intranet/**", "/matricula/**").authenticated().and().formLogin()
				.loginPage("/usuario/validar").defaultSuccessUrl("/usuario/intranet");
		return http.build();
	}

	@Bean
	public UserDetailsService userDetailsService() {

		return new SecurityInfo();
	}

	// método(registrado en el contenedor del spring) para registrar el uso de
	// encriptar claves
	@Bean
	public BCryptPasswordEncoder encriptador() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationProvider validarClave() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService());
		provider.setPasswordEncoder(encriptador());
		return provider;
	}

}
