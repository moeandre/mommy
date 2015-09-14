package br.com.wamais.mommySquare.repository.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-repository.xml"})
@Transactional
@TransactionConfiguration(defaultRollback=true, transactionManager="transactionManager")
public abstract class AbstractTest {

}
