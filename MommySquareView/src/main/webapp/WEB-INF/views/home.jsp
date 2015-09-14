<!DOCTYPE html>
<html>
	<head>
		<!-- Meta, title -->
	 	<meta charset="utf-8">
 		<meta content="IE=edge" http-equiv="X-UA-Compatible" >
 		<meta content="width=device-width, initial-scale=1.0" name="viewport" >
 		<title>Micro Seguros - Tokio Marine Portal</title>

 		<!-- Bootstrap -->
 		<link rel="stylesheet" href="${host}/padrao/${versao}/css/bootstrap.min.css">
 		<link rel="stylesheet" href="${host}/padrao/${versao}/css/bootstrap-theme.min.css">

 		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<link href="${host}/padrao/${versao}/css/bootstrap-ie.css" rel="stylesheet" media="screen" >

		  	<script src="${host}/padrao/${versao}/js/html5shiv.js"></script>
		  	<script src="${host}/padrao/${versao}/js/respond.min.js"></script>

			<link href="${host}/padrao/${versao}/js/respondJS/respond-proxy.html" id="respond-proxy" rel="respond-proxy">
			<link href="/portal_static/microseguro/scripts/respondJS/respond.proxy.gif" id="respond-redirect" rel="respond-redirect">
			<script src="${host}/padrao/${versao}/js/respondJS/respond.proxy.js"></script>
   		<![endif]-->

		<!-- Font Awesome - Framework de ícones -->
 		<link rel="stylesheet" type="text/css" href="${host}/padrao/${versao}/font-awesome/css/font-awesome.min.css">

 		<link rel="shortcut icon" href="${host}/padrao/${versao}/images/ico/favicon.ico">
 	</head>
	<body>
		<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
	 		<div class="container">
		  		<!-- Agrupa os links para melhor visualizar via mobile -->
		  		<div class="navbar-header">
		   			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
		    			<span class="sr-only">Toggle navigation</span>
		    			<span class="icon-bar"></span>
		    			<span class="icon-bar"></span>
		    			<span class="icon-bar"></span>
		   			</button>
		   			<a class="navbar-brand" href="${pageContext.request.contextPath}/home">Tokio Marine</a>
		  		</div>
		  		<!-- Coletar os links de navegação, formulários e outros conteúdos para alternar -->
		  		<div class="navbar-collapse collapse">
		   			<ul class="nav navbar-nav">
		   				<li class="dropdown">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">Ferramenta de Cotação<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/equipamento" target="frame">Equipamentos</a></li>
								<li><a href="${pageContext.request.contextPath}/garantia" target="frame">Seguro Garantia</a></li>
								<li><a href="${pageContext.request.contextPath}/apcapitalizacao" target="frame">AP + Capitalização</a></li>
								<li><a href="${pageContext.request.contextPath}/residencial" target="frame">Residencial + Capitalização</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/operacoes" target="frame">Operações</a></li>
						<li><a href="${pageContext.request.contextPath}/cancelarSeguro" target="frame">Cancelar Seguros</a></li>
		    			<li><a href="${pageContext.request.contextPath}/documento" target="frame">Documentos</a></li>
		    			<li><a href="${pageContext.request.contextPath}/relatorioFaturamento" target="frame">Relatório de Faturamento</a></li>
		   			</ul>
		   		</div>
		   	</div>
		</nav>
		<header id="overview" class="jumbotron subhead subhead-fixed">
	 		<div class="container">
	  			<div class="row">
	   				<div class="col-xs-12 col-sm-3 col-md-2">
	    				<a href="${pageContext.request.contextPath}/home">
	     					<img src="${host}/padrao/${versao}/images/cmm/logo-210x70.png" class="img-responsive" alt="Tokio Marine" title="Tokio Marine">
	    				</a>
	   				</div>
	   				<div class="col-xs-12 col-sm-3 col-sm-offset-2 col-md-4 col-md-offset-2">
	    				<h2>Micro Seguros </h2>
	   				</div>
	  			</div>
	 		</div>
		</header>
		<div class="container">
	    	<iframe height="5" frameborder="0" width="100%" id="frame" name="frame" scrolling="no" src="#"></iframe>
		</div>

		<!-- jQuery (Necessário para plugins de JavaScript do Bootstrap's) -->
		<script src="${host}/padrao/${versao}/js/jquery.min.js"></script>

		<!-- Inclui todos os plugins compilados -->
		<script src="${host}/padrao/${versao}/js/bootstrap.js"></script>

		<script type="text/javascript">
			var env = 'dev';
		</script>

		<script src="${host}/padrao/${versao}/addons/env/js/environment.js"></script>

		<script type="text/javascript" src="${host}/padrao/${versao}/addons/iframeResizer/jquery.iframeResizer.js"></script>
		<script type="text/javascript">
			try{
				jQuery('iframe').iFrameSizer({
					log: true,
					contentWindowBodyMargin:8,
					doHeight:true,
					doWidth:false,
					interval:32,
					enablePublicMethods:true});
			} catch (e) { /*Nada a Fazer*/ }

	   	</script>
	</body>
</html>