<div class="clearfix">&nbsp;</div>
<div class="row">
	<h2 class="text-center">
		<i class="fa fa-check text-success"></i> Pagamento efetuado com
		sucesso!
	</h2>
	<div class="col-md-8 col-md-offset-2 text-center">
		<div class="clearfix">&nbsp;</div>
		<div class="well well-lg">
			<h4>
				<small>Número do certificado</small> ${numeroCalculo}
			</h4>
		</div>
		<div class="txtBox">
			<h4>Detalhes do produto</h4>
			<table class="table table-striped">
				<tbody>
					<tr>
						<th class="text-center">Produto</th>
						<th class="text-center">Valor</th>
						<th class="text-center">Vigência</th>
					</tr>
					<tr>
						<td>${nomeProduto}</td>
						<td class="text-right">${premio}</td>
						<td>${vigencia}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="clearfix margin-top-20">&nbsp;</div>
<div class="text-center">
	<a class="btn btn-primary" href="#"><i class="fa fa-print"></i>	Imprimir certificado</a>&nbsp;&nbsp;
	<a class="btn btn-info" href="#" id="email"><i	class="fa fa-envelope"></i> Enviar por email</a>
	
</div>

<script type="text/javascript">

	jQuery( "body" ).delegate( "#email", "click", function(e) {
		var calculo = ${numeroCalculo};
		window.location.href = contextPath+'/email/numeroCalculo/'+calculo;
	});

</script>