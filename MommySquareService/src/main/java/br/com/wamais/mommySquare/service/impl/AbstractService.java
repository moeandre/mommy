package br.com.wamais.mommySquare.service.impl;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import br.com.wamais.mommySquare.service.ICrudService;

public abstract class AbstractService<E, PK extends Serializable> implements ICrudService<E, PK> {

	private JpaRepository<E, PK> repository;

	public JpaRepository<E, PK> getRepository() {

		return this.repository;
	}

	public void setRepository(final JpaRepository<E, PK> repository) {

		this.repository = repository;
	}

	@Override
	@Transactional
	public void salvar(final E entity) {

		this.getRepository().save(entity);
	}

	@Override
	@Transactional
	public E salvarComRetorno(final E entity) {

		return this.getRepository().save(entity);
	}

	@Override
	@Transactional
	public E alterar(final E entity) {

		return this.getRepository().save(entity);
	}

	@Override
	@Transactional
	public E obtemPorId(final PK primaryKey) {

		return this.getRepository().findOne(primaryKey);
	}

	@Override
	@Transactional
	public void excluirPorId(final PK primaryKey) {

		this.getRepository().delete(primaryKey);
	}

	@Override
	@Transactional
	public Collection<E> pesquisarTodos() {

		return this.getRepository().findAll();
	}

	@Override
	@Transactional
	public Page<E> pesquisarTodos(final Pageable pageable) {

		return this.getRepository().findAll(pageable);
	}

	@Override
	@Transactional
	public Collection<E> listarTodos() {

		return this.getRepository().findAll();
	}

}