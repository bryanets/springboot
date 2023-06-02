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
	
	@SuppressWarnings("removal")
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeHttpRequests()
                .requestMatchers("/usuario/**","/curso/**").permitAll()
                .and().authorizeHttpRequests()
                .requestMatchers("/curso/**","/horario/**","/registroUsuario/**","/mantenimientoUsuario", "/mantenimientoNotas")
                .authenticated().and()
                .formLogin(login -> login.loginPage("/usuario/validar")
                        .defaultSuccessUrl("/usuario/intranet"));
		
		return http.build();
		
	}
	
	
	@Bean
	public UserDetailsService userDetailsService() {
		
		return new SecurityInfo();
	}
	
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
