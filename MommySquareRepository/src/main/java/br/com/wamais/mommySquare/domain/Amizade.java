package br.com.wamais.mommySquare.domain;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the amizade database table.
 * 
 */
@Entity
public class Amizade implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date data;

	//bi-directional many-to-one association to Mommy
	@ManyToOne
	@JoinColumn(name="id_amiga")
	private Mommy amiga;

	//uni-directional many-to-one association to Mommy
	@ManyToOne
	@JoinColumn(name="id_mommy")
	private Mommy mommy;

	public Amizade() {
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

	public Mommy getAmiga() {
		return this.amiga;
	}

	public void setAmiga(Mommy amiga) {
		this.amiga = amiga;
	}

	public Mommy getMommy() {
		return this.mommy;
	}

	public void setMommy(Mommy mommy) {
		this.mommy = mommy;
	}

}