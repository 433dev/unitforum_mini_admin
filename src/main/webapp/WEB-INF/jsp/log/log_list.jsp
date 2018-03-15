<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ftt" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<ftt:page>
	<ftt:content>
		<section class="content-header">
			<h1>
				<strong class="game_name"><s:message code="resource.log.main.title" /></strong>
			</h1>
		</section>

		<section class="content">
			<div class="callout callout-danger">
				<p>
					<span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;<strong><s:message code="resource.article.list.message.getdata"/></strong>
				</p>
				<p>
					<span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;<strong><s:message code="resource.article.list.message.max1000data"/></strong>
				</p>
			</div>
			<div id="secContent" class="row" data-masteridx="1">
				<div class="col-md-6">
					<div class="box box-warning">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.article.list.searchserver" /></h3>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><s:message code="resource.log.list.post.processingdate"/></label>
								<div class="col-sm-10">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-clock-o"></i>
										</div>
										<input type="text" class="form-control input-sm d-datepicker" />
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<button type="button" class="btn btn-primary d-btnSearch">Search</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.article.list.post.foruminfo" /></h3>
						</div>
						<div class="box-body">
							<table id="tblArticle" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>No</th>
										<th><s:message code="resource.log.list.post.postnumber" /></th>
										<th><s:message code="resource.log.list.post.logtype" /></th>
										<th><s:message code="resource.restriction.list.post.processedby" /></th>
										<th><s:message code="resource.log.list.post.reason" /></th>
										<th><s:message code="resource.restriction.list.post.dateprocessed" /></th>
									</tr>
								</thead>
								<tbody>
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
		var secContent, tblArticle, txtadminID, dpcWrite, startWrite, endWrite;
		
		$(function() {
			init();
			bindEvent();
		});
		
		function init() {
			moment.locale("${pageContext.response.locale}");
			
			secContent = $("#secContent");
			masterIdx = secContent.data().masteridx;
			tblArticle = $("#tblArticle");
			dtArticle = tblArticle.DataTable({
				columns: [
				 	{ orderable: true },
				 	{ orderable: false },
				 	{ orderable: false },
				 	{ orderable: false },
					{ orderable: false },
					{ orderable: false } 
				]
			});
			txtAdminID = $(".d-txtAdminID", secContent);
			dpcWrite = $(".d-datepicker").daterangepicker({
				startDate: moment().subtract(30, "days"),
				endDate: moment(),
				timePicker: true,
		        timePickerIncrement: 10,
		        opens: "left",
		        locale: {
		            format: "YYYY-MM-DD HH:mm",
		            separator: " - ",
		            applyLabel: "<s:message code='resource.common.search.btn.apply' />",
		            cancelLabel: "<s:message code='resource.common.search.btn.cancel' />",
		            fromLabel: "<s:message code='resource.common.search.btn.start' />",
		            toLabel: "<s:message code='resource.common.search.btn.end' />",
		            customRangeLabel: "<s:message code='resource.common.search.btn.menualselect' />"
		        },
		        ranges: {
		        	"<s:message code='resource.common.search.btn.today' />": [moment(), moment()],
					"<s:message code='resource.common.search.btn.yesterday' />": [moment().subtract(1, "days"), moment().subtract(1, "days")],
					"<s:message code='resource.common.search.btn.last7days' />": [moment().subtract(6, "days"), moment()],
					"<s:message code='resource.common.search.btn.last30days' />": [moment().subtract(29, "days"), moment()],
					"<s:message code='resource.common.search.btn.thismonth' />": [moment().startOf("month"), moment().endOf("month")]
				}
			});
			
			log.getList();
		}
		
		function bindEvent() {
			$("#secContent .d-btnSearch").on("click", function() {
				log.getList();
			});
		}
		
		log = {
			getList: function() {
				var data = {
						startDt: dpcWrite.data("daterangepicker").startDate.format("YYYY-MM-DD HH:mm"),
						endDt: dpcWrite.data("daterangepicker").endDate.format("YYYY-MM-DD HH:mm")
					};
				
				$.ajaxWM({
					url: "/ajax/log/list",
					data: data,
					success: function(result) {
						dtArticle.clear().draw();
						
						for (var d in result.data) {
							var row = result.data[d];
							
							dtArticle.row.add([
								row.adminLogIdx,
								row.articleIdx,
								row.logType,
								row.adminNo,
								row.comment,
								moment(new Date(row.createDt)).format("YYYY-MM-DD HH:mm:ss")
							])
							.order([0, "desc"])
							.draw(false);
						}
					}
				});
			}
		}
	})(jQuery);
</script>