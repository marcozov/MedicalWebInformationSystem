package it.uniroma3.controller;

import it.uniroma3.model.Esame;
import it.uniroma3.model.Facade;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Risultato;

import java.util.LinkedList;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ControllerRisultato {
	
	private Long id;
	
	private Integer valore;
	
	private Long idindicatore;
	
	private Long esameid;
	
	private boolean nuovoRisultatoSucceded = false;
	
	private Esame esame;
	
	@EJB
	private Facade facade;

	public String aggiungiRisultato() {
		IndicatoreRisultato indicatoreRisultato = facade.getIndicatore(idindicatore);
		Risultato risultato = new Risultato(getValore(), indicatoreRisultato);
		esame.getRisultati().add(risultato);
		return "esameInserisciRisultato"; 
	}
	
	
	public String confermaInserimento() {
		facade.updateEsame(esame);
		return "adminPanel";
	}
	
	
	public String findEsame() {
		esameid = Long.valueOf(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("idesame"));  
		this.esame = facade.getEsame(esameid);
		return "esameInserisciRisultato";
	}
	
	
	public boolean isNuovoRisultatoSucceded() {
		return nuovoRisultatoSucceded;
	}

	public void setNuovoRisultatoSucceded(boolean nuovoRisultatoSucceded) {
		this.nuovoRisultatoSucceded = nuovoRisultatoSucceded;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getValore() {
		return valore;
	}

	public void setValore(Integer valore) {
		this.valore = valore;
	}

	public Long getIdindicatore() {
		return idindicatore;
	}

	public void setIdindicatore(Long idindicatore) {
		this.idindicatore = idindicatore;
	}


	public Esame getEsame() {
		return esame;
	}


	public void setEsame(Esame esame) {
		this.esame = esame;
	}


	public Facade getFacade() {
		return facade;
	}


	public void setFacade(Facade facade) {
		this.facade = facade;
	}


	public Long getEsameid() {
		return esameid;
	}


	public void setEsameid(Long esameid) {
		this.esameid = esameid;
	}
	
	
	
	
}
