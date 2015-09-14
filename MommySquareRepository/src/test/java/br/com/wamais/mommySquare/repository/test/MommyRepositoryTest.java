package br.com.wamais.mommySquare.repository.test;


import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.wamais.mommySquare.domain.Mommy;
import br.com.wamais.mommySquare.repository.MommyRepository;


public class MommyRepositoryTest extends AbstractTest {
		
	@Autowired
	private MommyRepository mommyRepository;
		
	@Test
	public void findByIdTest(){
		boolean isOk = true;
		try {
			Mommy mommy = mommyRepository.findOne(1);
			isOk = mommy!=null;
		} catch (Exception e) {
			isOk = false;
			e.printStackTrace();
		}
		assertTrue(isOk);
		
	}

}
