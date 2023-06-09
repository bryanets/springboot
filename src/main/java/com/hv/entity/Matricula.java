package com.hv.entity;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "Matricula")
public class Matricula {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_matricula")
    private Long idMatricula;
    
    // Relación ManyToOne con Usuario
    @ManyToOne
    @JoinColumn(name = "id_usuario")
    @JsonIgnore
    private Usuario usuario;
    
    // Relación ManyToOne con Carrera
    @ManyToOne
    @JoinColumn(name = "id_carrera")
    private Carrera carrera;
    
    // Relación ManyToOne con Cursos
    @OneToMany(mappedBy = "matriculaCursos")
    @JsonIgnore
    private List<Cursos> listaCursos;
    
    
    @Column(name = "fecha_matricula")
    private LocalDate fechaMatricula;

    @OneToMany(mappedBy = "matricula")
    @JsonIgnore
    private List<Notas> notas;
    
    @OneToMany(mappedBy = "matriculaDetalle")
    private List<DetalleHorario> detalleHorario;
    
	public Long getIdMatricula() {
		return idMatricula;
	}

	public void setIdMatricula(Long idMatricula) {
		this.idMatricula = idMatricula;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Carrera getCarrera() {
		return carrera;
	}

	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}

	public List<Cursos> getListaCursos() {
		return listaCursos;
	}

	public void setListaCursos(List<Cursos> listaCursos) {
		this.listaCursos = listaCursos;
	}

	public LocalDate getFechaMatricula() {
		return fechaMatricula;
	}

	public void setFechaMatricula(LocalDate fechaMatricula) {
		this.fechaMatricula = fechaMatricula;
	}
	public List<Notas> getNotas() {
		return notas;
	}

	public void setNotas(List<Notas> notas) {
		this.notas = notas;
	}

	public List<DetalleHorario> getDetalleHorario() {
		return detalleHorario;
	}

	public void setDetalleHorario(List<DetalleHorario> detalleHorario) {
		this.detalleHorario = detalleHorario;
	}
    

}

