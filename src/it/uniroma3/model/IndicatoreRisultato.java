package it.uniroma3.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

@Entity
// @NamedQuery(name = "findAllIndicatoreRisultato", query = "select ir from indicatorerisultato ir")
public class IndicatoreRisultato {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String nome;
	
	@ManyToOne
	@JoinColumn(name = "tipologia_id")
	private TipologiaEsame tipologiaEsame;

	public IndicatoreRisultato(){}
	
	public IndicatoreRisultato(String nome) {
		this.nome = nome;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
