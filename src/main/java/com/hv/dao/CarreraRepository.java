package com.hv.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hv.entity.Carrera;

public interface CarreraRepository extends JpaRepository<Carrera, Integer> {

}

