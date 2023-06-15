package com.hv.entity;

import java.util.List;

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
public class Cursos {

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
    private Carrera carrera;
    
    // Relación ManyToOne con Profesores
    @ManyToOne
    @JoinColumn(name = "id_profesor")
    private Profesores profesor;
    
    // Relación OneToMany con CursosCiclo
    @OneToMany(mappedBy = "curso")
    private List<CursosCiclo> cursosCiclo;
    
    // Relación OneToMany con Horarios
    @OneToMany(mappedBy = "curso")
    private List<Horarios> horarios;



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
    

}


	
	

