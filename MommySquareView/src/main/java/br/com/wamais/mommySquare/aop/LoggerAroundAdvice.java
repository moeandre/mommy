package br.com.wamais.mommySquare.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy()
@Aspect
public class LoggerAroundAdvice {

	private final Logger logger = LoggerFactory.getLogger(LoggerAroundAdvice.class);

	/**
	 * Called between the throw and the catch
	 */
	@AfterThrowing(pointcut = "execution(* br.com.wamais.mommySquare.service..*Service.*(..))", throwing = "e")
	public void myAfterThrowingServices(final JoinPoint joinPoint, final Throwable e) {

		this.printException(joinPoint, e);
	}

	/**
	 * Called between the throw and the catch
	 */
	@AfterThrowing(pointcut = "execution(* br.com.wamais.mommySquare.repository..*Repository.*(..))", throwing = "e")
	public void myAfterThrowingRepositories(final JoinPoint joinPoint, final Throwable e) {

		this.printException(joinPoint, e);
	}

	/**
	 * Called between the throw and the catch
	 */
	@AfterThrowing(pointcut = "execution(* br.com.wamais.mommySquare.controller..*Controller.*(..))", throwing = "e")
	public void myAfterThrowingControllers(final JoinPoint joinPoint, final Throwable e) {

		this.printException(joinPoint, e);
	}

	private void printException(final JoinPoint joinPoint, final Throwable e) {

		final Signature signature = joinPoint.getSignature();
		final String methodName = signature.getName();
		final String stuff = signature.toString();
		final String arguments = Arrays.toString(joinPoint.getArgs());
		this.logger.error("Excecao lancada no metodo: " + methodName + " com os argumentos " + arguments + "\n com a assinatura: " + stuff
				+ "\n e a excecao: " + e.getMessage(), e);
	}

}
