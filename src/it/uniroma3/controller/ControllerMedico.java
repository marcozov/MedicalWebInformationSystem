package it.uniroma3.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import it.uniroma3.model.Facade;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Medico;
import it.uniroma3.model.Prerequisito;
import it.uniroma3.model.TipologiaEsame;
import it.uniroma3.utils.JSONUtils;

@ManagedBean
public class ControllerMedico {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String nome;
	private String cognome;
	private String specializzazione;
	private List<Medico> medici;
	
	@EJB
	private Facade facade;
	
	@PostConstruct
	public void elencoMedici() {
		this.medici = this.facade.getAllMedici();
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

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getSpecializzazione() {
		return specializzazione;
	}

	public void setSpecializzazione(String specializzazione) {
		this.specializzazione = specializzazione;
	}

	public List<Medico> getMedici() {
		return medici;
	}

	public void setMedici(List<Medico> medici) {
		this.medici = medici;
	}

	public Facade getFacade() {
		return facade;
	}

	public void setFacade(Facade facade) {
		this.facade = facade;
	}
	
	// getter e setter
	
	
}
