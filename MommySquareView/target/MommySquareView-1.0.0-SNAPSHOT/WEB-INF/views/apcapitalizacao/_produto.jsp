
<form:form id="form-produto" modelAttribute="produtoForm" method="POST"
	cssClass="validate"
	action="${pageContext.request.contextPath}/apcapitalizacao/ajax/contratar"
	role="form">
	<div class="row">
		<div class="col-md-6">
			<h4>
				AP + Capitalização <small>Dados do segurado</small>
			</h4>
			<hr>
			<div class="row">
				<div class="row bkgGray">	
					<div class="col-md-6">
						<label for="text" class="control-label">Data de nascimento</label>
						<div data-date-format="dd-mm-yyyy" id="dp3" class="date input-group">
							<form:input path="dataNascimento" id="dataNascimento" cssClass="form-control" />
							
							<span class="add-on input-group-addon">
								<i class="fa fa-calendar fa-fw"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<h4>Selecione a Cobertura</h4>
					<hr>
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="col-md-1">&nbsp;</th>
								<th>Tipo</th>
								<th>Prêmio (R$)</th>
								<th class="col-md-2">Valor (R$)</th>
							</tr>
						</thead>
						<tbody id="dadosCobertura">
							<tr>
								<td colspan="3">Informe ao lado os Dados do Produto</td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col-md-12 margin-top-20">
							<div class="text-right">
								<button class="btn btn-primary" disabled="disabled"
									type="button" id="contratar" data-form="#form-produto">
									<i class="fa fa-check"></i> Contratar
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</form:form>