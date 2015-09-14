<html>
	<head>
		<title>Cancelamentos - </title>
		<content tag="css">
			<link type="text/css" rel="stylesheet" href="${host}/padrao/${versao}/addons/datepicker/css/datepicker-theme.css">
		</content>
	</head>
	<body>
		<div id="wizard">
        	<h1>Cancelar Seguro</h1>
            <div class="container-fluid" id="produto">
            	<jsp:include page="_produto.jsp" flush="true"></jsp:include>
			</div>
          	<h1>Dados do Cancelamento</h1>
            <div class="container-fluid">
			</div>
			<h1>Confirmação</h1>
			<div class="container-fluid">
			</div>
		</div>

		<div class="col-md-12" id="paginacao">
			<c:if test="${paginas > 1}">
				<div class="row">
					<div class="col-md-12">
						<ul class="pagination pull-right" style="margin:10px">
							<c:if test="${pagina > 1}">
								<c:if test="${(pagina - 2) > 1}">
									<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/1" data-pagina="1">&lt;&lt;</a></li>
								</c:if>
					  			<c:if test="${(pagina - 1) != 1}">
									<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/${pagina-2}" data-pagina="${pagina-2}">${pagina-2}</a></li>
								</c:if>
					  			<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/${pagina-1}" data-pagina="${pagina-1}">${pagina-1}</a></li>
					  		</c:if>
					  		<li class="active"><span>${pagina}</span></li>
							<c:if test="${pagina < paginas}">
								<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/${pagina+1}" data-pagina="${pagina+1}">${pagina+1}</a></li>
								<c:if test="${(pagina + 1) != paginas}">
									<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/${pagina+2}" data-pagina="${pagina+2}">${pagina+2}</a></li>
								</c:if>
								<c:if test="${(pagina + 2) < paginas}">
									<li><a href="${pageContext.request.contextPath}/cancelarSeguro/pesquisar/pagina/${paginas}" data-pagina="${paginas}">&gt;&gt;</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>
		</div>

		<content tag="script">
			<script src="/portal_static/microseguro/scripts/pagamento.js" type="text/javascript"></script>
			<script src="/portal_static/microseguro/scripts/cancelarVenda.js" type="text/javascript"></script>
         </content>

	</body>
</html>