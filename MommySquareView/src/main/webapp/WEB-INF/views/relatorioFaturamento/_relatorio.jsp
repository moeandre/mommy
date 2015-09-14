<form:form id="form-relatorioFaturamento" modelAttribute="relatorioFaturamentoForm"
	method="POST" cssClass="validate"
	action="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar"
	role="form">

	<form:hidden path="pagina" id="pagina"/>
	<form:hidden path="orderBy" id="orderBy"/>
	<form:hidden path="direcao" id="direcao"/>
						
	<div class="col-md-12 bg-success margin-top-15">
		<div class="row">	
			<div class="form-group col-md-7">
				<label for="filtroSegurado" class="control-label margin-top">Filtro</label>
				<form:input path="filtroSegurado" id="filtroSegurado" cssClass="form-control" placeholder="Digite um CPF, CNPJ, Nome ou Certificado" />
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-3">
				<label for="text" class="control-label margin-top">Data Inicial</label>
				<div data-date-format="dd-mm-yyyy" class="date input-group">
					<form:input path="dataInicio" id="dataInicio" cssClass="validate[custom[dateBR]] form-control datetime mask-data" maxlength="10" placeholder="__/__/__" />
					
					<span class="add-on input-group-addon">
						<i class="fa fa-calendar fa-fw" ></i>
					</span>
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="text" class="control-label margin-top">Data Final</label>
				<div data-date-format="dd-mm-yyyy" class="date input-group">
					<form:input path="dataFim" id="dataFim" cssClass="validate[condRequired[dataInicio],custom[dateBR],future[dataInicio]] form-control datetime" maxlength="10" placeholder="__/__/__" />
					
					<span class="add-on input-group-addon">
						<i class="fa fa-calendar fa-fw"></i>
					</span>
				</div>
			</div>
			<div class="form-group col-md-3">
				<label  for="idProduto" class="control-label margin-top">Produto</label>
				<form:select path="idProduto" id="idProduto" cssClass="form-control">
					<form:option value="">Selecione</form:option>
					<form:options items="${produtos}" itemValue="idProduto" itemLabel="nmProduto" />
				</form:select>
			</div>
            <div class="form-group col-md-2 margin-top-20">
            	<button class="btn btn-info margin-top" id="localizar">
						<i class="fa fa-search fa-fw"></i>Localizar
				</button>

			</div>
		</div>
	</div>
	<c:if test="${not empty relatorioFaturamento}">
		 <div class="row">
		 	<div class="col-md-12 margin-top-20">
		 		<p>Resultado(s) encontrado(s)</p>
		 		<hr>
		 		<table class="table table-striped">
		 			<thead>
		 				<tr class="ordenacao">
		 					<th data-order="protocolo">
		 						Protocolo
	 						</th>
		 					<th data-order="segurado">
		 						Segurado
	 						</th>
		 					<th data-order="produto">
		 						Produto
							</th>
		 					<th data-order="capital-segurado">
		 						Capital Segurado
	 						</th>
		 					<th data-order="data-envio">
		 						Data Envio
	 						</th>
						</tr>
					</thead>
                    <tbody>
                    	<c:forEach var="relatorio" items="${relatorioFaturamento}" varStatus="row">
							<tr class="operacaoTr">
								<td>${relatorio.numeroCalculo}</td>
								<td>${relatorio.nomeSegurado}</td>
								<td>${relatorio.nm_produto}</td>
								<td>
									<fmt:formatNumber value="${relatorio.capital_segurado}" type="currency" currencySymbol=""/>
								</td>
								<td>${relatorio.dataEnvio}</td>
							</tr>
						</c:forEach>
                    </tbody>
				</table>
			</div>
		</div>
		<c:if test="${paginas > 1}">
			<div class="row">
				<div class="col-md-12">
					<ul class="pagination pagination-sm pull-right">
						<c:if test="${pagina > 1}">
							<c:if test="${(pagina - 2) > 1}">
								<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/1" data-pagina="1">&lt;&lt;</a></li>
							</c:if>
				  			<c:if test="${(pagina - 1) != 1}">
								<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/${pagina-2}" data-pagina="${pagina-2}">${pagina-2}</a></li>
							</c:if>
				  			<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/${pagina-1}" data-pagina="${pagina-1}">${pagina-1}</a></li>
				  		</c:if>
				  		<li class="active"><span>${pagina}</span></li>
						<c:if test="${pagina < paginas}">
							<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/${pagina+1}" data-pagina="${pagina+1}">${pagina+1}</a></li>
							<c:if test="${(pagina + 1) != paginas}">
								<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/${pagina+2}" data-pagina="${pagina+2}">${pagina+2}</a></li>
							</c:if>
							<c:if test="${(pagina + 2) < paginas}">
								<li><a href="${pageContext.request.contextPath}/relatorioFaturamento/pesquisar/pagina/${paginas}" data-pagina="${paginas}">&gt;&gt;</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
	</c:if>
</form:form>