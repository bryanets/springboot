package com.hv.entity;

import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Horarios")
public class Horarios {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_horario")
<<<<<<< HEAD
    private Long idHorario;
=======
    private Integer idHorario;
>>>>>>> 73f1c24056b4412a17db45dc06726d581919b922
    @Column(name = "dia_semana")
    private String diaSemana;
    @Column(name = "hora_inicio")
    private LocalTime horaInicio;
    @Column(name = "hora_fin")
    private LocalTime horaFin;
    @Column(name = "aula")
    private String aula;
    
    // Relación ManyToOne con Cursos
    @ManyToOne
    @JoinColumn(name = "id_curso")
    private Cursos curso;

<<<<<<< HEAD
	public Long getIdHorario() {
		return idHorario;
	}

	public void setIdHorario(Long idHorario) {
=======
	

	public Integer getIdHorario() {
		return idHorario;
	}

	public void setIdHorario(Integer idHorario) {
>>>>>>> 73f1c24056b4412a17db45dc06726d581919b922
		this.idHorario = idHorario;
	}

	public String getDiaSemana() {
		return diaSemana;
	}

	public void setDiaSemana(String diaSemana) {
		this.diaSemana = diaSemana;
	}

	public LocalTime getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(LocalTime horaInicio) {
		this.horaInicio = horaInicio;
	}

	public LocalTime getHoraFin() {
		return horaFin;
	}

	public void setHoraFin(LocalTime horaFin) {
		this.horaFin = horaFin;
	}

	public String getAula() {
		return aula;
	}

	public void setAula(String aula) {
		this.aula = aula;
	}

	public Cursos getCurso() {
		return curso;
	}

	public void setCurso(Cursos curso) {
		this.curso = curso;
	}

    
}

