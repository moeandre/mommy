package br.com.wamais.mommySquare.controller;

import java.beans.PropertyEditorSupport;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Component
public abstract class AbstractController {

	public static final String FRM_DATE_FMT = "dd/MM/yyyy";

	@InitBinder
	public void initBinder(final WebDataBinder binder) {

		final SimpleDateFormat dateFormat = new SimpleDateFormat(FRM_DATE_FMT);
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(BigDecimal.class, new PropertyEditorSupport() {

			@Override
			public void setAsText(final String text) throws IllegalArgumentException {

				try {
					final BigDecimal value = new BigDecimal(text.replace(".", "").replace(",", "."));
					super.setValue(value);
				} catch (final NumberFormatException nfe) {
					super.setValue(null);
				}
			}

			@Override
			public String getAsText() {

				final BigDecimal value = (BigDecimal) super.getValue();
				if (value != null) {
					return value.toPlainString();
				}
				return null;
			}
		});

	}

	public static Integer roundUp(final long num, final long divisor) {

		return (int) ((num + divisor - 1) / divisor);
	}

}
