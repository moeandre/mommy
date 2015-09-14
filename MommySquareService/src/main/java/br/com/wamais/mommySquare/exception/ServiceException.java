package br.com.wamais.mommySquare.exception;

public class ServiceException extends Exception {

	private static final long serialVersionUID = 7594899814145247300L;

	private String message;

	public ServiceException(final String message) {

		super(message);
		this.message = message;
	}

	public ServiceException(final Throwable e) {

		super(e);

	}

	public ServiceException(final Throwable e, final String message) {

		super(message, e);
		this.message = message;
	}

	@Override
	public String getMessage() {

		return this.message;
	}

	public void setMessage(final String message) {

		this.message = message;
	}

}
