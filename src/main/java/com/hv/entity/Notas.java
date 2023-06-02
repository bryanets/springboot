package com.hv.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="tb_notas")
public class Notas {
	@Id // Llave principal
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremento PK
	@Column(name = "cod_usu")
	private Integer codigo;
	@Column(name = "nota1")
	private Integer not1;
	@Column(name = "nota2")
	private Integer not2;
	@Column(name = "nota3")
	private Integer not3;
	@Column(name = "nota4")
	private Integer not4;
	@Column(name = "nombre_curso")
	private String nom_curso;
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public Integer getNot1() {
		return not1;
	}
	public void setNot1(Integer not1) {
		this.not1 = not1;
	}
	public Integer getNot2() {
		return not2;
	}
	public void setNot2(Integer not2) {
		this.not2 = not2;
	}
	public Integer getNot3() {
		return not3;
	}
	public void setNot3(Integer not3) {
		this.not3 = not3;
	}
	public Integer getNot4() {
		return not4;
	}
	public void setNot4(Integer not4) {
		this.not4 = not4;
	}
	public String getNom_curso() {
		return nom_curso;
	}
	public void setNom_curso(String nom_curso) {
		this.nom_curso = nom_curso;
	}
	
	
}
