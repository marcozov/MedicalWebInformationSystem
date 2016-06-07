package it.uniroma3.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import it.uniroma3.model.Esame;

public class EsameDaoJPA extends GenericsDaoJPA<Esame> {

	public EsameDaoJPA(EntityManager em) {
		super(em, Esame.class);
	}
	
	public List<Esame> findAllByMedicoId(Long medicoId) {
		List<Esame> esami = null;
		Query q = getEntityManager().createQuery("select e from Esame e where e.medico.id = :medicoId");
		try {
			q.setParameter("medicoId", medicoId);
			esami = q.getResultList();
		} catch (NoResultException e) {}
		
		return esami;
		
	}

}
