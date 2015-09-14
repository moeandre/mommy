package br.com.wamais.mommySquare.exception;


public class RepositoryException extends Exception {

	private static final long serialVersionUID = 7594899814145247300L;
	
	private String message;
	
	public RepositoryException(String message){
		super(message);
		this.message = message;
	}
	
	public RepositoryException(Throwable e){
		super(e);
		
	}
	
	public RepositoryException(Throwable e, String message){
		super(message, e);
		this.message = message;
	}

	
	public String getMessage() {
		return message;
	}

	
	public void setMessage(String message) {
		this.message = message;
	}
	

}
