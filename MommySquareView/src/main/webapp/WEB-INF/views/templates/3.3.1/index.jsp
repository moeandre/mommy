<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <html>
    <head>
		<meta charset="UTF-">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">

		<title><decorator:title /> Micro Seguros - Tokio Marine Portal</title>

		<!-- Bootstrap -->
		<link href="${host}/padrao/${versao}/css/bootstrap.css" rel="stylesheet" media="screen" >
		<link href="${host}/padrao/${versao}/css/bootstrap-theme.css" rel="stylesheet" media="screen" >

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<link href="${host}/padrao/${versao}/css/bootstrap-ie.css" rel="stylesheet" media="screen" >

		  	<script src="${host}/padrao/${versao}/js/html5shiv.js"></script>
		  	<script src="${host}/padrao/${versao}/js/respond.min.js"></script>

			<link href="${host}/padrao/${versao}/js/respondJS/respond-proxy.html" id="respond-proxy" rel="respond-proxy">
			<link href="/portal_static/microseguro/scripts/respondJS/respond.proxy.gif" id="respond-redirect" rel="respond-redirect">
			<script src="${host}/padrao/${versao}/js/respondJS/respond.proxy.js"></script>
   		<![endif]-->

		<!-- Font Awesone - Framework icon -->
		<link href="${host}/padrao/${versao}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		
		<!-- ADDONS -->
		<link rel="stylesheet" type="text/css" href="${host}/padrao/${versao}/addons/jquery-steps/css/jquery.steps.css">
		<link rel="stylesheet" type="text/css" href="${host}/padrao/${versao}/addons/validationEngine/css/validationEngine.jquery.css">

		<link href="/portal_static/microseguro/css/default.css" rel="stylesheet" media="screen" >

		<link rel="shortcut icon" href="${host}/padrao/${versao}/images/ico/favicon.ico">

		<script type="text/javascript">
			var contextPath = '${pageContext.request.contextPath}';
		</script>

		<decorator:getProperty property="page.css"/>

		<decorator:head />

	</head>

	<body>

		<!--[if lt IE 7]>
      		<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
      	<![endif]-->
      	
      	<div class="container-fluid">

			<decorator:body />

		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
		<script src="${host}/padrao/${versao}/js/jquery.min.js"></script>

		<!-- Include all compiled plugins (below), or include individual files as needed --> 
		<script src="${host}/padrao/${versao}/js/bootstrap.min.js"></script>
		
		<!-- ADDONS -->
		<script src="${host}/padrao/${versao}/addons/blockui/js/jquery.blockUI.js" type="text/javascript"></script>
		<script src="${host}/padrao/${versao}/addons/validationEngine/js/jquery.validationEngine.js" type="text/javascript"></script> 
		<script src="${host}/padrao/${versao}/addons/validationEngine/js/jquery.validationEngine-pt_BR.js" type="text/javascript"></script>
		<script src="${host}/padrao/${versao}/addons/mascaras/js/jquery.maskedinput.js" type="text/javascript"></script>
		<script src="${host}/padrao/${versao}/addons/datepicker/js/bootstrap-datepicker.js"></script>
		<script src="${host}/padrao/${versao}/addons/jquery-steps/js/jquery.steps.js"></script>

		<script src="/portal_static/microseguro/scripts/jquery.maskMoney.min.js"></script>
		<script src="/portal_static/microseguro/scripts/jquery.creditCardValidator.js"></script>
		<script src="/portal_static/microseguro/scripts/handlebars-v3.0.3.js"></script>
		
		<script src="/portal_static/microseguro/scripts/main.js" type="text/javascript"></script>

		<decorator:getProperty property="page.script"/>
		
		<script type="text/javascript" src="${host}/padrao/${versao}/addons/iframeResizer/iframeResizer.contentWindow.js"></script>

	</body>
</html>