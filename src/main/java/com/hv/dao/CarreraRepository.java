package com.hv.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;




import com.hv.entity.Carrera;

public interface CarreraRepository extends JpaRepository<Carrera, Integer>{


	@Query("SELECT ca.idCarrera, ca.nombreCarrera, cu.nombreCurso, cu.creditos, ci.descripcion, cc.cicloAcademico.idCiclo " +
            "FROM Carrera ca " +
            "JOIN ca.cursos cu " +
            "JOIN cu.cursosCiclo cc " +
            "JOIN cc.cicloAcademico ci " +
            "WHERE ca.idCarrera = 1")
	public List<Carrera> findAllByCarrera(int xCarrera);

}

/*
select ca.id_carrera,ca.nombre_carrera, cu.nombre_curso,cu.creditos, ci.descripcion,cc.id_ciclo from carrera ca 
join cursos cu on cu.id_carrera=ca.id_carrera 
join cursos_ciclo cc on cc.id_curso=cu.id_curso
join ciclo_academico ci on ci.id_ciclo=cc.id_ciclo 
where ca.id_carrera=1; 
 */