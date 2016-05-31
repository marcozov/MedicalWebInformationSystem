package it.uniroma3.model;

import it.uniroma3.persistence.GenericsDao;
import it.uniroma3.persistence.GenericsDaoJPA;

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
	
}
