<form:form id="form-cancelarSeguro" modelAttribute="cancelarSeguroForm"
	method="POST" cssClass="validate"
	action="${pageContext.request.contextPath}/cancelarSeguro/pesquisar"
	role="form">
	<form:hidden path="numeroCalculo" />
	<form:hidden path="pagina" id="pagina"/>
	<form:hidden path="orderBy" id="orderBy"/>
	<form:hidden path="direcao" id="direcao"/>

	<div class="modal fade" id="modalApagar">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">Deseja realmente cancelar essa venda?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	        <button type="button" id="apagar" class="btn btn-primary">Apagar</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="col-md-12 bg-success margin-top-15">
		<div class="row">
			<div class="form-group col-md-7">
				<label for="filtroSegurado" class="control-label margin-top">Segurado</label>
				<form:input path="filtroSegurado" id="filtroSegurado" cssClass="form-control" placeholder="Digite um CPF, CNPJ, Nome ou Certificado" />
			</div>
			<div class="form-group col-md-3">
				<label  for="idProduto" class="control-label margin-top">Produto</label>
				<form:select path="idProduto" id="idProduto" cssClass="form-control">
					<form:option value="">Selecione</form:option>
					<form:options items="${produtos}" itemValue="idProduto" itemLabel="nmProduto" />
				</form:select>
			</div>
            <div class="form-group col-md-2 margin-top-20">
            	<button class="btn btn-info margin-top" type="submit">
					<i class="fa fa-search fa-fw"></i>Localizar
				</button>
			</div>
		</div>
	</div>
	<c:if test="${not empty operacoesSegurado}">
		 <div class="row">
		 	<div class="col-md-12 margin-top-20">
		 		<p>Resultado(s) encontrado(s)</p>
		 		<hr>
		 		<table class="table table-striped">
		 			<thead>
		 				<tr class="ordenacao">
		 					<th>Protocolo</th>
		 					<th>Nome</th>
							<th>CPF/CNPJ</th>
							<th>Produto</th>
							<th class="text-center">Valor (R$)</th>
							<th class="text-center">Ação</th>
						</tr>
					</thead>
                    <tbody>
                    	<c:forEach var="operacao" items="${operacoesSegurado}" varStatus="row">
							<tr class="operacaoTr">
								<td>${operacao.numeroCalculo}</td>
								<td>${operacao.nomeSegurado}</td>
								<td >${operacao.cgc_cpf}</td>
								<td >${operacao.nm_produto}</td>
								<td class="text-center"><fmt:formatNumber value="${operacao.capital_segurado}" minFractionDigits="2" type="currency"/></td>
								<td class="text-right">
									<div class="btn-group btn-group-sm">
										<button type="button" rel="tooltip" id="cancelar" data-idProduto="${operacao.id_produto}" data-cpfCnpj="${operacao.cgc_cpf}" data-numeroCalculo="${operacao.numeroCalculo}" title="Cancelar a Apolice" class="btn btn-danger">
											<i class="fa fa-fw fa-times"></i>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
				</table>
			</div>
		</div>
	</c:if>
</form:form>