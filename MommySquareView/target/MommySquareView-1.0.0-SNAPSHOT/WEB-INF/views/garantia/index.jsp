<html>
	<head>
		<title>Garantia Extendida - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
		</content>
	</head>
	<body>
       	<div id="wizard">
        	<h1>Produto</h1>
            <div class="container-fluid" id="produto">
            	<jsp:include page="_produto.jsp" flush="true"></jsp:include>
			</div>
            <h1>Dados do segurado</h1>
            <div class="container-fluid">
			</div>
			<h1>Pagamento</h1>
            <div class="container-fluid">
			</div>
			<h1>Confirmação</h1>
			<div class="container-fluid">
			</div>
		</div>	
		<content tag="script">
			<script src="/portal_static/microseguro/scripts/segurado.js" type="text/javascript"></script>
			<script src="/portal_static/microseguro/scripts/pagamento.js" type="text/javascript"></script>
			<script type="text/javascript">
				jQuery(document).ready(function(){
					
					jQuery("#wizard").steps({enablePagination: false, enableAllSteps: false});

					masks();

					jQuery( "body" ).delegate( "#tipo", "change", function(e) {

						var _this = jQuery(this);
						var _target = jQuery('#'+_this.data('target'));
						_target.html('');
						var idLinha = jQuery('#linha').val();
						//Popula se houver valor selecionado
						if(jQuery.trim(_this.val())){
							$.blockUI();
							var action = _this.data('action') + '/' + _this.data('target')+ '/'+idLinha+'/' +_this.val()+'/';
							montarCombo(action,_target);
						}
					});

					jQuery( "body" ).delegate( "#categoria", "change", function(e) {

						var _this = jQuery(this);
						var _target = jQuery('#'+_this.data('target'));
						_target.html('');
						var idLinha = jQuery('#linha').val();
						var idTipo = jQuery('#tipo').val();
						//Popula se houver valor selecionado
						if(jQuery.trim(_this.val())){
							$.blockUI();
							var action = _this.data('action') + '/' + _this.data('target')+ '/'+idLinha+ '/'+idTipo+'/' +_this.val()+'/';
							montarCombo(action,_target);
						}
					});

					jQuery( "body" ).delegate( "#marca", "change", function(e) {

						var _this = jQuery(this);
						var _target = jQuery('#'+_this.data('target'));
						_target.html('');
						var idLinha = jQuery('#linha').val();
						//Popula se houver valor selecionado
						if(jQuery.trim(_this.val())){
							$.blockUI();
							var action = _this.data('action') + '/' + _this.data('target')+ '/'+idLinha+ '/';
							montarCombo(action,_target);
						}
					});
								
					
					jQuery("body").delegate("#calcular", "click", function(e) {

						e.preventDefault();

						var formulario = jQuery(jQuery(this).data("form"));
						var target = jQuery(jQuery(this).data("target"));
						var action = jQuery(this).data("action");

						formulario.validationEngine('hideAll');					
						
						if(formulario.validationEngine('validate')){
							$.blockUI();
							jQuery.ajax({
								type: 'POST',
								url: action,
								data: formulario.serialize(),
								success: function(response) {
									
									target.html('');	
									alert(response.results);

									if(response.status && response.results){										
										jQuery.each(response.results, function(index, result) {
										var _html = '<table class="table table-striped">';
										    _html += '<tr>';
											_html += '<th width="250">Cobertura</th><td>' + result.descCobert + '</td><td>&nbsp;</td>';
											_html += '</tr>';	
											_html += '<tr>';	
											_html += '<th>Tempo de Garantia Extendida </th><td colspan="2"><div class="radio">';												
												jQuery.each(result.vigencias, function(idx, vigencia){
													_vigencia = vigencia;
													_html += '<label><input path="idxCoberturaGarantia" class="validate[required]" type="radio" value="' + result.descCobert + '_' + vigencia.prazo + '" id="vigencia_' + index+idx + '" name="idxCoberturaGarantia">' + vigencia.prazo + ' Meses </label>&nbsp;&nbsp;&nbsp;';
												});																					
											_html += '</div></td><tr>';
											_html += '<th>Vigência </th><td colspan="2"><div id="vigencia_' + result.descCobert + '" class="vigencia"></div></td>';	
											_html += '</tr>';	
											_html += '</tr>';		
											_html += '<tr class="warning">';
											_html += '<th>Valor do Seguro </th><td><div id="valor_' + result.descCobert + '" class="valor"></div></td><td>&nbsp;</td>';
											_html += '</tr></table>';												
											target.append(_html);
										});
										jQuery('#contratar').attr('disabled',false);										
									}								
									$.unblockUI();
									
									jQuery("body").delegate("input[name='idxCoberturaGarantia']", "click", function(e){
										
										jQuery.ajax({
											type: 'POST',
											url: 'garantia/ajax/calcularGarantia',
											data: formulario.serialize(),
											success: function(response) {
												jQuery(".vigencia").html("");
												jQuery('#vigencia_' + response.result.coberturaGarantia.descCobert)
													.html(response.result.coberturaGarantia.vigenciaSelecionada.iniVigencia + ' a ' + response.result.coberturaGarantia.vigenciaSelecionada.fimVigencia);
												jQuery(".valor").html("");
												jQuery('#valor_' + response.result.coberturaGarantia.descCobert)
													.html('R$ ' + response.result.coberturaGarantia.vigenciaSelecionada.valor);
												jQuery("#iniVigencia").val(response.result.coberturaGarantia.vigenciaSelecionada.iniVigencia);
												jQuery("#fimVigencia").val(response.result.coberturaGarantia.vigenciaSelecionada.fimVigencia);
												jQuery("#valorGarantia").val(response.result.coberturaGarantia.vigenciaSelecionada.valor);

												jQuery("#codPlan").val(response.result.coberturaGarantia.codPlan);
												jQuery("#revPlan").val(response.result.coberturaGarantia.revPlan);
												jQuery("#codCobert").val(response.result.coberturaGarantia.codCobert);
																								
											}
										});
									});
								}
							});
						}						
					});

					jQuery("body").delegate("#contratar", "click", function(e) {
						e.preventDefault();
						enviar(jQuery(this).data("form"), jQuery(this).data("target"));
					});
					
				});					

				function enviar(formSelector, targetSelector){

					var formulario = jQuery(formSelector);
					var nextIndex = parseInt(jQuery("#wizard").steps("getCurrentIndex") + 1);
					formulario.validationEngine('hideAll');
					var target = jQuery("#wizard-p-"+nextIndex);
					var action = formulario.attr('action');
					
					if(formulario.validationEngine('validate')){
						$.blockUI();
						jQuery.ajax({
	 						type: 'POST',
	 						url: action,
	 						data: formulario.serialize(),
	 						success: function(response) {

	 							target.html(response);
	 							masks();
	 							jQuery('.validate').validationEngine();
	 							jQuery("#wizard").steps("next");
	 							$.unblockUI();
	 						}
	 					});
					}
				}

				function setBandeira(value){
					$('#bandeira').val(value);
				}
							
         	</script>
         </content>

	</body>
</html>