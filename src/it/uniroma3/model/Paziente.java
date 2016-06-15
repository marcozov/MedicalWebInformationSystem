package it.uniroma3.model;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

@Entity
public class Paziente {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private String cognome;
	
	@Column(nullable = false)
	private String password;
	
	@Column(unique=true, nullable=false)
	private String email;
	
	@OneToMany(mappedBy = "paziente", fetch=FetchType.EAGER)
	private List<Esame> esami;
	
	public Paziente(){}
	
	public Paziente(String nome, String cognome, String password, String email) {
		this.nome = nome;
		this.cognome = cognome;
		this.password = password;
		this.email = email;
		this.esami = new LinkedList<>();
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
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
	
	public boolean checkPassword(String password) {
		return this.password.equals(password);
	}
	
}
