<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="menuId" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<header class="main-header">
	<a href="/" class="logo"> <span class="logo-mini"><b>UFM</b></span> <span class="logo-lg"><b>UnitForum Mini</b></span>
	</a>
	<nav class="navbar navbar-static-top" role="navigation">
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li>
					<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
		</div>
	</nav>
</header>

<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${staticDomain}/img/icon.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info d-secOnline">
				<p class="d-pNickname">${cnfGameName}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> ${cnfEnv}</a>
			</div>
		</div>
		<ul class="sidebar-menu">
			<li><a href="/forum"><i class="fa fa-book"></i> <span><s:message code="resource.common.btn.article" /></span></a></li>
			<li><a href="/restriction"><i class="fa fa-edit"></i> <span><s:message code="resource.common.btn.restriction" /></span></a></li>
			<li><a href="/log"><i class="fa fa-folder"></i> <span><s:message code="resource.common.btn.log" /></span></a></li>
			<li><a href="/settings"><i class="fa fa-gears"></i> <span><s:message code="resource.common.btn.setting" /></span></a></li>
		</ul>
	</section>
</aside>

<div class="content-wrapper">
	<jsp:doBody />
</div>

<footer class="main-footer">
	<strong>Copyright &copy; 2015 <a href="http://www.433.co.kr/" target="_blank">4:33</a>.
	</strong> All rights reserved.
</footer>

<div class="modal fade" id="mdlAlert" role="dialog">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>
<script>
	(function($) {
		
	})(jQuery);
</script>
