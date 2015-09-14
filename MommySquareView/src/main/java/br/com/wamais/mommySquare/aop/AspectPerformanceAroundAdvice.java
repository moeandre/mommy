package br.com.wamais.mommySquare.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy()
@Aspect
public class AspectPerformanceAroundAdvice {

	private final Logger logger = LoggerFactory.getLogger(AspectPerformanceAroundAdvice.class);

	@Around("execution(* br.com.wamais.mommySquare.repository..*Repository.*(..))")
	// QQ Repository neste pacote package
	public Object doBasicProfilingAtDAOS(final ProceedingJoinPoint pjp) throws Throwable {

		return this.performProfilling(pjp);
	}

	@Around("execution(* br.com.wamais.mommySquare.controller..*Controller.*(..))")
	// QQ Controller neste pacote package
	public Object doBasicProfilingAtControllers(final ProceedingJoinPoint pjp) throws Throwable {

		return this.performProfilling(pjp);
	}

	@Around("execution(* br.com.wamais.mommySquare.service..*Service.*(..))")
	// QQ Service neste pacote package
	public Object doBasicProfilingAtServices(final ProceedingJoinPoint pjp) throws Throwable {

		return this.performProfilling(pjp);
	}

	@Around("@annotation(br.com.wamais.mommySquare.util.MeasureExecutionTime)")
	// Quem esta anotado
	public Object doBasicProfilingAtAnnotated(final ProceedingJoinPoint pjp) throws Throwable {

		return this.performProfilling(pjp);
	}

	Object performProfilling(final ProceedingJoinPoint pjp) throws Throwable {

		final long startMs = System.currentTimeMillis();
		final Object retVal = pjp.proceed();
		final long endMs = System.currentTimeMillis();
		final String pontoDeVerificacao = pjp.getTarget().getClass().getName() + "." + pjp.getSignature().getName();
		if (this.logger.isDebugEnabled()) {
			this.logger.info(pontoDeVerificacao + " em " + ((endMs - startMs) / 1) + " ms");
		}
		return retVal;
	}
}
