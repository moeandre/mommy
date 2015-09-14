
<form:form id="form-produto" modelAttribute="produtoForm" method="POST"
	cssClass="validate"
	action="${pageContext.request.contextPath}/garantia/ajax/contratar"
	role="form">
	<div class="row">
		<div class="col-md-6">
			Garantia Estendida <small>Dados do produto</small>
			<hr>
			<div class="row bkgGray">
				<div class="form-group col-md-12">
	          		<label class="control-label ">O produto é para uso comercial?</label>
	          		<br/>
	          		<label class="radio-inline">
						<input type="radio" name="produtoComercial" class="validate[required]" value="S"> Sim
					</label>
					<label class="radio-inline">
						<input type="radio" name="produtoComercial" class="validate[required]" value="N"> Não
					</label>
               	</div>
				<div class="form-group col-md-6">
					<label for="text" class="control-label ">Linha</label>
					<form:select path="linha" id="linha" cssClass="form-control validate[required] charge" data-action="${pageContext.request.contextPath}/combos/ajax/50" data-target="tipo">
						<form:option value="">Selecione</form:option>
						<form:options items="${linhas}" />
					</form:select>
				</div>
				<div class="form-group col-md-6">
					<label for="text" class="control-label">Tipo</label>
					<form:select path="tipo" id="tipo" cssClass="form-control validate[required]" data-action="${pageContext.request.contextPath}/combos/ajax/50" data-target="categoria">
						<form:option value="">Selecione o Tipo</form:option>
					</form:select>
				</div>
				<div class="form-group col-md-6">
					<label for="text" class="control-label ">Categoria</label>
					<form:select path="categoria" id="categoria" cssClass="form-control validate[required]" data-action="${pageContext.request.contextPath}/combos/ajax/50" data-target="marca">
						<form:option value="">Selecione a Categoria</form:option>
					</form:select>
				</div>
				<div class="form-group col-md-6">
					<label for="text" class="control-label ">Marca</label>
					<form:select path="marca" id="marca" cssClass="form-control validate[required]" data-action="${pageContext.request.contextPath}/combos/ajax/50" data-target="garantiaFabricante">
						<form:option value="">Selecione a Marca</form:option>
					</form:select>
				</div>

				<div class="form-group col-md-6">
					<label for="garantiaFabricante" class="control-label ">Garantia	do Fabricante</label>
					<form:select path="garantiaFabricante" id="garantiaFabricante" cssClass="form-control validate[required]">
					<form:option value="">Selecione o Garantia do Fabricante</form:option>
					</form:select>
				</div>
				<div class="form-group col-md-6">
					<label for="dataVenda" class="control-label"> Data da venda		do produto </label>
					<form:input id="dataVenda" path="dataVenda" type="text" value="${dataVenda}" class="form-control " readonly="true" />
				</div>
				<div class="form-group col-md-6">
					<label for="text" class="control-label">Valor (R$)</label>
					<form:input path="valorGarantiaSelecionada" id="valorGarantiaSelecionada"
						cssClass="form-control validate[required] money"
						placeholder="R$ 0,00" />
				</div>

				<div class="col-md-4 margin-top-20">
					<button class="btn btn-info" type="button" id="calcular"
						data-action="${pageContext.request.contextPath}/garantia/ajax/calcular"
						data-form="#form-produto" data-target="#dadosCobertura">
						<i class="fa fa-calculator"></i> Calcular
					</button>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<h4>Selecione a Cobertura</h4>
			<hr>
			<div id="dadosCobertura">
			</div>
			<div class="row">
				<div class="col-md-12 margin-top-20">
					<div class="text-right">
						<button class="btn btn-primary" disabled="disabled" type="button"
							id="contratar" data-form="#form-produto">
							<i class="fa fa-check"></i> Contratar
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="codPlan" id="codPlan"/>
	<input type="hidden" name="revPlan" id="revPlan"/>
	<input type="hidden" name="codCobert" id="codCobert"/>
	
	<input type="hidden" name="valorGarantia" id="valorGarantia"/>
	<input type="hidden" name="iniVigencia" id="iniVigencia"/>
	<input type="hidden" name="fimVigencia" id="fimVigencia"/>
</form:form>