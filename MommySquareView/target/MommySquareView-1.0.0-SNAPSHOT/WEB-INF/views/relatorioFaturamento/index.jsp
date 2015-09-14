<html>
	<head>
		<title>Relatório de Faturamento - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
		</content>
	</head>
	<body>
		<div id="wizard">
            <div class="container-fluid" id="produto">
            	<jsp:include page="_relatorio.jsp" flush="true"></jsp:include>
			</div>
        	<div class="container-fluid">
			</div>
		</div>
		
		<content tag="script">

			<script type="text/javascript">

				jQuery(document).ready(function(){

					masks();


					jQuery('#localizar').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-relatorioFaturamento'); 
						jQuery('#pagina').val(1);
						busca.attr('action',busca.attr('action'));

						jQuery('#form-relatorioFaturamento').submit();

					});

					var nowTemp = new Date();
				    var now  = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), (nowTemp.getDate() - 45), 0, 0, 0, 0);
				    var startDate;
				    var checkout;
				    
					var checkin = jQuery('#dataInicio').datepicker({
									format: 'dd/mm/yyyy',
									startDate: now
						  	}).on('changeDate', function(selected) {

						  		jQuery('#dataFim').attr('disabled', false);

						  		startDate = new Date(selected.date.valueOf());

						  		checkout = checkout ||  jQuery('#dataFim').datepicker({ format: 'dd/mm/yyyy',startDate: startDate, orientation: 'top right'})
						  								.on('changeDate', function(ev) { jQuery(this).datepicker("hide"); })
						  								.data('datepicker');
						  		checkout.setStartDate(startDate);

						  		jQuery(this).datepicker("hide");

						  	}).data('datepicker');

					<c:if test="${relatorioFaturamentoForm.dataInicio ne null}">

						var dtEventoInicio = '${relatorioFaturamentoForm.dataInicio}'.split("/");
						startDate = new Date(dtEventoInicio[2], (dtEventoInicio[1] - 1),dtEventoInicio[0])
						checkout = jQuery('#dataFim').datepicker({ format: 'dd/mm/yyyy',startDate: startDate})
							.on('changeDate', function(ev) { jQuery(this).datepicker("hide"); })
							.data('datepicker');
						checkout.setStartDate(startDate);

					</c:if>

					jQuery('.pagination a').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-relatorioFaturamento'); 
						jQuery('#pagina').val(jQuery(this).data('pagina'));
						busca.attr('action',busca.attr('action') + '#lista');

						jQuery('#form-relatorioFaturamento').submit();

					});

					jQuery('.ordenacao th[class!="none"]').on('click',function(e){

						e.preventDefault();
						var busca = jQuery('#form-relatorioFaturamento'); 
						
						var direcao = jQuery('#direcao').val();
						if(direcao == '' || direcao == 'asc'){
							direcao = 'desc';
						}else{
							direcao = 'asc';
						}
						jQuery('#direcao').val(direcao);
						jQuery('#orderBy').val(jQuery(this).data('order'));

						busca.attr('action',busca.attr('action') + '#lista');

						jQuery('#form-relatorioFaturamento').submit();

					});

				});

				
         	</script>
         </content>

	</body>
</html>