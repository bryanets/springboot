package com.hv.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hv.entity.Carrera;

public interface CarreraRepository extends JpaRepository<Carrera, Integer>{

	@Query("SELECT c.idCarrera, c.nombreCarrera, ca.descripcion, cu.nombreCurso, cu.creditos " +
			"FROM Carrera c " +
			"INNER JOIN c.cursos cu " +
			"INNER JOIN c.ciclosAcademicos ca " +
			"WHERE c.idCarrera = ?1")
	public List<Carrera> findAllByCarrera(int xCarrera);
}
