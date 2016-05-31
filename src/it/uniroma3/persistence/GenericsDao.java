package it.uniroma3.persistence;

import java.util.List;

public interface GenericsDao<T> {
	public void save(T element);
	public T findByPrimaryKey(Long id);
	public List<T> findAll();
	public void update(T element);
	public void delete(T element);
}
