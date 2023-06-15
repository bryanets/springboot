package com.hv.dao;

<<<<<<< HEAD
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
=======
import org.springframework.data.jpa.repository.JpaRepository;
>>>>>>> 73f1c24056b4412a17db45dc06726d581919b922

import com.hv.entity.Carrera;

public interface CarreraRepository extends JpaRepository<Carrera, Integer>{

<<<<<<< HEAD
	@Query("SELECT c.idCarrera, c.nombreCarrera, ca.descripcion, cu.nombreCurso, cu.creditos " +
			"FROM Carrera c " +
			"INNER JOIN c.cursos cu " +
			"INNER JOIN c.ciclosAcademicos ca " +
			"WHERE c.idCarrera = ?1")
	public List<Carrera> findAllByCarrera(int xCarrera);
=======
>>>>>>> 73f1c24056b4412a17db45dc06726d581919b922
}
