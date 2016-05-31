package it.uniroma3.persistence;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import it.uniroma3.model.Paziente;

public class PazienteDaoJPA extends GenericsDaoJPA<Paziente> {

	public PazienteDaoJPA(EntityManager em) {
		super(em, Paziente.class);
	}
	
	public Paziente findByEmail(String email) {
		Query q = getEntityManager().createQuery("select p from Paziente p where p.email = ?");
		Paziente paziente;
		try {
			q.setParameter(1, email);
			paziente = (Paziente) q.getSingleResult();
		}
		catch (NoResultException e) {
			paziente = null;
		}
		return paziente;
	}

}
