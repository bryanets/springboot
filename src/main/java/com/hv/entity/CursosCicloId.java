package com.hv.entity;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;

public class CursosCicloId implements Serializable{
    @Column(name = "id_ciclo")
    private Long idCiclo;

    @Column(name = "id_curso")
    private Long idCurso;

	public Long getIdCiclo() {
		return idCiclo;
	}

	public void setIdCiclo(Long idCiclo) {
		this.idCiclo = idCiclo;
	}

	public Long getIdCurso() {
		return idCurso;
	}

	public void setIdCurso(Long idCurso) {
		this.idCurso = idCurso;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idCiclo, idCurso);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CursosCicloId other = (CursosCicloId) obj;
		return Objects.equals(idCiclo, other.idCiclo) && Objects.equals(idCurso, other.idCurso);
	}
    
    
}
