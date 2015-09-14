<div class="row">
	<div class="col-md-6">
		<h4>Já possui cadastro?</h4>
	    <hr>
	    <form:form method="POST" cssClass="validate" modelAttribute="seguradoForm" action="${pageContext.request.contextPath}/segurado/ajax/listar/1" role="form" id="buscarSegurado">
	    	<form:hidden path="target" id="target" />
		    <div class="col-md-12 bg-success">
				<div class="clearfix">&nbsp;</div>
		        <div class="form-group col-md-9">
		        	<label for="text" class="control-label">Segurado</label>
		        	<form:input id="searchTerm" path="searchTerm"  cssClass="validate[required] form-control" placeholder="Digite o nome ou CPF do segurado" />
				</div>
		        <div class="col-md-3 margin-top-20">
		        	<button class="btn btn-info" type="submit" data-target="#tableSegurado" ><i class="fa fa-search"></i> Localizar</button>
				</div>
			</div>
		</form:form>
	    <div class="clearfix">&nbsp;</div>
	    <div class="col-md-12 margin-top-20">
	        <table class="table table-striped">
	        	<thead>
	        		<tr>
	                	<th>Segurado</th>
	                    <th>CPF/CNPJ</th>
					</tr>
				</thead>
	            <tbody id="tableSegurado">
					<tr><td colspan="2">Informe os dados acima ou preencha o formulário ao lado.</td></tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-12" id="paginacaoSegurado" style="display: none;">
		</div>
	</div>
	<div class="col-md-6">
    	<h4>Cadastrar segurado</h4>
        <hr>
        <form:form method="POST" cssClass="validate" modelAttribute="seguradoForm" action="${pageContext.request.contextPath}/segurado/ajax/cadastrar" role="form" id="manterSegurado">
        	<form:hidden path="target" id="target" />

        	<div class="alert alert-warning alert-dismissable" style="display: none" id="alertaCadastro">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				 Existem campos obrigatórios não preenchidos. Para prosseguir, conclua o cadastro.
			</div>

			<div class="row">
	        	<div class="col-md-5">
	        		<div class="form-group">
						<label class="control-label">Tipo</label>
						<br/>
						<label class="radio-inline">
							<input type="radio" name="segurado.tipopessoa" id="tipoPessoaF" value="F"> Física
						</label>
						<label class="radio-inline">
							<input type="radio" name="segurado.tipopessoa" id="tipoPessoaJ" value="J"> Jurídica
						</label>
					</div>
				</div>
			</div>


	        <div class="row">
	        	<div class="col-md-12">
	            	<div class="form-group">
	                	<label for="nomesegurado" class="control-label">Nome do segurado</label>
	                	<form:input path="segurado.nomesegurado" id="nomesegurado" cssClass="form-control validate[required, minSize[10]]"/>
					</div>
				</div>
			</div>

			<div class="row">
	            <div class="col-md-6">
	            	<div class="form-group">
						<label for="text" class="control-label" id="labelDocumento"> CPF</label>
	                    <form:input path="segurado.cgcCpf" id="cgcCpf" cssClass="form-control validate[required, custom[cpfCnpj]]"/>
					</div>
				</div>
			    <div class="col-md-6" id="divSexo">
	            	<div class="form-group">
	                	<label for="sexo" class="control-label ">Sexo</label>
	                	<form:select path="segurado.sexo" id="sexo" cssClass="form-control validate[required]">
							<form:option value="">Selecione</form:option>
							<form:option value="M">Masculino</form:option>
							<form:option value="F">Feminino</form:option>
						</form:select>
					</div>
				</div>
			</div>
			<div class="row">
			    <div class="col-md-6" id="divEstadoCivil">
	            	<div class="form-group">
	                	<label for="sexo" class="control-label ">Estado Civil</label>
	                	<form:select path="segurado.estadoCivil" id="estadoCivil" cssClass="form-control validate[required]">
							<form:option value="">Selecione</form:option>
							<form:option value="S">Solteiro(a)</form:option>
							<form:option value="C">Casado(a)</form:option>
							<form:option value="D">Divorciado(a)</form:option>
							<form:option value="V">Viuvo(a)</form:option>
						</form:select>
					</div>
				</div>
	            <div class="col-md-6" id="divDataNascimento">
	            	<div class="form-group">
	                	<label for="text" class="control-label ">Data de nascimento</label>
	                    <div class="date input-group">
	                    	<form:input path="segurado.datanascimento" id="datanascimento" cssClass="form-control validate[required] mask-data"/>
	                        <span class="add-on input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
	            <div class="col-md-6">
	            	<div class="form-group">
	                	<label for="email" class="control-label ">Email</label>
	                	<form:input path="segurado.email" id="email" cssClass="form-control validate[required, custom[email]]"/>
					</div>
				</div>
	            <div class="col-md-6">
	            	<div class="form-group">
	                	<label for="text" class="control-label ">Confirma&ccedil;&atilde;o do email</label>
	                	<form:input path="confirmacaoEmail" id="confirmacaoEmail" cssClass="form-control validate[required, custom[email], equals[email]]"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
	            	<div class="form-group">
	                	<label for="text" class="control-label ">Telefone celular</label>
	                	<form:input path="celular" id="celular" cssClass="form-control mask-celular validate[required]"/>
					</div>
				</div>
	            <div class="col-md-6">
	            	<div class="form-group">
	                	<label for="text" class="control-label " id="labelTelefone">Telefone residencial</label>
	                    <form:input path="residencial" id="residencial" cssClass="form-control mask-telefone validate[required]"/>
					</div>
				</div>
			</div>
			<div class="row">
	            <div class="col-md-12 margin-top-20">
	            	<div class="text-right">
	            		<button class="btn btn-primary" type="submit"><i class="fa fa-save"></i> Cadastrar</button>
	            		<button class="btn btn-default" type="reset"><i class="fa fa-times"></i> Cancelar</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>

<content tag="script">
	<script src="/portal_static/microseguro/scripts/segurado.js" type="text/javascript"></script>
</content>