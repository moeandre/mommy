package br.com.wamais.mommySquare.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import br.com.wamais.mommySquare.exception.ServiceException;

@Service
public class SendMailServiceImpl implements ISendEmailService {
	
	final static Logger logger = Logger.getLogger(SendMailServiceImpl.class);
	
	@Autowired
    private JavaMailSender mailSender;
	
    @Autowired
    private VelocityEngine velocityEngine;
    
    @Async
    public void send(final String from, final String to, final String assunto, final String body, final String anexo) throws ServiceException {
    	sendIt(from, to, assunto, body, anexo);
    }
    
    private void sendIt(final String from, final String to, final String assunto, final String body, final String anexo) throws ServiceException {

    	logger.debug("from: "+ from);
    	logger.debug("to: "+ to);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			message.setSubject(assunto, "UTF-8");
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSentDate(new Date());
			helper.setText(body, true);
			if (anexo != null) {
				Base64 base64 = new Base64();
				final byte[] attachBytes = base64.decode(anexo);
	
				InputStreamSource byteArraySource = new InputStreamSource() {
					public InputStream getInputStream() {
						return new ByteArrayInputStream(attachBytes);
					}
				};
				helper.addAttachment("calculo.pdf",  byteArraySource);
			}
			mailSender.send(message);
		}
		catch (Exception e) {
			logger.error("Problemas ao enviar email " + e.getMessage());
			throw new ServiceException(e, "Problemas ao enviar email");
		}	    	
    }


}
