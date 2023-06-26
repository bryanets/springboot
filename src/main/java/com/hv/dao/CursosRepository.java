package com.hv.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hv.entity.Cursos;

public interface CursosRepository extends JpaRepository<Cursos, Integer>{
@Query("select c from Cursos c where c.carrera.idCarrera=?1")
public List<Cursos> cursosPorCarrera(int cod);



@Query(value="SELECT c.id_curso,c.nombre_curso, i.id_ciclo,c.id_carrera,c.creditos,c.id_matricula,c.id_profesor FROM cursos c join cursos_ciclo i on c.id_curso=i.id_curso where id_carrera=?1 and id_ciclo=?2", nativeQuery = true)
public List<Cursos>buscarPorIDCiclo(int cod,int ci);
}

