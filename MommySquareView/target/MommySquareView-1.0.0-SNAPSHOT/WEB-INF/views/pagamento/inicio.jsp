<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />
<form:form id="form-pagamento" method="POST" cssClass="validate" modelAttribute="pagamentoForm" action="${pageContext.request.contextPath}/pagamento/ajax/efetivar" role="form">
	<div class="row">
		<div class="clearfix">&nbsp;</div>
	    <div class="col-md-4">
	    	<div class="panel panel-default">
	        	<div class="panel-heading">
	            	<div class="titulo">
	                	<div class="circle">1</div>
	                    <div>
	                    	<h3 class="panel-title">Resumo do seguro</h3>
						</div>
					</div>
				</div>
	            <div class="panel-body">
	            	<table class="table table-striped">
	                	<thead>
	                    	<tr>
	                        	<th>Produto</th>
	                            <th class="text-right">Valor (R$)</th>
							</tr>
						</thead>
	                    <tbody>
	                    	<tr>
	                        	<td>${produtoForm.cobertura.descCobert}</td>
	                            <td class="text-right"><fmt:formatNumber value="${produtoForm.cobertura.premio}" minFractionDigits="2" type="currency"/></td>
							</tr>
						</tbody>
					</table>
	                <table class="table">
	                	<tr class="warning">
	                    	<td>
	                        	<h4>Total <small>em 1x com cartão</small></h4>
							</td>
							<td>
								<h4 class="text-center"><fmt:formatNumber value="${produtoForm.cobertura.premio}" minFractionDigits="2" type="currency"/></h4>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	    <div class="col-md-4">
	    	<div class="panel panel-default">
	        	<div class="panel-heading">
	            	<div class="titulo">
		            	<div class="circle">2</div>
		                <div>
		                	<h3 class="panel-title">Dados de cobrança</h3>
	                    </div>
					</div>
				</div>
	            <div class="panel-body">
	           		<form:hidden path="target" id="target" />
	            	<div class="row">
	                	<div class="col-md-8">
	                    	<div class="form-group">
	                        	<label for="cep" class="control-label ">CEP</label>
	                        	<form:input path="cobranca.cep" id="cepPagamento" cssClass="form-control validate[required]"/>
							</div>
						</div>

						<div class="form-group col-md-4">
							<div class="form-group">
								<label for="text" class="control-label">Número</label>
								<form:input path="cobranca.numero" id="numero" cssClass="form-control validate[required]"/>
							</div>
						</div>
					</div>
					<div class="row">
	                	<div class="col-md-8">
				        	<div class="form-group">
				            	<label for="endereco" class="control-label ">Logradouro</label>
				                <form:input path="cobranca.logradouro" id="logradouro" cssClass="form-control validate[required]"/>
							</div>
						</div>
			        	<div class="form-group col-md-4">
				        	<div class="form-group">
				            	<label for="endereco" class="control-label ">Complemento</label>
				                <form:input path="cobranca.complemento" id="complemento" cssClass="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
	                	<div class="col-md-12">
				        	<div class="form-group">
				            	<label for="endereco" class="control-label ">Bairro</label>
				                <form:input path="cobranca.bairro" id="bairro" cssClass="form-control validate[required]"/>
							</div>
						</div>
					</div>
					<div class="row">
				    	<div class="col-md-8">
				        	<div class="form-group">
				            	<label for="text" class="control-label ">Cidade</label>
				            	<form:input path="cobranca.cidade" id="cidade" cssClass="form-control validate[required]"/>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="estado" class="control-label">Estado</label>
								<form:select path="cobranca.estado" id="estado" cssClass="form-control validate[required]">
									<form:option value=""></form:option>
									<form:option value="SP">SP</form:option>
								</form:select>
							</div>
						</div>
					</div>
				    <div class="row">
				    	<div class="col-md-12">
				        	<div class="form-group">
				            	<label for="email" class="control-label ">Email</label>
				            	<form:input path="cobranca.email" id="email" cssClass="form-control validate[required, custom[email]]"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="titulo">
				    	<div class="circle">3</div>
				        <div>
				        	<h3 class="panel-title">Pagamento</h3>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<h5>Cartão de crédito</h5>

					<input type="hidden" name="target" id="target">

					<input type="hidden" name="cartao.bandeira" id="bandeira">

					<input type="hidden" name="valor" value='<c:out value="${produtoForm.cobertura.premio}"></c:out>'>

				    <div class="btn-group">
				    	<button type="button" class="btn btn-default" ><i class="fa fa-cc-visa fa-2x"></i></button>
				        <button type="button" class="btn btn-default" ><i class="fa fa-cc-mastercard fa-2x"></i></button>
				        <button type="button" class="btn btn-default" ><i class="fa fa-cc-amex fa-2x"></i></button>
					</div>
				    <div class="clearfix margin-top">&nbsp;</div>
				    	<div class="form-group">
				        	<label for="text" class="control-label ">Número do cartão</label>
				            <input type="text" name="cartao.numero"  class="form-control validate[required, funcCall[checkBandeira]]" id="numeroCartao" placeholder="Número do cartão">
						</div>
				        <div class="form-group">
				        	<label for="text" class="control-label ">Nome do titular</lab	el>
				            <input type="text" name="cartao.titular" id="titular" placeholder="Nome do titular" class="form-control validate[required]">
	<%-- 				            <form:input path="cartao.titular" id="titular" cssClass="form-control validate[required]"/> --%>
						</div>
				        <div class="row">
				        	<div class="col-md-6">
				            	<div class="form-group">
				                	<label for="text" class="control-label">Validade</label>
				                	<input type="text" name="cartao.validade" id="nome" class="form-control validate[required] mask-data-validade">
								</div>
							</div>
					</div>
				    <div class="clearfix">&nbsp;</div>
				    <div class="row">
				    	<div class="col-md-12">
				        	<div class="text-right">
				        		<button class="btn btn-primary" type="submit" ><i class="fa fa-thumbs-up"></i> Finalizar</button>
				        		<button class="btn btn-default" type="button" id="cancelarPagamento" data-target="#form-pagamento" ><i class="fa fa-times"></i> Cancelar</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>
<script>

	jQuery(document).ready(function(){
		jQuery('#cepPagamento').keyup(function(e) {
			e.stopPropagation();
			buscarEnderecoPagamento(jQuery(this).val(),"#cepPagamento");

		});

	});

	function checkBandeira (field, rules, i, options){
		var result = jQuery('#numeroCartao').validateCreditCard({ accept: ['visa', 'mastercard', 'elo'] });
		if(!result.valid){
			 return "Número de cartão Inválido";
		}else{
			setBandeira(result.card_type.name);
		}
	}
</script>