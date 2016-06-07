package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.model.Amministratore;
import it.uniroma3.model.Esame;
import it.uniroma3.model.Facade;
import it.uniroma3.model.Paziente;
import it.uniroma3.model.ProductFacade;

import javax.annotation.PostConstruct;
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
	private List<Paziente> pazienti;
	private Paziente paziente;
	private boolean nuovoPazienteSucceded = false;
	private boolean loginPazienteSucceded = true;
	
	@EJB
	private Facade pazienteFacade;
	
	@PostConstruct
	public void elencoPazienti() {
		this.pazienti = this.pazienteFacade.getAllPazienti();
	}
	
	public String aggiungiPaziente() {
		nuovoPazienteSucceded = false;
		pazienteFacade.aggiungiPaziente(nome, cognome, email, password);
		//se tutto va bene...
		nuovoPazienteSucceded = true;
		return "nuovoPaziente";
	}
	
	public String loginPaziente() {
		loginPazienteSucceded = false;
		Paziente p = pazienteFacade.getPaziente(email);
		if (p != null && p.checkPassword(password)) {
			loginPazienteSucceded = true;
			paziente = p;
		}
		return "index";
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

	
	

	public Paziente getPaziente() {
		return paziente;
	}

	public void setPaziente(Paziente paziente) {
		this.paziente = paziente;
	}

	public boolean isLoginPazienteSucceded() {
		return loginPazienteSucceded;
	}

	public void setLoginPazienteSucceded(boolean loginPazienteSucceded) {
		this.loginPazienteSucceded = loginPazienteSucceded;
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

	public boolean isNuovoPazienteSucceded() {
		return nuovoPazienteSucceded;
	}

	public void setNuovoPazienteSucceded(boolean nuovoPazienteSucceded) {
		this.nuovoPazienteSucceded = nuovoPazienteSucceded;
	}


	
	
	
	
}
