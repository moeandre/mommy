package br.com.wamais.mommySquare.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * The persistent class for the mommy database table.
 * 
 */
@Entity
public class Mommy implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String avatar;

	@Temporal(TemporalType.TIMESTAMP)
	private Date cadastro;

	private String email;

	private String login;

	private String nome;

	private String pass;

	//bi-directional many-to-one association to Amizade
	@OneToMany(mappedBy="amiga")
	@JsonIgnore
	private List<Amizade> amigas;

	//bi-directional many-to-one association to Conversa
	@OneToMany(mappedBy="mommyFrom")
	@JsonIgnore
	private List<Conversa> enviadas;

	//bi-directional many-to-one association to Conversa
	@OneToMany(mappedBy="mommyTo")
	@JsonIgnore
	private List<Conversa> recebidas;

	//bi-directional many-to-one association to HistoricoLocalizacao
	@OneToMany(mappedBy="mommy")
	@JsonIgnore
	private List<HistoricoLocalizacao> historicoLocalizacaos;

	//bi-directional many-to-one association to Localizacao
	@OneToMany(mappedBy="mommy")
	@JsonIgnore
	private List<Localizacao> localizacaos;

	public Mommy() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Date getCadastro() {
		return this.cadastro;
	}

	public void setCadastro(Date cadastro) {
		this.cadastro = cadastro;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public List<Amizade> getAmigas() {
		return this.amigas;
	}

	public void setAmigas(List<Amizade> amigas) {
		this.amigas = amigas;
	}

	public Amizade addAmiga(Amizade amiga) {
		getAmigas().add(amiga);
		amiga.setAmiga(this);

		return amiga;
	}

	public Amizade removeAmiga(Amizade amiga) {
		getAmigas().remove(amiga);
		amiga.setAmiga(null);

		return amiga;
	}

	public List<Conversa> getEnviadas() {
		return this.enviadas;
	}

	public void setEnviadas(List<Conversa> enviadas) {
		this.enviadas = enviadas;
	}

	public Conversa addEnviada(Conversa enviada) {
		getEnviadas().add(enviada);
		enviada.setMommyFrom(this);

		return enviada;
	}

	public Conversa removeEnviada(Conversa enviada) {
		getEnviadas().remove(enviada);
		enviada.setMommyFrom(null);

		return enviada;
	}

	public List<Conversa> getRecebidas() {
		return this.recebidas;
	}

	public void setRecebidas(List<Conversa> recebidas) {
		this.recebidas = recebidas;
	}

	public Conversa addRecebida(Conversa recebida) {
		getRecebidas().add(recebida);
		recebida.setMommyTo(this);

		return recebida;
	}

	public Conversa removeRecebida(Conversa recebida) {
		getRecebidas().remove(recebida);
		recebida.setMommyTo(null);

		return recebida;
	}

	public List<HistoricoLocalizacao> getHistoricoLocalizacaos() {
		return this.historicoLocalizacaos;
	}

	public void setHistoricoLocalizacaos(List<HistoricoLocalizacao> historicoLocalizacaos) {
		this.historicoLocalizacaos = historicoLocalizacaos;
	}

	public HistoricoLocalizacao addHistoricoLocalizacao(HistoricoLocalizacao historicoLocalizacao) {
		getHistoricoLocalizacaos().add(historicoLocalizacao);
		historicoLocalizacao.setMommy(this);

		return historicoLocalizacao;
	}

	public HistoricoLocalizacao removeHistoricoLocalizacao(HistoricoLocalizacao historicoLocalizacao) {
		getHistoricoLocalizacaos().remove(historicoLocalizacao);
		historicoLocalizacao.setMommy(null);

		return historicoLocalizacao;
	}

	public List<Localizacao> getLocalizacaos() {
		return this.localizacaos;
	}

	public void setLocalizacaos(List<Localizacao> localizacaos) {
		this.localizacaos = localizacaos;
	}

	public Localizacao addLocalizacao(Localizacao localizacao) {
		getLocalizacaos().add(localizacao);
		localizacao.setMommy(this);

		return localizacao;
	}

	public Localizacao removeLocalizacao(Localizacao localizacao) {
		getLocalizacaos().remove(localizacao);
		localizacao.setMommy(null);

		return localizacao;
	}

}