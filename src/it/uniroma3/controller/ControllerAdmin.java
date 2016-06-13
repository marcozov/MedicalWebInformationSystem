package it.uniroma3.controller;



import it.uniroma3.model.Amministratore;
import it.uniroma3.model.Facade;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean()
@SessionScoped
public class ControllerAdmin implements Serializable {
	
	private static final long serialVersionUID = 1092382198L;
	

	private Long id;
	private String password;
	private boolean loginSucceded = false;
	private boolean loginTried = false;
	
	
	@EJB
	private Facade amministratoreFacade;
	
	public String loginAdmin() {
		loginTried = true;
		Amministratore admin = amministratoreFacade.getAmministratore(id);
		if (admin != null && admin.checkPassword(password)) {
			loginSucceded = true;
			return "/admin/adminPanel";
		}
		loginSucceded = false;
		return "/admin";
	}
	
	
	
	public boolean isLoginSucceded() {
		return loginSucceded;
	}



	public void setLoginSucceded(boolean loginSucceded) {
		this.loginSucceded = loginSucceded;
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


	public Facade getAmministratoreFacade() {
		return amministratoreFacade;
	}

	public void setAmministratoreFacade(Facade amministratoreFacade) {
		this.amministratoreFacade = amministratoreFacade;
	}



	public boolean isLoginTried() {
		return loginTried;
	}



	public void setLoginTried(boolean loginTried) {
		this.loginTried = loginTried;
	}
	
	
	
}
