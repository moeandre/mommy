<html>
	<head>
		<title>Capitalização - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
		</content>
	</head>
	<body>
		<div class="cleafix">&nbsp;</div>
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
					var w = jQuery("#wizard").steps({enablePagination: false, enableAllSteps: false});

					masks();

					jQuery( "body" ).delegate( "#contratar", "click", function(e) {
						e.preventDefault();
						enviar(jQuery(this).data("form"), jQuery(this).data("target"));

					});

					var target = $("#dadosCobertura");

					jQuery.ajax({
						type: 'POST',
						url: 'apcapitalizacao/ajax/calcular',
						data: $("#form-produto").serialize(),
						success: function(response) {
							target.html('');
							if(response.status && response.results){
								jQuery.each(response.results, function(index, result) {
									target.append('<tr><td><div class="radio text-center"><label><input type="radio" value="'+index+'" id="cobertura_'+index+'" name="idxCobertura"></label></div></td><td>'+result.descCobert+'<br><strong>1 Sorteio Mensal</strong></td><td>'+fmtValor(result.premio)+'<br><strong>'+fmtValor(result.sorteioCap)+'</strong></td><td><h4>'+fmtValor(result.vlis)+'</h4></td></tr>');
								});
								jQuery( "body" ).delegate( "input[name='idxCobertura']", "click", function(e) {
									jQuery('#contratar').attr('disabled',false);
								});

							}
							$.unblockUI();
						}
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