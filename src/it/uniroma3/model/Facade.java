package it.uniroma3.model;

import it.uniroma3.persistence.EsameDaoJPA;
import it.uniroma3.persistence.GenericsDao;
import it.uniroma3.persistence.GenericsDaoJPA;
import it.uniroma3.persistence.IndicatoreRisultatoDaoJPA;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import it.uniroma3.model.Amministratore;
import it.uniroma3.model.Medico;
import it.uniroma3.model.Paziente;
import it.uniroma3.persistence.PazienteDaoJPA;

@Stateless
public class Facade {

	@PersistenceContext(unitName = "clinica-unit")
    private EntityManager em;
	
	public List<Amministratore> getAllAmministratori() {
		/*TypedQuery<Amministratore> tq = em.createQuery("", Amministratore.class);
		List<Amministratore> amministratori = tq.getResultList();
		return amministratori; */
		GenericsDaoJPA amministratoreDaoJPA = new GenericsDaoJPA(em, Amministratore.class);
		
		return amministratoreDaoJPA.findAll();
	}

	public Paziente getPaziente(String email) {		
		PazienteDaoJPA pazienteDao = new PazienteDaoJPA(em);
		Paziente paziente = pazienteDao.findByEmail(email);
		return paziente;
	}
	
	public Paziente getPaziente(Long id) {		
		PazienteDaoJPA pazienteDao = new PazienteDaoJPA(em);
		Paziente paziente = pazienteDao.findByPrimaryKey(id);
		return paziente;
	}
	
	public Esame getEsame(Long id) {
		GenericsDao<Esame> esameDao = new GenericsDaoJPA<Esame>(em, Esame.class);
		return esameDao.findByPrimaryKey(id);
	}
	
	public Amministratore getAmministratore(Long id) {
		GenericsDaoJPA<Amministratore> amministratoreDao = new GenericsDaoJPA<Amministratore>(em, Amministratore.class);
		Amministratore amministratore = amministratoreDao.findByPrimaryKey(id);
		return amministratore;
	}
	
	public void aggiungiPaziente(String nome, String cognome, String email, String password) {
		GenericsDaoJPA<Paziente> pazienteDao = new GenericsDaoJPA<>(em, Paziente.class);
		Paziente paziente = new Paziente(nome, cognome, password, email);
		pazienteDao.save(paziente);
	}

	public List<Medico> getAllMedici() {
		GenericsDaoJPA<Medico> medicoDao = new GenericsDaoJPA<>(em, Medico.class);
		List<Medico> medici = medicoDao.findAll();
		return medici;
	}
	
	public List<Esame> getAllEsami() {
		GenericsDaoJPA<Esame> esameDao = new GenericsDaoJPA<>(em, Esame.class);
		List<Esame> esami = esameDao.findAll();
		return esami;
	}
	
	public List<Paziente> getAllPazienti() {
		GenericsDao<Paziente> pazienteDao = new GenericsDaoJPA<>(em, Paziente.class);
		List<Paziente> pazienti = pazienteDao.findAll();
		return pazienti;
	}
	
	public void inserisciTipologia(String codice, String nome, String descrizione, double costo, List<Prerequisito> prerequisiti, List<IndicatoreRisultato> indicatori) {
		TipologiaEsame tipologia = new TipologiaEsame(codice, nome, descrizione, costo);
		tipologia.setPrerequisiti(prerequisiti);
		tipologia.setIndicatoriRisultato(indicatori);
		GenericsDao<TipologiaEsame> tipologiaDao = new GenericsDaoJPA<>(em, TipologiaEsame.class);
		tipologiaDao.save(tipologia);
	}
	
	public List<TipologiaEsame> getAllTipologieEsame() {
		GenericsDao<TipologiaEsame> tipologiaDao = new GenericsDaoJPA<>(em, TipologiaEsame.class);
		return tipologiaDao.findAll();
	}
	
	public TipologiaEsame getTipologiaEsame(Long id) {
		GenericsDaoJPA<TipologiaEsame> tipologiaDao = new GenericsDaoJPA<>(em, TipologiaEsame.class);
		return tipologiaDao.findByPrimaryKey(id);
	}
	
	public void inserisciEsame(Date dataPrenotazione, Date dataEsame, Paziente paziente, TipologiaEsame tipologiaEsame, Medico medico) {
		GenericsDaoJPA<Esame> esameDao = new GenericsDaoJPA<>(em, Esame.class);
		Esame esame = new Esame(dataPrenotazione, dataEsame, paziente, tipologiaEsame, medico);
		esameDao.save(esame);
	}
	
	public Medico getMedico(Long id) {
		GenericsDao<Medico> medicoDao = new GenericsDaoJPA<>(em, Medico.class);
		return medicoDao.findByPrimaryKey(id);
	}

	public List<Esame> getEsamiPerMedico(Long idmedico) {
		EsameDaoJPA esameDao = new EsameDaoJPA(em);
		return esameDao.findAllByMedicoId(idmedico);
	}
	
	public List<IndicatoreRisultato> getIndicatoriPerTipologia(long idtipologia) {
		IndicatoreRisultatoDaoJPA indicatoreDao = new IndicatoreRisultatoDaoJPA(em);
		return indicatoreDao.findAllByTipologiaId(idtipologia);
	}
	
	public void aggiungiRisultato(Risultato risultato) {
		GenericsDao<Risultato> indicatoreDao = new GenericsDaoJPA<Risultato>(em, Risultato.class);
		indicatoreDao.save(risultato);
	}
	
	public IndicatoreRisultato getIndicatoreRisultato(Long id) {
		GenericsDao<IndicatoreRisultato> indicatoreDao = new GenericsDaoJPA<IndicatoreRisultato>(em, IndicatoreRisultato.class);
		return indicatoreDao.findByPrimaryKey(id);
	}
}
