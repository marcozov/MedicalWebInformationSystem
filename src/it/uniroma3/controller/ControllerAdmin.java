package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.model.Amministratore;
import it.uniroma3.model.Facade;
import it.uniroma3.model.ProductFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
public class ControllerAdmin {
	//@ManagedProperty(value="#{param.id}")
	private Long id;
	private String password;
	
	private List<Amministratore> amministratori;
	
	@EJB
	private Facade amministratoreFacade;
	
	public String listAmministratori() {
		this.amministratori = amministratoreFacade.getAllAmministratori();
		return "amministratori";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Amministratore> getAmministratori() {
		return amministratori;
	}

	public void setAmministratori(List<Amministratore> amministratori) {
		this.amministratori = amministratori;
	}

	public Facade getAmministratoreFacade() {
		return amministratoreFacade;
	}

	public void setAmministratoreFacade(Facade amministratoreFacade) {
		this.amministratoreFacade = amministratoreFacade;
	}
	
	
	
}
