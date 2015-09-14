<form:form id="form-operacoes" modelAttribute="operacoesForm"
	method="POST" cssClass="validate"
	action="${pageContext.request.contextPath}/operacoes/pesquisar"
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
	        <h4 class="modal-title">Deseja realmente apagar essa operação?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	        <button type="button" id="apagar" class="btn btn-primary">Apagar</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="modal fade" id="modalVisualizar">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">Visualizar Operação</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="txtBox">
				<h4>Detalhes do produto</h4>
				<table class="table table-striped">
					<tbody>
						<tr>
							<th>Protocolo</th>
							<th>Produto</th>
							<th>Valor</th>
						</tr>
						<tr>
							<td id="protocolo"></td>
							<td id="produto"></td>
							<td id="valor"></td>
						</tr>
					</tbody>
				</table>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	      </div>

	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


	<div class="col-md-12 bg-success margin-top-15">
		<div class="row">
			<div class="form-group col-md-7">
				<label for="filtroSegurado" class="control-label margin-top">Filtro</label>
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
            	<button class="btn btn-info margin-top"
            			id="localizar"
						data-action="${pageContext.request.contextPath}/operacoes/ajax/pesquisar"
						data-form="#form-operacoes">
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
							<th>CPF</th>
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
										<c:if test="${operacao.statusCalculador == 6}">
											<button type="button" rel="tooltip" id="pagamento" data-cpf="${operacao.cgc_cpf}" data-calculo="${operacao.numeroCalculo}" data-produto="${operacao.id_produto}" title="Efetuar pagamento" class="btn btn-primary">
												<i class="fa fa-fw fa-dollar"></i>
											</button>
										</c:if>
										<button type="button" rel="tooltip" id="visualizar" data-valor="<fmt:formatNumber value="${operacao.capital_segurado}" minFractionDigits="2" type="currency"/>"  data-calculo="${operacao.numeroCalculo}" data-produto="${operacao.nm_produto}" title="Visualizar" class="btn btn-default">
											<i class="fa fa-fw fa-search"></i>
										</button>
										<button type="button" rel="tooltip" id="apagarModal"  data-calculo="${operacao.numeroCalculo}" title="Apagar" class="btn btn-primary btn-lg">
											<i class="fa fa-fw fa-trash"></i>
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