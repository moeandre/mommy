package br.com.wamais.mommySquare.annotation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Teste {

	public static void main(final String[] args) {

		System.out.println(validaNovaSenha("!1234asdf"));
	}

	public static boolean validaNovaSenha(final String senha) {

		final Pattern p = Pattern.compile("([A-Za-z][0-9]|[0-9][A-Za-z])");
		final Matcher m = p.matcher(senha);
		final boolean retorno = m.find();
		return retorno;
	}

}
