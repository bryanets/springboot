package com.hv.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "detallehorario")
public class DetalleHorario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_detalle")
	private Integer id_detalle;
/*
	@ManyToOne
	@JoinColumn(name = "id_curso")
	@JsonIgnore
	private Cursos cursoDetalle;

	@ManyToOne
	@JoinColumn(name = "id_horario")
	@JsonIgnore
	private Horarios horario;
*/
	private Integer id_horario;
	private Integer id_curso;
	
	@ManyToOne
	@JoinColumn(name = "id_matricula")
	@JsonIgnore
	private Matricula matriculaDetalle;

	public Integer getId_detalle() {
		return id_detalle;
	}

	public void setId_detalle(Integer id_detalle) {
		this.id_detalle = id_detalle;
	}

/*
	public Horarios getHorario() {
		return horario;
	}

	public void setHorario(Horarios horario) {
		this.horario = horario;
	}

	public Cursos getCursoDetalle() {
		return cursoDetalle;
	}

	public void setCursoDetalle(Cursos cursoDetalle) {
		this.cursoDetalle = cursoDetalle;
	}
*/
	
	public Matricula getMatriculaDetalle() {
		return matriculaDetalle;
	}

	public Integer getId_horario() {
		return id_horario;
	}

	public void setId_horario(Integer id_horario) {
		this.id_horario = id_horario;
	}

	public Integer getId_curso() {
		return id_curso;
	}

	public void setId_curso(Integer id_curso) {
		this.id_curso = id_curso;
	}

	public void setMatriculaDetalle(Matricula matriculaDetalle) {
		this.matriculaDetalle = matriculaDetalle;
	}


	
	
}
