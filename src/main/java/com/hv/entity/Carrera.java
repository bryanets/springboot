package com.hv.entity;

import java.io.Serializable;
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
@Table(name = "Carrera")
public class Carrera implements Serializable {
	private static final long serialVersionUID =1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_carrera")
    private Integer idCarrera;
    @Column(name = "nombre_carrera")
    private String nombreCarrera;
    @Column(name = "duracion")
    private int duracion;
    @Column(name = "descripcion")
    private String descripcion;
    
    // Relación OneToMany con CicloAcademico
    @OneToMany(mappedBy = "carrera")
    @JsonIgnore
    private List<CicloAcademico> ciclosAcademicos;
    
    // Relación OneToMany con Cursos
    @OneToMany(mappedBy = "carrera")
    //@JsonIgnore
    private List<Cursos> cursos;

	public Integer getIdCarrera() {
		return idCarrera;
	}

	public void setIdCarrera(Integer idCarrera) {
		this.idCarrera = idCarrera;
	}

	public String getNombreCarrera() {
		return nombreCarrera;
	}

	public void setNombreCarrera(String nombreCarrera) {
		this.nombreCarrera = nombreCarrera;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<CicloAcademico> getCiclosAcademicos() {
		return ciclosAcademicos;
	}

	public void setCiclosAcademicos(List<CicloAcademico> ciclosAcademicos) {
		this.ciclosAcademicos = ciclosAcademicos;
	}

	public List<Cursos> getCursos() {
		return cursos;
	}

	public void setCursos(List<Cursos> cursos) {
		this.cursos = cursos;
	}


    
    
}
