<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />
<html>
	<head>
		<title>Operações - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
		</content>
	</head>
	<body>
		<div id="wizard">
        	<h1>Pêndencia de Pagamento</h1>
            <div class="container-fluid" id="produto">
            	<jsp:include page="_produto.jsp" flush="true"></jsp:include>
			</div>
          	<h1>Pagamento</h1>
            <div class="container-fluid">
			</div>
			<h1>Confirmação</h1>
			<div class="container-fluid">
			</div>
		</div>

		<div class="col-md-12">
			<c:if test="${paginas > 1}">
				<div class="row">
					<div class="col-md-12">
						<ul class="pagination pull-right" style="margin:10px">
							<c:if test="${pagina > 1}">
								<c:if test="${(pagina - 2) > 1}">
									<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/1" data-pagina="1">&lt;&lt;</a></li>
								</c:if>
					  			<c:if test="${(pagina - 1) != 1}">
									<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/${pagina-2}" data-pagina="${pagina-2}">${pagina-2}</a></li>
								</c:if>
					  			<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/${pagina-1}" data-pagina="${pagina-1}">${pagina-1}</a></li>
					  		</c:if>
					  		<li class="active"><span>${pagina}</span></li>
							<c:if test="${pagina < paginas}">
								<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/${pagina+1}" data-pagina="${pagina+1}">${pagina+1}</a></li>
								<c:if test="${(pagina + 1) != paginas}">
									<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/${pagina+2}" data-pagina="${pagina+2}">${pagina+2}</a></li>
								</c:if>
								<c:if test="${(pagina + 2) < paginas}">
									<li><a href="${pageContext.request.contextPath}/operacoes/pesquisar/pagina/${paginas}" data-pagina="${paginas}">&gt;&gt;</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>
		</div>
		<div class="col-md-12 margin-top-20">

		<content tag="script">

			<script src="/portal_static/microseguro/scripts/segurado.js" type="text/javascript"></script>
			<script src="/portal_static/microseguro/scripts/pagamento.js" type="text/javascript"></script>
			<script type="text/javascript">
				jQuery(document).ready(function(){
					var w = jQuery("#wizard").steps({enablePagination: false, enableAllSteps: false});

					masks();

					jQuery('form.validate').validationEngine();


					jQuery('#localizar').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-operacoes');
						jQuery('#pagina').val(1);
						busca.attr('action',busca.attr('action'));

						jQuery('#form-operacoes').submit();

					});

					jQuery('.pagination a').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-operacoes');
						jQuery('#pagina').val(jQuery(this).data('pagina'));
						busca.attr('action',busca.attr('action') + '#lista');

						jQuery('#form-operacoes').submit();

					});

					jQuery('.ordenacao th[class!="none"]').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-operacoes');

						var direcao = jQuery('#direcao').val();
						if(direcao == '' || direcao == 'asc'){
							direcao = 'desc';
						}else{
							direcao = 'asc';
						}
						jQuery('#direcao').val(direcao);
						jQuery('#orderBy').val(jQuery(this).data('order'));

						busca.attr('action',busca.attr('action') + '#lista');

						jQuery('#form-operacoes').submit();

					});

				});


				jQuery( "body" ).delegate( "#pagamento", "click", function( event ) {
					selecionarOperacao(contextPath+'/operacoes/ajax/pagamento/'+$(this).attr('data-cpf')+'/numeroCalculo/'+$(this).attr('data-calculo')+'/idProduto/'+$(this).attr('data-produto'));
				});

				jQuery( "body" ).delegate( "#apagarModal", "click", function( event ) {
					$('#modalApagar').modal('show');
					$('#numeroCalculo').val($(this).attr('data-calculo'));
				});

				jQuery( "body" ).delegate( "#apagar", "click", function( event ) {
					$('#modalApagar').modal('hide');
					$('#form-operacoes').attr('action', 'apagar');
					$('form#form-operacoes').submit();
				});

				jQuery( "body" ).delegate( "#visualizar", "click", function( event ) {
				   $('#modalVisualizar').modal('show');
				   $('#protocolo').html($(this).attr('data-calculo'));
				   $('#produto').html($(this).attr('data-produto'));
				   $('#valor').html($(this).attr('data-valor'));
				});


				function selecionarOperacao(action){

					var nextIndex = parseInt(jQuery("#wizard").steps("getCurrentIndex") + 1);
					var target = jQuery("#wizard-p-"+nextIndex);
					$.blockUI();
					jQuery.ajax({
						type: 'GET',
						url: action,
						success: function(response) {
							target.html(response);
							jQuery('.validate').validationEngine();
							jQuery("#wizard").steps("next");
							masks();
							$.unblockUI();
						}
					});

				}



         	</script>
         </content>

	</body>
</html>