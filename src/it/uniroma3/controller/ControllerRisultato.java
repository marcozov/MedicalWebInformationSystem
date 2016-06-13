package it.uniroma3.controller;

import it.uniroma3.model.Esame;
import it.uniroma3.model.Facade;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Risultato;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
public class ControllerRisultato {
	
	private Long id;
	
	@ManagedProperty(value="#{param.valore}")
	private Integer valore;
	
	@ManagedProperty(value="#{param.idindicatore}")
	private Long idindicatore;
	
	@ManagedProperty(value="#{param.idesame}")
	private Long idesame;
	
	private boolean nuovoRisultatoSucceded = false;
	
	@EJB
	private Facade facade;

	public String aggiungiRisultato() {
	/*	IndicatoreRisultato indicatoreRisultato = facade.getIndicatore(idindicatore);
		Risultato risultato = new Risultato(getValore(), indicatoreRisultato);
		Esame esame = facade.getEsame(idesame);
		esame.getRisultati().add(risultato);
		facade.updateEsame(esame); */
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

	public Long getIdesame() {
		return idesame;
	}

	public void setIdesame(Long idesame) {
		this.idesame = idesame;
	}
	
	
	
}
