package br.com.wamais.mommySquare.service.test;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.wamais.mommySquare.domain.Mommy;
import br.com.wamais.mommySquare.service.IMommyService;

public class MommySeviceTest extends AbstractTest {

	@Autowired
	private IMommyService mommyService;

	@Test
	public void obtemPorIdTest() {

		boolean isOk = true;
		try {

			final Mommy mommy = mommyService.obtemPorId(1);
			isOk = null != mommy;
		} catch (final Exception e) {
			isOk = false;
			e.printStackTrace();
		}
		assertTrue(isOk);

	}

}
