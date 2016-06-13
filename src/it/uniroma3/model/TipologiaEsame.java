package it.uniroma3.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
//@NamedQuery(name = "findAllTipologiaEsame", query = "select te from tipologiaesame te")
public class TipologiaEsame {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String codice;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private String descrizione;
	
	@Column(nullable = false)
	private double costo;
	
	@OneToMany(cascade={CascadeType.PERSIST})
	@JoinColumn(name = "tipologia_id")		// dice con che attributo la tabella degli indicatori dei risultati
											// dovra' indicare la tipologia dell'esame
											// notare l'assenza di doppia navigabilita'
	private List<IndicatoreRisultato> indicatoriRisultato;

	@OneToMany(cascade={CascadeType.PERSIST},fetch=FetchType.EAGER)
	@JoinColumn(name = "tipologia_id")		// come indicatoriRisultato
	private List<Prerequisito> prerequisiti;
	
	@OneToMany(mappedBy = "tipologiaEsame") // mappato dalla variabile contenente il riferimento di TipologiaEsame
											// notare la presenza di doppia navigabilita': e' l'altra classe
											// a definire quale attributo fara' riferimento a TipologiaEsame
	private List<Esame> esami;

	public TipologiaEsame(){
		this.prerequisiti = new LinkedList<>();
		this.indicatoriRisultato = new LinkedList<>();
		this.esami = new LinkedList<>();
	}
	
	public TipologiaEsame(String codice, String nome, String descrizione, double costo) {
		this();
		this.codice = codice;
		this.nome = nome;
		this.descrizione = descrizione;
		this.costo = costo;
		
		
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCodice() {
		return codice;
	}
	public void setCodice(String codice) {
		this.codice = codice;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public List<IndicatoreRisultato> getIndicatoriRisultato() {
		return indicatoriRisultato;
	}
	public void setIndicatoriRisultato(List<IndicatoreRisultato> indicatoriRisultato) {
		this.indicatoriRisultato = indicatoriRisultato;
	}
	public List<Prerequisito> getPrerequisiti() {
		return prerequisiti;
	}
	public void setPrerequisiti(List<Prerequisito> prerequisiti) {
		this.prerequisiti = prerequisiti;
	}
	public List<Esame> getEsami() {
		return esami;
	}
	public void setEsami(List<Esame> esami) {
		this.esami = esami;
	}
	
}
