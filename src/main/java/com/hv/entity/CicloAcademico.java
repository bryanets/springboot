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
@Table(name = "ciclo_academico")
public class CicloAcademico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ciclo")
    private Integer idCiclo;
    @Column(name = "numero_ciclo")
    private int numeroCiclo;
    @Column(name = "descripcion")
    private String descripcion;
    
    // Relación ManyToOne con Carrera
    @ManyToOne
    @JoinColumn(name = "id_carrera")
    private Carrera carrera;
    
    // Relación OneToMany con CursosCiclo
    @OneToMany(mappedBy = "cicloAcademico")
    private List<CursosCiclo> cursosCiclo;

	public Integer getIdCiclo() {
		return idCiclo;
	}

	public void setIdCiclo(Integer idCiclo) {
		this.idCiclo = idCiclo;
	}

	public int getNumeroCiclo() {
		return numeroCiclo;
	}

	public void setNumeroCiclo(int numeroCiclo) {
		this.numeroCiclo = numeroCiclo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Carrera getCarrera() {
		return carrera;
	}

	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}

	public List<CursosCiclo> getCursosCiclo() {
		return cursosCiclo;
	}

	public void setCursosCiclo(List<CursosCiclo> cursosCiclo) {
		this.cursosCiclo = cursosCiclo;
	}
    

}

