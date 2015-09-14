package br.com.wamais.mommySquare.form;

import br.com.wamais.mommySquare.domain.Mommy;

public class MommyForm implements IForm {

	private static final long serialVersionUID = -7445495464158777042L;

	private Mommy mommy;

	public MommyForm() {

		super();
		// TODO Auto-generated constructor stub
	}

	public Mommy getMommy() {

		return this.mommy;
	}

	public void setMommy(final Mommy mommy) {

		this.mommy = mommy;
	}

}
