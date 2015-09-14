package br.com.wamais.mommySquare.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.wamais.mommySquare.domain.Mommy;
import br.com.wamais.mommySquare.repository.MommyRepository;
import br.com.wamais.mommySquare.service.IMommyService;

@Service
@Transactional
public class MommyServiceImpl extends AbstractService<Mommy, Integer> implements IMommyService {

	@Autowired
	private MommyRepository repository;

	@Autowired
	public void setMommyRepository(final MommyRepository repository) {

		super.setRepository(repository);
	}

}
