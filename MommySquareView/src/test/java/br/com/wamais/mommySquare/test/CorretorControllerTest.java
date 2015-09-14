package br.com.wamais.mommySquare.test;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

public class CorretorControllerTest extends AbstractTest {

	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;

	@Before
	public void setup() {

		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}

	@Test
	public void findCorretorByNomeTest() throws Exception {

		this.mockMvc.perform(get("/corretor/nomeCorretor/HONDA")).andExpect(status().isOk())
				.andExpect(content().contentType("application/json;charset=UTF-8")).andExpect(jsonPath("$.nomeCorretor", is("HONDA")))
				.andExpect(jsonPath("$.codigoCorretor", is(40)));
	}

	@Test
	public void findCorretorByNomePostTest() throws Exception {

		this.mockMvc.perform(post("/corretor/pesquisa").param("nomeCorretor", "MARECHAL CORRET. DE SEGS. S/C LTDA")).andExpect(status().isOk());

	}

}
