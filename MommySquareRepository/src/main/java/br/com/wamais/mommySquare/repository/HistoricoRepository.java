package br.com.wamais.mommySquare.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.wamais.mommySquare.domain.HistoricoLocalizacao;

@Repository
public interface HistoricoRepository  extends JpaRepository<HistoricoLocalizacao, Integer>{
	

}
