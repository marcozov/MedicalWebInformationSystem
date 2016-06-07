package it.uniroma3.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import it.uniroma3.model.Facade;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Prerequisito;
import it.uniroma3.model.TipologiaEsame;
import it.uniroma3.utils.JSONUtils;

@ManagedBean
public class ControllerTipologia {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String codice;
	private String nome;
	private Double costo;
	private String descrizione;
	private String prerequisiti;
	private String indicatori;
	private List<TipologiaEsame> tipologie;
	private TipologiaEsame tipologia;
	
	@EJB
	private Facade facade;
	
	public String inserisci() {
		List<Prerequisito> prerequisiti = JSONUtils.getPrerequisiti(this.prerequisiti);
		List<IndicatoreRisultato> indicatori = JSONUtils.getIndicatoriRisultato(this.indicatori);
		facade.inserisciTipologia(codice, nome, descrizione, costo, prerequisiti, indicatori);
		this.prerequisiti = "";
		this.indicatori = "";
		return "nuovaTipologia";
	}
	
	@PostConstruct
	public void elencoTipologie() {
		this.tipologie = this.facade.getAllTipologieEsame();
	}
	
	public String findTipologia() {
		this.tipologia = this.facade.getTipologiaEsame(id);
		return "tipologia";
	}
	
	// getter e setter
	
	public List<TipologiaEsame> getTipologie() {
		return tipologie;
	}

	public TipologiaEsame getTipologia() {
		return tipologia;
	}

	public void setTipologia(TipologiaEsame tipologia) {
		this.tipologia = tipologia;
	}

	public void setTipologie(List<TipologiaEsame> tipologie) {
		this.tipologie = tipologie;
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

	public String getPrerequisiti() {
		return prerequisiti;
	}

	public void setPrerequisiti(String prerequisiti) {
		this.prerequisiti = prerequisiti;
	}

	public String getIndicatori() {
		return indicatori;
	}

	public void setIndicatori(String indicatori) {
		this.indicatori = indicatori;
	}

	public Facade getFacade() {
		return facade;
	}

	public void setFacade(Facade facade) {
		this.facade = facade;
	}

	public Double getCosto() {
		return costo;
	}

	public void setCosto(Double costo) {
		this.costo = costo;
	}

		
	
}
