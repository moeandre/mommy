package br.com.wamais.mommySquare.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the historico_localizacao database table.
 * 
 */
@Entity
@Table(name="historico_localizacao")
public class HistoricoLocalizacao implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date data;

	private double lat;

	private double lon;

	private String publico;

	//bi-directional many-to-one association to Mommy
	@ManyToOne
	@JoinColumn(name="id_mommy")
	private Mommy mommy;

	public HistoricoLocalizacao() {
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

	public double getLat() {
		return this.lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return this.lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getPublico() {
		return this.publico;
	}

	public void setPublico(String publico) {
		this.publico = publico;
	}

	public Mommy getMommy() {
		return this.mommy;
	}

	public void setMommy(Mommy mommy) {
		this.mommy = mommy;
	}

}