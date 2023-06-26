package com.hv.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Notas")
public class Notas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo")
    private int codigo;

    @Column(name = "CL1")
    private int cl1;

    @Column(name = "CL2")
    private int cl2;

    @Column(name = "CL3")
    private int cl3;

    @Column(name = "SP")
    private int sp;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idMatricula")
    private Matricula matricula;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "id_curso")
    private Cursos cursos;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getCl1() {
		return cl1;
	}

	public void setCl1(int cl1) {
		this.cl1 = cl1;
	}

	public int getCl2() {
		return cl2;
	}

	public void setCl2(int cl2) {
		this.cl2 = cl2;
	}

	public int getCl3() {
		return cl3;
	}

	public void setCl3(int cl3) {
		this.cl3 = cl3;
	}

	public int getSp() {
		return sp;
	}

	public void setSp(int sp) {
		this.sp = sp;
	}

	public Matricula getMatricula() {
		return matricula;
	}

	public void setMatricula(Matricula matricula) {
		this.matricula = matricula;
	}

	public Cursos getCursos() {
		return cursos;
	}

	public void setCursos(Cursos cursos) {
		this.cursos = cursos;
	}

   
}
