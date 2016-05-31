package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.model.Amministratore;
import it.uniroma3.model.Esame;
import it.uniroma3.model.Facade;
import it.uniroma3.model.Paziente;
import it.uniroma3.model.ProductFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.persistence.Column;
import javax.persistence.OneToMany;

@ManagedBean
public class ControllerPaziente {
	private String nome;
	private String cognome;
	private String password;
	private String email;
	private List<Esame> esami;
	private List<Paziente> pazienti;
	private boolean success = false;
	
	@EJB
	private Facade pazienteFacade;
	
	
	public String aggiungiPaziente() {
		success = false;
		pazienteFacade.aggiungiPaziente(nome, cognome, email, password);
		//se tutto va bene...
		success = true;
		return "nuovoPaziente";
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Esame> getEsami() {
		return esami;
	}

	public void setEsami(List<Esame> esami) {
		this.esami = esami;
	}

	public List<Paziente> getPazienti() {
		return pazienti;
	}

	public void setPazienti(List<Paziente> pazienti) {
		this.pazienti = pazienti;
	}

	public Facade getPazienteFacade() {
		return pazienteFacade;
	}

	public void setPazienteFacade(Facade pazienteFacade) {
		this.pazienteFacade = pazienteFacade;
	}


	public boolean isSuccess() {
		return success;
	}


	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	
	
}
