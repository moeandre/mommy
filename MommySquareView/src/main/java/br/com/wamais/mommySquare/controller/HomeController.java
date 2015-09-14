package br.com.wamais.mommySquare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController extends AbstractController {

	@RequestMapping("/home")
	public String home() {

		return "home";
	}

	@RequestMapping("/403")
	public String error403() {

		return "403";
	}

	@RequestMapping("/404")
	public String error404() {

		return "404";
	}

	@RequestMapping("/erro")
	public String erro() {

		return this.error500();
	}

	@RequestMapping("/500")
	public String error500() {

		return "erro";
	}

	@RequestMapping("/erroLogin")
	public String errorLogin() {

		return "erro";
	}

}