package br.com.wamais.mommySquare.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.wamais.mommySquare.domain.Mommy;

@Repository
@Transactional
public interface MommyRepository  extends JpaRepository<Mommy, Integer>{
	

}
