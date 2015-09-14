package br.com.wamais.mommySquare.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.swing.text.MaskFormatter;

import org.joda.time.DateTime;
import org.joda.time.Years;

public class Util {

	/**
	 * <p>
	 * Formata data no formato yyyy-MM-dd
	 *
	 * @param data
	 * @return String
	 */
	public static String formataDataYYYYMMDD(final Date data) {

		return new SimpleDateFormat("yyyy-MM-dd").format(data);
	}

	/**
	 * <p>
	 * Formata data no formato dd/MM/yyy
	 *
	 * @param data
	 * @return String
	 */
	public static String formataDataDDMMYYYY(final Date data) {

		return new SimpleDateFormat("dd/MM/yyyy").format(data);
	}

	/**
	 * <p>
	 * Remove todos caracters nao numericos
	 *
	 * @param data
	 * @return String
	 */
	public static String somenteNumeros(final String ocorrencia) {

		return ocorrencia.replaceAll("[^0-9]+", "");
	}

	public static String montaDataFuturaString(final DateTime dt, final Integer anos) {

		return formataDataYYYYMMDD(dt.plusYears(anos).toDate());
	}

	public static String montaDataPassadaString(final DateTime dt, final Integer dias) {

		return formataDataYYYYMMDD(dt.plusDays(dias).toDate());
	}

	public static String montaIdade(final Date dataNascimento) {

		return String.valueOf(Years.yearsBetween(new DateTime(dataNascimento), new DateTime()).getYears());
	}

	public static String montaDataFuturaDDMMYYYY(final DateTime dt, final Integer anos) {

		return formataDataDDMMYYYY(dt.plusYears(anos).toDate());
	}

	public static Date montaDataFutura(final DateTime dt, final Integer anos) {

		return dt.plusYears(anos).toDate();
	}
	
	public static Date montaDataFuturaEmMeses(final DateTime dt, final Integer months) {

		return dt.plusMonths(months).toDate();
	}

	public static String montaAtualDDMMYYYY() {

		return formataDataDDMMYYYY(Calendar.getInstance().getTime());
	}

	public static String montaNumeroFinalCartao(final String numeroCartao) {

		return numeroCartao.substring(numeroCartao.length() - 4);
	}

	public static String formatValor(final double valor) {

		final DecimalFormat formatoDois = new DecimalFormat("##,###,###,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
		formatoDois.setMinimumFractionDigits(2);
		formatoDois.setParseBigDecimal(true);
		return (formatoDois.format(valor));
	}

	public static String formatPattern(final String pattern, final String value) {

		MaskFormatter mask;
		try {
			mask = new MaskFormatter(pattern);
			mask.setValueContainsLiteralCharacters(false);
			return mask.valueToString(value);
		} catch (final ParseException e) {
			throw new RuntimeException(e);
		}
	}
	
	

}
