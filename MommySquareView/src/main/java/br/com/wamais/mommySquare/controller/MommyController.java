package br.com.wamais.mommySquare.controller;

import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.wamais.mommySquare.domain.Mommy;
import br.com.wamais.mommySquare.service.IMommyService;

@RestController
@Transactional
@RequestMapping("/mommy")
public class MommyController extends AbstractController {

	@Autowired
	private transient IMommyService service;

	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	@Produces(MediaType.APPLICATION_JSON )
	public @ResponseBody Map<String, Object> listar() {

		final Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("success", Boolean.TRUE);
		retval.put("results", this.service.listarTodos());
		return retval;
	}

	@RequestMapping(value = "/detalhar/{id}", method = RequestMethod.GET)
	@Produces(MediaType.APPLICATION_JSON )
	public @ResponseBody Map<String, Object> detalhar(@PathVariable final Integer id) {

		final Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("success", Boolean.TRUE);
		retval.put("result", this.service.obtemPorId(id));
		return retval;
	}

	@RequestMapping(value = "/editar/{id}", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> editar(final Mommy mommy, @PathVariable final Integer id) {

		mommy.setId(id);
		this.service.alterar(mommy);

		final Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("success", Boolean.TRUE);
		return retval;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deleteShop(@PathVariable final Integer id) {

		this.service.excluirPorId(id);

		final Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("success", Boolean.TRUE);
		return retval;
	}

}
