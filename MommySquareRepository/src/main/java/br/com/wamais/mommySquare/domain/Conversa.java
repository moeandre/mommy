package br.com.wamais.mommySquare.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the conversa database table.
 * 
 */
@Entity
public class Conversa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date data;

	private String mensagem;

	@Temporal(TemporalType.TIMESTAMP)
	private Date visualizacao;

	//bi-directional many-to-one association to Mommy
	@ManyToOne
	@JoinColumn(name="id_mommy_from")
	private Mommy mommyFrom;

	//bi-directional many-to-one association to Mommy
	@ManyToOne
	@JoinColumn(name="id_momy_to")
	private Mommy mommyTo;

	public Conversa() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return this.data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getMensagem() {
		return this.mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public Date getVisualizacao() {
		return this.visualizacao;
	}

	public void setVisualizacao(Date visualizacao) {
		this.visualizacao = visualizacao;
	}

	public Mommy getMommyFrom() {
		return this.mommyFrom;
	}

	public void setMommyFrom(Mommy mommyFrom) {
		this.mommyFrom = mommyFrom;
	}

	public Mommy getMommyTo() {
		return this.mommyTo;
	}

	public void setMommyTo(Mommy mommyTo) {
		this.mommyTo = mommyTo;
	}

}