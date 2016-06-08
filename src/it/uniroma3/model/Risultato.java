package it.uniroma3.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

@Entity
//@NamedQuery(name = "findAllRisultato", query = "select r from risultato r")
public class Risultato {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private Long valore;
//	private int valore;
	
	@ManyToOne
	@JoinColumn(name = "indicatore_id")
	private IndicatoreRisultato indicatoreRisultato;

	public Risultato(){}
	public Risultato(Long valore, IndicatoreRisultato indicatoreRisultato) {
		this.valore = valore;
		this.indicatoreRisultato = indicatoreRisultato;
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
	
}
