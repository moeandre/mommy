<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />
<html>
	<head>
		<title>Residencial + Capitalização - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/chosen-master/css/chosen.css">
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

			<script src="${host}/padrao/${versao}/addons/chosen-master/js/chosen.jquery.js"></script>
			<script src="/portal_static/microseguro/scripts/ajax-chosen.js" type="text/javascript"></script>

			<script src="/portal_static/microseguro/scripts/segurado.js" type="text/javascript"></script>
			<script src="/portal_static/microseguro/scripts/pagamento.js" type="text/javascript"></script>
			<script src="/portal_static/microseguro/scripts/residencial.js" type="text/javascript"></script>
			<script type="text/javascript">
				jQuery(document).ready(function(){
					var w = jQuery("#wizard").steps({enablePagination: false, enableAllSteps: false});

					masks();

					jQuery( "body" ).delegate( "#contratar", "click", function(e) {
						e.preventDefault();
						enviar(jQuery(this).data("form"), jQuery(this).data("target"));

					});

					jQuery('.chosen-select').chosen({
						no_results_text: "Efetuando a busca para ",
						max_selected_options: 1
					});

					jQuery("#cep_chosen .default" ).keyup(function(e) {
						e.stopPropagation();
						buscarEndereco(jQuery(this).val(),"#cep");

					});

				});

				jQuery( "body" ).delegate( "#calcular", "click", function(e) {
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
								if(response.status && response.results){
									jQuery.each(response.results, function(index, result) {
										target.append('<tr><td><div class="radio text-center"><label><input type="radio" value="'+index+'" id="cobertura_'+index+'" name="idxCobertura"></label></div></td><td>'+result.descCobert+'</td><td>'+fmtValor(result.vlis)+'<br><strong>'+fmtValor(result.sorteioCap)+'</strong></td><td><h4>'+result.sorteioCap+'</h4></td></tr>');
									});
									jQuery( "body" ).delegate( "input[name='idxCobertura']", "click", function(e) {
										jQuery('#contratar').attr('disabled',false);
									});
								}
								$.unblockUI();
							}
						});
					}
				});

				jQuery( "body" ).delegate( "input[name='idxCobertura']", "click", function(e) {
					jQuery('#contratar').attr('disabled',false);
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