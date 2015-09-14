package br.com.wamais.mommySquare.util;

import java.text.Normalizer;
import java.util.StringTokenizer;

import org.springframework.stereotype.Service;

@Service
public class QueryEndereco {

	public boolean isNumeric(final String str) {

		return str.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+");
	}

	public static String removerAcentos(final String str) {

		return Normalizer.normalize(str, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
	}

	private String removeExtTipoEndereco(final String tipo) {

		if (tipo.equals("RUA")) {
			return "R";
		} else if (tipo.equals("ACESSO")) {
			return "ACS";
		} else if (tipo.equals("ADRO")) {
			return "AD";
		} else if (tipo.equals("AEROPORTO")) {
			return "AER";
		} else if (tipo.equals("ALAMEDA")) {
			return "AL";
		} else if (tipo.equals("ALTO")) {
			return "AT";
		} else if (tipo.equals("ATALHO")) {
			return "ATL";
		} else if (tipo.equals("ATERRO")) {
			return "ATER";
		} else if (tipo.equals("AUTODROMO")) {
			return "ATD";
		} else if (tipo.equals("AVENIDA")) {
			return "AV";
		} else if (tipo.equals("BAIA")) {
			return "BAIA";
		} else if (tipo.equals("BAIRRO")) {
			return "B";
		} else if (tipo.equals("BAIXA")) {
			return "BX";
		} else if (tipo.equals("BALNEARIO")) {
			return "BAL";
		} else if (tipo.equals("BECO")) {
			return "BC";
		} else if (tipo.equals("BELVEDERE")) {
			return "BLV";
		} else if (tipo.equals("BLOCO")) {
			return "BL";
		} else if (tipo.equals("BOSQUE")) {
			return "BQ";
		} else if (tipo.equals("BOULEVARD")) {
			return "BV";
		} else if (tipo.equals("CAIS")) {
			return "C";
		} else if (tipo.equals("CAMINHO")) {
			return "CAM";
		} else if (tipo.equals("CAMPO")) {
			return "CPO";
		} else if (tipo.equals("CANAL")) {
			return "CAN";
		} else if (tipo.equals("CARTODROMO")) {
			return "CTD";
		} else if (tipo.equals("CHACARA")) {
			return "CH";
		} else if (tipo.equals("CHAPADAO")) {
			return "CHP";
		} else if (tipo.equals("CIDADE")) {
			return "CD";
		} else if (tipo.equals("COLONIA")) {
			return "COL";
		} else if (tipo.equals("CONDOMINIO")) {
			return "COND";
		} else if (tipo.equals("CONJUNTO")) {
			return "CJ";
		} else if (tipo.equals("CORREDOR")) {
			return "COR";
		} else if (tipo.equals("CORREGO")) {
			return "CRG";
		} else if (tipo.equals("DESCIDA")) {
			return "DSC";
		} else if (tipo.equals("DESVIO")) {
			return "DSV";
		} else if (tipo.equals("DISTRITO")) {
			return "DT";
		} else if (tipo.equals("EDIFICIO")) {
			return "ED";
		} else if (tipo.equals("ENTREPOSTO")) {
			return "ETP";
		} else if (tipo.equals("ENTRONCAMENTO")) {
			return "ENT";
		} else if (tipo.equals("ESCADARIA")) {
			return "ESD";
		} else if (tipo.equals("ESCADINHA")) {
			return "ESC";
		} else if (tipo.equals("ESPLANADA")) {
			return "ESP";
		} else if (tipo.equals("ESTACAO")) {
			return "ETC";
		} else if (tipo.equals("ESTADIO")) {
			return "ETD";
		} else if (tipo.equals("ESTANCIA")) {
			return "ETN";
		} else if (tipo.equals("ESTRADA")) {
			return "EST";
		} else if (tipo.equals("FAVELA")) {
			return "FAV";
		} else if (tipo.equals("FAZENDA")) {
			return "FAZ";
		} else if (tipo.equals("FEIRA")) {
			return "FRA";
		} else if (tipo.equals("FERROVIA")) {
			return "FER";
		} else if (tipo.equals("FONTE")) {
			return "FNT";
		} else if (tipo.equals("FORTE")) {
			return "FTE";
		} else if (tipo.equals("FREGUESIA")) {
			return "FRG";
		} else if (tipo.equals("GALERIA")) {
			return "GLR";
		} else if (tipo.equals("GRANJA")) {
			return "GR";
		} else if (tipo.equals("HIPODROMO")) {
			return "HPD";
		} else if (tipo.equals("ILHA")) {
			return "IA";
		} else if (tipo.equals("JARDIM")) {
			return "JD";
		} else if (tipo.equals("LADEIRA")) {
			return "LAD";
		} else if (tipo.equals("LAGO")) {
			return "LAG";
		} else if (tipo.equals("LAGOA")) {
			return "LGA";
		} else if (tipo.equals("LARGO")) {
			return "LGO";
		} else if (tipo.equals("LIMITE")) {
			return "LIM";
		} else if (tipo.equals("LINHA DE TRANSMISSAO")) {
			return "LINHA";
		} else if (tipo.equals("LOTEAMENTO")) {
			return "LOT";
		} else if (tipo.equals("MANGUE")) {
			return "MANG";
		} else if (tipo.equals("MARGEM")) {
			return "MGM";
		} else if (tipo.equals("MONTE")) {
			return "MT";
		} else if (tipo.equals("MORRO")) {
			return "MRO";
		} else if (tipo.equals("PARADA")) {
			return "PDA";
		} else if (tipo.equals("PARQUE")) {
			return "PQ";
		} else if (tipo.equals("PASSAGEM")) {
			return "PAS";
		} else if (tipo.equals("PASSEIO")) {
			return "PSO";
		} else if (tipo.equals("PATIO")) {
			return "PTO";
		} else if (tipo.equals("PLANALTO")) {
			return "PL";
		} else if (tipo.equals("PLATAFORMA")) {
			return "PLT";
		} else if (tipo.equals("PONTE")) {
			return "PTE";
		} else if (tipo.equals("PORTO")) {
			return "PRT";
		} else if (tipo.equals("POSTO")) {
			return "POS";
		} else if (tipo.equals("PRACA")) {
			return "PCA";
		} else if (tipo.equals("PRAIA")) {
			return "PR";
		} else if (tipo.equals("PROLONGAMENTO")) {
			return "PRL";
		} else if (tipo.equals("RAMPA")) {
			return "RMP";
		} else if (tipo.equals("REDE ELETRICA")) {
			return "REDE";
		} else if (tipo.equals("RETA")) {
			return "RTA";
		} else if (tipo.equals("RIO")) {
			return "RIO";
		} else if (tipo.equals("RODOVIA")) {
			return "RDV";
		} else if (tipo.equals("RUA")) {
			return "R";
		} else if (tipo.equals("RUELA")) {
			return "RE";
		} else if (tipo.equals("SERRA")) {
			return "SERRA";
		} else if (tipo.equals("SERTAO")) {
			return "SER";
		} else if (tipo.equals("SERVIDAO")) {
			return "SVD";
		} else if (tipo.equals("SETOR")) {
			return "ST";
		} else if (tipo.equals("SITIO")) {
			return "SIT";
		} else if (tipo.equals("SUBIDA")) {
			return "SUB";
		} else if (tipo.equals("SUPERQUADRA")) {
			return "SQD";
		} else if (tipo.equals("TERMINAL")) {
			return "TRM";
		} else if (tipo.equals("TERRENO")) {
			return "TER";
		} else if (tipo.equals("TRANSVERSAL")) {
			return "TSV";
		} else if (tipo.equals("TRAVESSA")) {
			return "TR";
		} else if (tipo.equals("TREVIO")) {
			return "TRV";
		} else if (tipo.equals("VALE")) {
			return "VAL";
		} else if (tipo.equals("VARGEM")) {
			return "VRG";
		} else if (tipo.equals("VARIANTE")) {
			return "VTE";
		} else if (tipo.equals("VELODROMO")) {
			return "VLD";
		} else if (tipo.equals("VIA")) {
			return "VI";
		} else if (tipo.equals("VIADUTO")) {
			return "VD";
		} else if (tipo.equals("VIELA")) {
			return "VEL";
		} else if (tipo.equals("VILA")) {
			return "VL";
		} else {
			return tipo;
		}
	}

	private String verificaTipo(String tipo) {

		String modificado = null;
		tipo = this.removeExtTipoEndereco(tipo);
		if (tipo.equals("R")) {
			modificado = "R";
		}

		return modificado;
	}

	public String prepara(final String endereco) {

		String e = removerAcentos(endereco.trim().toUpperCase());

		e = e.replaceAll("%20", "@");
		e = e.replaceAll("\\.", "");
		e = e.replaceAll("\\-", "");
		e = e.replaceAll("\\,", "");

		if (e.length() == 8) {
			return e;
		}

		final StringBuffer query = new StringBuffer();
		final StringTokenizer token = new StringTokenizer(e, " ");

		int modificado = 0;
		while (token.hasMoreTokens()) {
			String str = token.nextToken().trim();
			String tipoEndereco = null;

			// if (!isNumeric(str) && !"".equals(str)) {
			if (!"".equals(str)) {
				if (modificado == 0) {
					tipoEndereco = this.verificaTipo(str);
				}
				if (tipoEndereco != null) {
					modificado = 1;
					str = tipoEndereco;
				}

				if (modificado == 2) {
					query.append(str + "\"");
					modificado++;
				} else if (modificado == 1) {
					query.append("\"" + str + " ");
					modificado++;
				} else {
					query.append("\"" + str + "\"");
				}
			}
		}

		return query.toString();
	}

}
