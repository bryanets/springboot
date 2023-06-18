package com.hv.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hv.entity.Cursos;

public interface CursosRepository extends JpaRepository<Cursos, Integer>{
@Query("select c from Cursos c where c.carrera.idCarrera=?1")
public List<Cursos> cursosPorCarrera(int cod);
}
