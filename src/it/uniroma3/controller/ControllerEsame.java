package it.uniroma3.controller;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
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
	
	
	// cose del Risultato
	
	private boolean nuovoRisultatoSucceded = false;
	
	@ManagedProperty(value="#{param.valore}")
	private Integer valore;
	
	@ManagedProperty(value="#{param.idindicatore}")
	private Long idindicatore;
	
	@EJB Facade facade;
	
	
	public String aggiungiRisultato() throws Throwable {
		IndicatoreRisultato indicatoreRisultato = facade.getIndicatore(idindicatore);
		if (indicatoreRisultato == null) throw new Throwable();
		Risultato risultato = new Risultato(getValore(), indicatoreRisultato);
		
		esame.getRisultati().add(risultato);
		facade.updateEsame(esame);
		this.esame = facade.getEsame(new Long(952));
		esame = null;
		if (esame == null) throw new Throwable();
		return "esameInserisciRisultato";
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
		return "esameInserisciRisultato";
	}
	
	@PostConstruct
	public void elencoEsami() {
		this.esami = facade.getAllEsami();
	}
	
	
	
	public boolean isNuovoRisultatoSucceded() {
		return nuovoRisultatoSucceded;
	}



	public void setNuovoRisultatoSucceded(boolean nuovoRisultatoSucceded) {
		this.nuovoRisultatoSucceded = nuovoRisultatoSucceded;
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

	public List<Esame> getEsami() {
		return esami;
	}

	public void setEsami(List<Esame> esami) {
		this.esami = esami;
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
	
	
	
	
}
