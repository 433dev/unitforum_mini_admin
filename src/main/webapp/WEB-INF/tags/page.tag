<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="ftt" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ attribute name="menuId" required="false" type="java.lang.String"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<title>UnitForum</title>
<link rel="shortcut icon" href="${staticDomain}/img/favicon.ico" type="image/x-icon">
<link rel="icon" href="${staticDomain}/img/favicon.ico" type="image/x-icon"> 

<ftt:defaultCss />
<ftt:defaultJs />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<ftt:pageLayout menuId="${menuId}">
			<jsp:doBody />
		</ftt:pageLayout>
		<ftt:pageSetting />
	</div>
</body>
</html>