package com.hv.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="cursos")
public class Curso {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="cod_curso")
	private Integer codigo;
	@Column(name="nombre_curso")
	private String nombre;
	@Column(name="credi_curso")
	private int creditos;
	@Column(name="horas_curso")
	private int horas;
	
	@ManyToOne
	@JoinColumn(name="codCiclo")
	private Ciclo ciclo;
	
	@OneToMany
	@JoinColumn(name="cod_HS")
	private List<HorarioSeccion> listaHorario;
	
	public List<HorarioSeccion> getListaHorario() {
		return listaHorario;
	}

	public void setListaHorario(List<HorarioSeccion> listaHorario) {
		this.listaHorario = listaHorario;
	}

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

	public int getCreditos() {
		return creditos;
	}

	public void setCreditos(int creditos) {
		this.creditos = creditos;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public Ciclo getCiclo() {
		return ciclo;
	}

	public void setCiclo(Ciclo ciclo) {
		this.ciclo = ciclo;
	}
	
	
}
