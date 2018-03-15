<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ftt" tagdir="/WEB-INF/tags/"%>

<ftt:page>
	<ftt:content>
		<section class="content-header">
			<h1>
				<strong><s:message code="resource.restriction.main.title" /></strong>
			</h1>
		</section>

		<section class="content">
			<div class="callout callout-danger">
				<p>
					<span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;<strong><s:message code="resource.article.main.message.move"/></strong>
				</p>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="divAddSec" class="box box-warning">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.article.main.message.forumlist" /></h3>
						</div>
						<div class="box-body">
							<table id="tblList" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th><s:message code="resource.article.main.message.gamename"/></th>
										<th><s:message code="resource.article.main.message.forumdescription"/></th>
										<th><s:message code="resource.article.main.message.features"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gameList}" var="row">
										<tr data-idx="${row.getMasterIdx()}" data-ssn="${row.getSsn()}">
											<td>${gameCodeTable.get(row.getSsn())}(${row.getSsn()})</td>
											<td>${row.getDesc()}</td>
											<td><button type="button" class="btn btn-primary d-moveArticle"><s:message code="resource.article.main.message.go"/></button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</ftt:content>
</ftt:page>

<script>
	(function($) {
		var tblMaster;
		
		$(function() {
			init();
			bindEvent();
		});
		
		function init() {
			tblMaster = $("#tblList");
			tblMaster.DataTable({
				columns: [
				 	{ orderable: true },
				 	{ orderable: false },
					{ orderable: false }
				]
			});
		}
		
		function bindEvent() {
			tblMaster.find("button.d-moveArticle").on("click", function() {
				var self = $(this),
					data = self.closest("tr").data();
				
				location.href = "/restriction/list?ssn=" + data.ssn + "&masterIdx=" + data.idx;
			});
		}
	})(jQuery);
</script>
	