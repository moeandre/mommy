<html>
	<head>
		<title>Documentos - </title>
		
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/dropzone/css/dropzone.css">
		</content>

	</head>
	<body>
		<div class="container-fluid">
			<h3>Painel de Documentos</h3>
			<div class="container-fluid txtBox">
            	<div class="row">
               		<div class="col-md-6">
                  		<h4>Documentos obrigat&oacute;rios</h4>
				  		<hr>
                  		<p>Para dar in&iacute;cio as opera&ccedil;&otilde;es, os documentos obrigat&oacute;rios abaixo relacionados devem ser impressos, preenchidos e assinados. Em seguida, envie-os a Tokio Marine clicando no bot&atilde;o 'Enviar documento'.</p>
                  		<div class="error-notice margin-top-20" id="obrigatorio">
                  			<c:forEach items="${obrigatorios}" var="documento">
                  				<c:set var="disabled" value="" scope="request"></c:set>
                  				<c:if test="${documento.documento.retornoObrigatorio == '0'}">
				                	<c:set var="disabled" value="disabled='disabled'" scope="request"></c:set>
								</c:if>
                  				<div class="oaerror danger margin-top">
			                    		<p class="obrigatorio-${documento.documento.idDocumento}">
				                    		<strong><i class="fa file-text-o"></i> ${documento.documento.nome}</strong>
				                    		<c:choose>
				                    			<c:when test="${documento.url != null}"><button ${disabled} type="button" class="btn btn-success pull-right send" data-id="${documento.documento.idDocumento}"><i class="fa fa-check"></i> Enviar documento</button></c:when>
				                    			<c:otherwise><button  ${disabled} type="button" class="btn btn-default pull-right send" data-id="${documento.documento.idDocumento}"><i class="fa fa-upload"></i> Enviar documento</button></c:otherwise>
				                    		</c:choose>
				                    		<c:choose>
				                    			<c:when test="${documento.lido == '1'}"><a class="btn btn-success pull-right print" data-id="${documento.documento.idDocumento}" href="${documento.documento.url}"><i class="fa fa-check"></i> Imprimir</a></c:when>
				                    			<c:otherwise><a class="btn btn-default pull-right print" data-id="${documento.documento.idDocumento}" href="${documento.documento.url}"><i class="fa fa-print"></i> Imprimir</a></c:otherwise>
				                    		</c:choose>
				                    	</p>
								</div>
							</c:forEach>
                  		</div>
               		</div>
               		<div class="col-md-6">
                  		<h4>Documentos Diversos</h4>
				  		<hr>
                  		<p>Documentos dispon&iacute;veis para sua consulta.</p>
                  		<p>&nbsp;</p>
                  		<div class="error-notice">
                  			<c:forEach items="${opcionais}" var="documento">
                  				<div class="oaerror warning margin-top">
	                        		<p><strong><i class="fa list-ul"></i>${documento.nome}</strong> <a href="${documento.url}" class="btn btn-default pull-right" role="button"><i class="fa fa-search"></i> Visualizar</a></p>
	                     		</div>
                  			</c:forEach>
                  		</div>
               		</div>
            	</div>
            	<c:if test="${target != null}">
					<div class="row">
						<div class="col-md-6 margin-top-20">
						</div>
						<div class="col-md-6 margin-top-20">
							<c:set var="disabled" value="" scope="request"></c:set>
                  			<c:if test="${preenchimentoOk ne true}">
				               	<c:set var="disabled" value="disabled='disabled'" scope="request"></c:set>
							</c:if>
						
							<a ${disabled} class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/${target}" id="continuar"><i class="fa fa-arrow-right"></i> Continuar</a>
						</div>
					</div>
				</c:if>
         	</div>
      	</div>
      	<!-- /container -->
      	<!-- Modal - fa-upload -->
      	<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
            	<div class="modal-content">
               		<div class="modal-header">
                  		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                  		<h4 class="modal-title" id="myModalLabel">Enviar documentos</h4>
               		</div>
               		<div class="modal-body">
                  		<form id="uploadForm" action="${pageContext.request.contextPath}/upload/ajax/" class="dropzone">
                  			<input type="hidden" name="fileId" id="fileId">
                  		</form>
					</div>
               		<div class="modal-footer">
                  		<button type="button" class="btn btn-primary" id="finalizar" disabled="disabled" >Finalizar</button>
                  		<button type="button" class="btn btn-default" id="cancelar" data-dismiss="modal">Cancelar</button>
               		</div>
            	</div>
            	<!-- /.modal-content -->
        	</div>
         	<!-- /.modal-dialog -->
      	</div>
      	<!-- /.modal -->

		<content tag="script">
			<script src="${host}/padrao/${versao}/addons/dropzone/js/dropzone.js" type="text/javascript"></script>
			
			<script type="text/javascript">
				var dropId;
				var urlArquivo;
				Dropzone.options.uploadForm = {
					maxFiles: 1,
					addRemoveLinks: false,	
					init: function () {
						var _this = dropId = this;
						this.on("success", function (file,responseText) {
							if(responseText.sucesso == true){
								urlArquivo = responseText.urlArquivo;
								jQuery("#finalizar").attr("disabled", false);
							}
							
						});

						
					}
				 
				};
				var bntDisabled;

				jQuery("body").delegate('#obrigatorio .send', 'click', function(e){
					//jQuery('#uploadForm').reset();
					jQuery('#fileId').val( $(this).data("id"));
					jQuery('#uploadModal').modal('show');
				});

				jQuery("body").delegate('#obrigatorio .print', 'click', function(e){

					e.preventDefault();

					var idDocumento = $(this).data("id");
					var urlArquivo = $(this).attr("href");

					if(idDocumento !== "" && urlArquivo !== ""){
						$.blockUI();
						jQuery.ajax({
							type: 'GET',
							url: '${pageContext.request.contextPath}/documento/ajax/ler/'+idDocumento,
							success: function(response) {
								if(response.status){

									var _button = jQuery("#obrigatorio p.obrigatorio-"+idDocumento+" a.print");
									_button.removeClass("btn-default").addClass("btn-success");
									_button.find('i').removeClass("fa-print").addClass("fa-check");

									if(response.preenchimentoOk){
										jQuery("#continuar").attr("disabled", false);
									}

									window.location.href = urlArquivo;
								}
								$.unblockUI();
							}
						});
					}
					dropId.removeAllFiles();
				});
				

				jQuery('#uploadModal').on('show.bs.modal', function () { 
					//jQuery('#uploadForm').reset();
					jQuery("#finalizar").attr("disabled", true);
				});
				
				jQuery('#uploadModal').on('hidden.bs.modal', function () { 
					jQuery("#finalizar").attr("disabled", true);
					dropId.removeAllFiles();
				});

				jQuery('body').delegate('#finalizar','click',function (){

					var idDocumento = jQuery('#fileId').val();

					if(idDocumento !== "" && urlArquivo !== ""){
						$.blockUI();
						jQuery.ajax({
							type: 'POST',
							url: '${pageContext.request.contextPath}/documento/ajax/enviar',
							data: {"idDocumento": idDocumento, "urlArquivo": urlArquivo},
							success: function(response) {
								if(response.status){

									var _button = jQuery("#obrigatorio p.obrigatorio-"+idDocumento+" .btn");
									_button.removeClass("btn-default").addClass("btn-success");
									_button.find('i').removeClass("fa-upload fa-print").addClass("fa-check");
									
									//jQuery("#obrigatorio .send[data-id='"+idDocumento+"']").attr("disabled", true);
									if(response.preenchimentoOk){
										jQuery("#continuar").attr("disabled", false);
										
									}
									urlArquivo = null;
								}
								jQuery('#uploadModal').modal('hide');
								$.unblockUI();
							}
						});
					}
					dropId.removeAllFiles();

				});

			</script>

		</content>

	</body>
</html>