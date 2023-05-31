package com.hv.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="ciclo")
public class Ciclo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="codCiclo")
	private Integer codigo;
	@Column(name="nomCiclo")
	private String nombre;
	
	@OneToMany(mappedBy = "ciclo")
	@JsonIgnore
	private List<Curso> listaCursos;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Curso> getListaCursos() {
		return listaCursos;
	}

	public void setListaCursos(List<Curso> listaCursos) {
		this.listaCursos = listaCursos;
	}
	
	
}
