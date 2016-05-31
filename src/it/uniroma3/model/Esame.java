package it.uniroma3.model;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
//@NamedQuery(name = "findAllEsame", query = "select e from esame e")
public class Esame {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataPrenotazione;
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dataEsame;
	
	@ManyToOne
	@JoinColumn(name = "paziente_id")
	private Paziente paziente;
	
	@ManyToOne
	@JoinColumn(name = "tipologia_id")
	private TipologiaEsame tipologiaEsame;
	
	@ManyToOne
	@JoinColumn(name = "medico_id")
	private Medico medico;
	
	@OneToMany
	@JoinColumn(name = "esame_id")		// assenza di doppia navigabilita': come per le associazioni
										// fra TipologiaEsame e Prerequisito e TipologiaEsame e IndicatoreRisultato
	private List<Risultato> risultati;

	public Esame(Date dataPrenotazione, Date dataEsame, Paziente paziente, TipologiaEsame tipologiaEsame,
			Medico medico) {
		this.dataPrenotazione = dataPrenotazione;
		this.dataEsame = dataEsame;
		this.paziente = paziente;
		this.tipologiaEsame = tipologiaEsame;
		this.medico = medico;
		this.risultati = new LinkedList<>();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataPrenotazione() {
		return dataPrenotazione;
	}

	public void setDataPrenotazione(Date dataPrenotazione) {
		this.dataPrenotazione = dataPrenotazione;
	}

	public Date getDataEsame() {
		return dataEsame;
	}

	public void setDataEsame(Date dataEsame) {
		this.dataEsame = dataEsame;
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
	
}