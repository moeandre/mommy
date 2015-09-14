package br.com.wamais.mommySquare.util;

import br.com.wamais.mommySquare.exception.ServiceException;


public interface ISendEmailService  {
	 
	abstract void send(final String from, final String to, final String assunto, final String body, final String anexo) throws ServiceException;
	 
}
