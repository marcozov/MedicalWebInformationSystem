package it.uniroma3.model;

import javax.persistence.*;

@Entity
public class Amministratore {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String password;

	public Amministratore(){}
	public Amministratore(String password) {
		this.password = password;
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
	
	public boolean checkPassword(String password) {
		return this.password.equals(password);
	}
}
