package it.uniroma3.controller;

import it.uniroma3.model.Esame;
import it.uniroma3.model.Facade;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Risultato;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
public class ControllerRisultato {
	private Long id;
	
	@ManagedProperty(value="#{param.valore}")
	private Long valore;
//	private int valore;
	
	private IndicatoreRisultato indicatoreRisultato;
	
	@ManagedProperty(value="#{param.idesame}")
	private Long idesame;
	
	@ManagedProperty(value="#{param.idindicatore}")
	private Long idindicatore;
	
	private boolean nuovoRisultatoSucceded;
	
	@EJB
	private Facade facade;
	
	public String aggiungiRisultato() {
		nuovoRisultatoSucceded = false;
	//	Esame esame = facade.getEsame(idesame);
		IndicatoreRisultato indicatore = facade.getIndicatoreRisultato(idindicatore);
		Risultato risultato = new Risultato();
		risultato.setValore(valore);
		risultato.setIndicatoreRisultato(indicatore);
		facade.aggiungiRisultato(risultato);
		//se tutto va bene...
		nuovoRisultatoSucceded = true;
		return "esameInserisciRisultato";
	} 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getValore() {
		return valore;
	}

	public void setValore(Long valore) {
		this.valore = valore;
	}

	public IndicatoreRisultato getIndicatoreRisultato() {
		return indicatoreRisultato;
	}

	public void setIndicatoreRisultato(IndicatoreRisultato indicatoreRisultato) {
		this.indicatoreRisultato = indicatoreRisultato;
	}

	public Long getIdesame() {
		return idesame;
	}

	public void setIdesame(Long idesame) {
		this.idesame = idesame;
	}

	public Long getIdindicatore() {
		return idindicatore;
	}

	public void setIdindicatore(Long idindicatore) {
		this.idindicatore = idindicatore;
	}

	public boolean isNuovoRisultatoSucceded() {
		return nuovoRisultatoSucceded;
	}

	public void setNuovoRisultatoSucceded(boolean nuovoRisultatoSucceded) {
		this.nuovoRisultatoSucceded = nuovoRisultatoSucceded;
	}

	public Facade getFacade() {
		return facade;
	}

	public void setFacade(Facade facade) {
		this.facade = facade;
	}
	
	
}
