<form:form id="form-detalhe" modelAttribute="cancelarSeguroForm"
	method="POST" cssClass="validate"
	action="${pageContext.request.contextPath}/cancelarSeguro/ajax/efetivar"
	role="form">
	<form:hidden path="cpfCnpj" id="cpfCnpj" />
	<form:hidden path="numeroCalculo" id="numeroCalculo" />
	<form:hidden path="idProduto" id="idProduto" />

	<div class="row">
		<div class="clearfix">&nbsp;</div>
		<div class="col-md-4" id="div1">
	    	<div class="panel panel-default">
	        	<div class="panel-heading">
	            	<div class="titulo">
		            	<div class="circle">1</div>
		                <div>
		                	<h3 class="panel-title">Motivo de Cancelamento</h3>
	                    </div>
					</div>
				</div>
			 	<div class="panel-body">
					<div class="form-group col-md-12">
               			<br/>
               			<label class="radio-inline">
							<input type="radio" name="flagMotivoCancelamento" class="validate[required]" value="0001"> Contestação Pagamento
						</label>
						<br/>
						<label class="radio-inline">
							<input type="radio" name="flagMotivoCancelamento" class="validate[required]" value="0012"> Contestação Web
						</label>
                   	</div>
				</div>
			</div>
		</div>
		<div class="col-md-4 hidden" id="div2">
	    	<div class="panel panel-default">
	        	<div class="panel-heading">
	            	<div class="titulo">
		            	<div class="circle">2</div>
		                <div>
		                	<h3 class="panel-title">Dados da Venda</h3>
	                    </div>
					</div>
				</div>
			 	<div class="panel-body">
            		<table class="table ">
	                    <tbody>
	                    	<tr>
	                        	<td class="col-md-2">Produto:</td>
	                            <td class="text-left">${cancelarSeguroForm.produto.nmProduto}</td>
							</tr>
	                    	<tr>
	                        	<td class="col-md-2">Valor:</td>
	                            <td class="text-left">${cancelarSeguroForm.pagamentoMS.valor}</td>
							</tr>
	                    	<tr>
	                        	<td class="col-md-2">Data Venda:</td>
	                            <td class="text-left">${cancelarSeguroForm.dataVenda}</td>
							</tr>
	                    	<tr>
	                        	<td class="col-md-4">Data Cancelamento:</td>
	                            <td class="text-left">${cancelarSeguroForm.dataCancelamento}</td>
							</tr>
	                    	<tr>
	                        	<td class="col-md-2">Cartão de Crédito:</td>
	                            <td class="text-left">${cancelarSeguroForm.pagamentoMS.bandeiraCartao} **** **** **** ${cancelarSeguroForm.pagamentoMS.finalCartao}</td>
							</tr>
	                    	<tr>
	                        	<td class="col-md-2">Valor a Devolver:</td>
	                            <td class="text-left"><fmt:formatNumber value="${cancelarSeguroForm.valorDevolver}" minFractionDigits="2" type="currency"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-4 hidden" id="div3">
	    	<div class="panel panel-default">
	        	<div class="panel-heading">
	            	<div class="titulo">
		            	<div class="circle">3</div>
		                <div>
		                	<h3 class="panel-title">Dados para Reembolso</h3>
	                    </div>
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group col-md-12">
                  		<table class="table">
	                  		<tbody>
		                    	<tr>
		                        	<td class="text-left col-md-2">Nome:</td>
		                            <td class="text-left">${cancelarSeguroForm.segurado.nomesegurado}</td>
								</tr>
		                    	<tr>
		                        	<td class="text-left col-md-2">CPF:</td>
		                            <td class="text-left">${cancelarSeguroForm.segurado.cgcCpf}</td>
								</tr>
							</tbody>
						</table>
                  		<div class="checkbox">
		 					<label>
								<form:checkbox path="creditoConta" id="creditoConta" /> Reembolso em Conta Corrente
		 					</label>
						</div>
	                   	<div class="hidden" id="dadosBancarios">
		                   	<div class="col-md-6">
			                   	<div class="form-group">
			                       	<label for="codigoBanco" class="control-label ">Código Banco</label>
			                       	<form:input path="cancelarVendaRest.codigoBanco" id="codigoBanco" cssClass="form-control validate[required]"/>
								</div>
							</div>
		                   	<div class="col-md-6">
			                   	<div class="form-group">
			                       	<label for="codigoAgencia" class="control-label ">Número Agência</label>
			                       	<form:input path="cancelarVendaRest.codigoAgencia" id="codigoAgencia" cssClass="form-control validate[required]"/>
								</div>
							</div>
		                   	<div class="col-md-6">
			                   	<div class="form-group">
			                       	<label for="contaCorrente" class="control-label ">Conta Corrente</label>
			                       	<form:input path="cancelarVendaRest.contaCorrente" id="contaCorrente" cssClass="form-control validate[required]"/>
								</div>
							</div>
		                   	<div class="col-md-3">
			                   	<div class="form-group">
			                       	<label for="digitoContaCorrente" class="control-label ">Dígito</label>
			                       	<form:input path="cancelarVendaRest.digitoContaCorrente" id="digitoContaCorrente" cssClass="form-control validate[required]"/>
								</div>
							</div>
						</div>
                   	</div>
				<div class="col-md-12 margin-top:500px;">
				<div class="text-right">
					<button class="btn btn-primary" type="submit" id="efetivar" ><i class="fa fa-check"></i> Efetivar cancelamento</button>
					<a class="btn btn-default" href="#"><i class="fa fa-times"></i> Cancelar</a>
				</div>
			</div>
		</div>
	</div>
</form:form>