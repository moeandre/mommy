
<form:form id="form-produto" modelAttribute="produtoForm" method="POST"
	cssClass="validate"
	action="${pageContext.request.contextPath}/residencial/ajax/contratar"
	role="form">
	<div class="row">
		<div class="col-md-6">
			<h4>
				Residencial + Capitalização <small>Dados do segurado</small>
			</h4>
			<hr>
			<div class="row bkgGray">

				<div class="row" id="buscaCep">
					<div class="form-group col-md-12">
						<label for="text" class="control-label">CEP</label>
						<select name="cep" id="cep" multiple="multiple" class="chosen-select" data-placeholder="Digite o CEP ou endereço">
	           			</select>
					</div>
				</div>

				<div class="row hidden" id="showEndereco">
					<div class="form-group col-md-12">
						<i class="fa fa-map-marker fa-2x fa-fw"></i><span id="enderecoSelecionado"></span>
						<a class="btn btn-sm btn-default" title="Remover o endereço selecionado" href="javascript: void(0)" id="editarEndereco"><i class="fa fa-pencil-square-o fa-fw"></i>Editar endereço</a>
					</div>
					<div class="form-group col-md-6">
						<label for="text" class="control-label sr-only">Complemento</label>
						<form:input path="complemento" id="complemento" cssClass="form-control" placeholder="Complemento" />
					</div>
					<div class="form-group col-md-3">
						<label for="text" class="control-label sr-only">Número</label>
						<form:input path="numero" id="numero" cssClass="form-control" placeholder="Número" />
					</div>
				</div>
			</div>
		</div>


	<div class="col-md-6">
		<h4>Selecione a Cobertura</h4>
		<hr>
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md-1">&nbsp;</th>
					<th>Tipo</th>
					<th>Prêmio</th>
					<th class="col-md-2">Valor (R$)</th>
				</tr>
			</thead>
			 <c:forEach var="cobertura" items="${coberturas}" varStatus="row">
				<tbody id="dadosCobertura">
					<tr>
						<td>
							<div class="radio text-center">
								<label><input type="radio" value="${row.index}" id="cobertura_${row.index}" class="validate[required]" name="idxCobertura"></label>
							</div>
						</td>
						<td>${cobertura.descCobert}</td>
						<td><strong><fmt:formatNumber value="${cobertura.premio}" minFractionDigits="2" type="currency"/></strong></td>
						<td><h4><fmt:formatNumber value="${cobertura.vlis}" minFractionDigits="2" type="currency"/></h4></td>
					</tr>
				</tbody>
			</c:forEach>

		</table>
		 <div class="row">
         	<div class="col-md-12 margin-top-20">
	        	<div class="text-right">
	            	<button class="btn btn-primary" disabled="disabled" type="button" id="contratar" data-form="#form-produto" ><i class="fa fa-check"></i> Contratar</button>
	            </div>
	        </div>
	    </div>
	</div>
	</div>
</form:form>