package br.com.wamais.mommySquare.repository;

import java.util.Collection;

public interface GenericRepository<E, PK> {
	
	void excluiPorPK(PK primaryKey);

	void salva(E entity);

	E procuraPorId(PK id);

	E atualiza(E entity);

	Collection<E> listarTodos();
}
