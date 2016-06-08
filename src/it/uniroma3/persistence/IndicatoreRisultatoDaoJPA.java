package it.uniroma3.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import it.uniroma3.model.IndicatoreRisultato;

public class IndicatoreRisultatoDaoJPA extends GenericsDaoJPA<IndicatoreRisultato> {
	public IndicatoreRisultatoDaoJPA(EntityManager em) {
		super(em, IndicatoreRisultato.class);
	}
	
	public List<IndicatoreRisultato> findAllByTipologiaId(Long tipologiaId) {
		List<IndicatoreRisultato> indicatori = null;
	//	Query q = getEntityManager().createQuery("select e from Esame e where e.medico.id = :medicoId");
		Query q = getEntityManager().createQuery("select i from IndicatoreRisultato i where i.tipologiaEsame.id = :tipologiaId");
		try {
			q.setParameter("tipologiaId", tipologiaId);
			indicatori = q.getResultList();
		} catch (NoResultException e) {}
		
		return indicatori;
		
	}
}
