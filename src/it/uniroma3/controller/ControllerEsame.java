package it.uniroma3.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import it.uniroma3.model.Facade;
import it.uniroma3.model.Esame;
import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Medico;
import it.uniroma3.model.Paziente;
import it.uniroma3.model.Risultato;
import it.uniroma3.model.TipologiaEsame;

@ManagedBean
public class ControllerEsame {
	@ManagedProperty(value="#{param.id}")
	private Long id;
	private Date dataEsame;
	private Date dataPrenotazione;
	@ManagedProperty(value="#{param.idpaziente}")
	private Long idpaziente;
	private Paziente paziente;
	private TipologiaEsame tipologiaEsame;
	@ManagedProperty(value="#{param.idtipologia}")
	private Long idtipologia;
	private Medico medico; // mi sa che bisogna metterci l'id... ?
	@ManagedProperty(value="#{param.idmedico}")
	private Long idmedico;
	private List<Risultato> risultati;
	private boolean nuovoEsameSucceded = false;
	
	private List<Esame> esamiMedicoScelto;   // Non so quanto sia corretto che sia qui
											 // Se non qui dove???
	private List<Esame> esami;
	private Esame esame;
	
	// serve qualcosa con gli indicatori di risultato relativi a una certa tipologia, per poter inserire
	// relativi risultati (UC6)
	private List<IndicatoreRisultato> listaIndicatori;
	
	@EJB Facade facade;
	
	@PostConstruct
	public void elencoEsami() {
		this.esami = facade.getAllEsami();
	}
	
	public String aggiungiEsame() {
		nuovoEsameSucceded = false;
		dataPrenotazione = new Date();
		this.setMedico(facade.getMedico(idmedico));
		this.setTipologiaEsame(facade.getTipologiaEsame(idtipologia));
		this.setPaziente(facade.getPaziente(idpaziente));
		facade.inserisciEsame(dataPrenotazione, dataEsame, paziente, tipologiaEsame, medico);
		nuovoEsameSucceded = true;
		return "nuovoEsame";
	}
	
	public String findEsamiPerMedico() {
		esamiMedicoScelto = facade.getEsamiPerMedico(idmedico);
		return "esamiPerMedico";
	}
	
	public String findEsame() {
		this.esame = facade.getEsame(id);
		// idtipologia dovrebbe essere disponibile
		listaIndicatori = facade.getIndicatoriPerTipologia(idtipologia);
		return "esameInserisciRisultato";
	}
	
	public Long getIdpaziente() {
		return idpaziente;
	}

	public void setIdpaziente(Long idpaziente) {
		this.idpaziente = idpaziente;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDataEsame() {
		return dataEsame;
	}
	public void setDataEsame(Date dataEsame) {
		this.dataEsame = dataEsame;
	}
	public Date getDataPrenotazione() {
		return dataPrenotazione;
	}
	public void setDataPrenotazione(Date dataPrenotazione) {
		this.dataPrenotazione = dataPrenotazione;
	}
	public Paziente getPaziente() {
		return paziente;
	}
	public void setPaziente(Paziente paziente) {
		this.paziente = paziente;
	}
	public TipologiaEsame getTipologiaEsame() {
		return tipologiaEsame;
	}
	public void setTipologiaEsame(TipologiaEsame tipologiaEsame) {
		this.tipologiaEsame = tipologiaEsame;
	}
	public Medico getMedico() {
		return medico;
	}
	public void setMedico(Medico medico) {
		this.medico = medico;
	}
	public List<Risultato> getRisultati() {
		return risultati;
	}
	public void setRisultati(List<Risultato> risultati) {
		this.risultati = risultati;
	}
	public boolean isNuovoEsameSucceded() {
		return nuovoEsameSucceded;
	}
	public void setNuovoEsameSucceded(boolean nuovoEsameSucceded) {
		this.nuovoEsameSucceded = nuovoEsameSucceded;
	}

	public Long getIdmedico() {
		return idmedico;
	}

	public void setIdmedico(Long idmedico) {
		this.idmedico = idmedico;
	}

	public Facade getEsameFacade() {
		return facade;
	}

	public void setEsameFacade(Facade esameFacade) {
		this.facade = esameFacade;
	}

	public Long getIdtipologia() {
		return idtipologia;
	}

	public void setIdtipologia(Long idtipologia) {
		this.idtipologia = idtipologia;
	}

	public Facade getFacade() {
		return facade;
	}

	public void setFacade(Facade facade) {
		this.facade = facade;
	}

	public List<Esame> getEsamiMedicoScelto() {
		return esamiMedicoScelto;
	}

	public void setEsamiMedicoScelto(List<Esame> esamiMedicoScelto) {
		this.esamiMedicoScelto = esamiMedicoScelto;
	}

	public List<Esame> getEsami() {
		return esami;
	}

	public void setEsami(List<Esame> esami) {
		this.esami = esami;
	}

	public Esame getEsame() {
		return esame;
	}

	public void setEsame(Esame esame) {
		this.esame = esame;
	}

	public List<IndicatoreRisultato> getListaIndicatori() {
		return listaIndicatori;
	}

	public void setListaIndicatori(List<IndicatoreRisultato> listaIndicatori) {
		this.listaIndicatori = listaIndicatori;
	}
	
	
}
