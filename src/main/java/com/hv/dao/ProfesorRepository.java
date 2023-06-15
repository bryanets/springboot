package com.hv.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hv.entity.Cursos;
import com.hv.entity.Profesores;

public interface ProfesorRepository extends JpaRepository<Profesores, Integer>{

}
