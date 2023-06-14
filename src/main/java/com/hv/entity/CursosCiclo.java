package com.hv.entity;


//import java.util.List;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "cursos_ciclo")
public class CursosCiclo {

    @EmbeddedId
    private CursosCicloId id;
    
    // Relación ManyToOne con CicloAcademico
    @ManyToOne
    @MapsId("idCiclo")
    @JoinColumn(name = "id_ciclo")
    private CicloAcademico cicloAcademico;
    
    // Relación ManyToOne con Cursos
    @ManyToOne
    @MapsId("idCurso")
    @JoinColumn(name = "id_curso")
    private Cursos curso;

	public CursosCicloId getId() {
		return id;
	}

	public void setId(CursosCicloId id) {
		this.id = id;
	}

	public CicloAcademico getCicloAcademico() {
		return cicloAcademico;
	}

	public void setCicloAcademico(CicloAcademico cicloAcademico) {
		this.cicloAcademico = cicloAcademico;
	}

	public Cursos getCurso() {
		return curso;
	}

	public void setCurso(Cursos curso) {
		this.curso = curso;
	}
    

}

