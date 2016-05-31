package it.uniroma3.persistence;

import java.util.List;

import javax.persistence.EntityTransaction;
import javax.persistence.EntityManager;
import javax.persistence.Query;

public class GenericsDaoJPA<T> implements GenericsDao<T> {
	private EntityManager em;
	private final Class<T> typeParameterClass;
	
	public GenericsDaoJPA(EntityManager em, Class<T> typeParameterClass) {
		this.em = em;
		this.typeParameterClass = typeParameterClass;
	}
	
	public EntityManager getEntityManager() {
		return em;
	}
	
	@Override
	public void save(T element) {
	//	EntityTransaction tx = em.getTransaction();
	//	tx.begin();
		em.persist(element);
	//	tx.commit();
	}

	@Override
	public T findByPrimaryKey(Long id) {
		T element = null;
		element = em.find(typeParameterClass, id);
		return element;
	}

	public List<T> findAll(String nomeEntita) {
		String stringQuery = "select r from " + nomeEntita + " r";
		Query query = em.createQuery(stringQuery);
		List<T> elements = query.getResultList();
		return elements;
	}
	
	@Override
	public List<T> findAll() {
		return findAll(typeParameterClass.getSimpleName());
	}

	@Override
	public void update(T element) {
		em.merge(element);
	}

	@Override
	public void delete(T element) {
		em.remove(element);
	}

}
