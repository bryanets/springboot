package com.hv.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

//import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
//import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Cursos")
public class Cursos implements Serializable{
	private static final long serialVersionUID =1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_curso")
    private Integer id_curso;
    @Column(name = "nombre_curso")
    private String nombreCurso;
    @Column(name = "creditos")
    private Integer creditos;

    
    // Relación ManyToOne con Carrera
    @ManyToOne
    @JoinColumn(name = "id_carrera")
    @JsonIgnore
    private Carrera carrera;
    
    // Relación ManyToOne con Profesores
    @ManyToOne
    @JoinColumn(name = "id_profesor")
    @JsonIgnore
    private Profesores profesor;
    
    // Relación OneToMany con CursosCiclo
    @OneToMany(mappedBy = "curso")
    private List<CursosCiclo> cursosCiclo;
    
    // Relación OneToMany con Horarios
    @OneToMany(mappedBy = "curso")
    private List<Horarios> horarios;

    @OneToMany(mappedBy = "cursos")
    private List<Notas> notas;

	public Integer getId_curso() {
		return id_curso;
	}

	public void setId_curso(Integer id_curso) {
		this.id_curso = id_curso;
	}



	public String getNombreCurso() {
		return nombreCurso;
	}

	public void setNombreCurso(String nombreCurso) {
		this.nombreCurso = nombreCurso;
	}

	public Integer getCreditos() {
		return creditos;
	}

	public void setCreditos(Integer creditos) {
		this.creditos = creditos;
	}

	public Carrera getCarrera() {
		return carrera;
	}

	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}

	public Profesores getProfesor() {
		return profesor;
	}

	public void setProfesor(Profesores profesor) {
		this.profesor = profesor;
	}

	public List<CursosCiclo> getCursosCiclo() {
		return cursosCiclo;
	}

	public void setCursosCiclo(List<CursosCiclo> cursosCiclo) {
		this.cursosCiclo = cursosCiclo;
	}

	public List<Horarios> getHorarios() {
		return horarios;
	}

	public void setHorarios(List<Horarios> horarios) {
		this.horarios = horarios;
	}
	public List<Notas> getNotas() {
		return notas;
	}

	public void setNotas(List<Notas> notas) {
		this.notas = notas;
	}

}


	
	

