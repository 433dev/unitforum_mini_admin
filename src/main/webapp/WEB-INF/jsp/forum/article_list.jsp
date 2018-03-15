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
				<strong class="game_name">${gameName}</strong> <s:message code="resource.article.list.message.postlist" />
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
			<div id="secContent" class="row" data-masteridx="${masterIdx}">
				<div class="col-md-6">
					<div class="box box-warning">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.article.list.searchserver" /></h3>
						</div>
						<div class="box-body">
							<div class="form-gorup">
								<label class="col-sm-2 control-label"><s:message code="resource.article.list.select.language"/></label>
								<div class="col-sm-10">
									<select class="form-control input-sm d-selLang">
										<option value=""><s:message code="resource.article.list.select.alllanguage"/></option>
										<c:forEach items="${langCodeList}" var="row">
											<option value="${row.getShortName()}">${row.getName()}(${row.getShortName()})</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><s:message code="resource.article.list.select.category"/></label>
								<div class="col-sm-5">
									<select class="form-control input-sm d-selMainUnit">
										<option value=""><s:message code="resource.article.list.select.mainunits" /></option>
									</select>
								</div>
								<div class="col-sm-5">
									<select class="form-control input-sm d-selSubUnit">
										<option value=""><s:message code="resource.article.list.select.subunits"/></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><s:message code="resource.article.list.post.dateposted"/></label>
								<div class="col-sm-10">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-clock-o"></i>
										</div>
										<input type="text" class="form-control input-sm d-datepicker" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><s:message code="resource.article.list.post.writer"/></label>
								<div class="col-sm-10">
									<input type="text" class="form-control input-sm d-txtNickname" placeholder="Nickname" />
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
							<h3 class="box-title"><s:message code="resource.article.list.post.foruminfo"/></h3>
						</div>
						<div class="box-body">
							<table id="tblArticle" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>No</th>
										<th><s:message code="resource.article.list.select.language" /></th>
										<th><s:message code="resource.article.list.post.unit" /></th>
										<th><s:message code="resource.article.list.post.accountid" /></th>
										<th><s:message code="resource.article.list.post.details" /></th>
										<th><s:message code="resource.article.list.post.likes" /></th>
										<th><s:message code="resource.article.list.post.datewritten" /></th>
										<th><s:message code="resource.article.list.post.function" /></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="divHideModal" class="modal fade in">
				<div class="modal-dialog" style="width:600px">
					<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title"><s:message code="resource.article.list.modal.hidereason" /></h4>
					</div>
					<div class="modal-body">
						<div class="form-group"> 
                            <div class="radio">
                                <label>
                                    <input type="radio" name="hideRadios" value="<s:message code="resource.article.list.modal.cursing" />" checked>
									<s:message code="resource.article.list.modal.cursing" />
                                </label>
                            </div>
                            <div class="radio">
                                <label class="">
                                    <input type="radio" name="hideRadios" value="<s:message code="resource.article.list.modal.offtofic" />">
									<s:message code="resource.article.list.modal.offtofic" />
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="hideRadios" value="">
                                    <input type="text" class="form-control" name="txtHideReason" maxlength="200" placeholder="<s:message code="resource.article.list.modal.placeholder.Enterreason" />" style="width:500px">
                                </label>
                            </div>
						</div>
					</div>
						<div class="modal-footer">
							<div align="center">
								<button type="button" class="btn btn-danger" data-dismiss="modal"><s:message code="resource.common.search.btn.cancel" /></button>
								<button id="btnHideInfo" type="button" class="btn btn-primary"><s:message code="resource.common.search.btn.confirm" /></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</ftt:content>
</ftt:page>
<script>
	var secContent, masterIdx, tblArticle, dtArticle, article, selLang, selMainUnit, selSubUnit, txtNickname, dpcWrite, startWrite, endWrite;
	
	(function($) {		
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
					{ orderable: true },
					{ orderable: false },
					{ orderable: false }
				]
			});
			selLang = $(".d-selLang", secContent);
			selMainUnit = $(".d-selMainUnit", secContent);
			selSubUnit = $(".d-selSubUnit", secContent);
			txtNickname = $(".d-txtNickname", secContent);
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
			
			getList();
			article.getMainUnitList();
		}
		
		function bindEvent() {
			$("#secContent .d-selMainUnit").on("change", function() {
				var self = $(this);
				article.getSubUnitList(self.val());
			});
			
			$("#secContent .d-btnSearch").on("click", function() {
				getList();
			});
		}
		
		article = {
			getMainUnitList: function() {
				var data = {
						masterIdx: masterIdx
					};
				
				$.ajaxWM({
					url: "/ajax/settings/mainunit/list",
					data: data,
					success: function(result) {
						var el = $("#secContent .d-selMainUnit");
						
						el.empty().append("<option value=\"\"><s:message code="resource.article.list.select.mainunits" /></option>");
						
						for (var d in result.data) {
							var row = result.data[d];
							
							el.append("<option value=\"" + row.class1Code + "\">" + row.class1Name + "</option>");
						}
					}
				});
			},
			getSubUnitList: function(mainUnitIdx) {
				var data = {
						masterIdx: masterIdx,
						class1Code: mainUnitIdx
					};
				
				$.ajaxWM({
					url: "/ajax/settings/subunit/list",
					data: data,
					success: function(result) {
						var el = $("#secContent .d-selSubUnit");
						
						el.empty().append("<option value=\"\"><s:message code="resource.article.list.select.subunits" /></option>");
						
						for (var d in result.data) {
							var row = result.data[d];
							
							el.append("<option value=\"" + row.class2Code + "\">" + row.class2Name + "</option>");
						}
					}
				});
			}
		};
	})(jQuery);
	
	function setHideInfo(articleIdx, comment){
		var data = {
				articleIdx: articleIdx,
				comment: comment
			};
		
		$.ajaxWM({
			url: "/ajax/forum/article/hide",
			data: data,
			success: function(result) {
				getList();
				$.alert("<s:message code="resource.common.alert.btn.successful" />");
				$("#divHideModal").modal("hide");
			}
		});
	}
	
	function showHideModal(idx){
		$("#divHideModal").modal("show");
		$("#btnHideInfo").bind("click", function () {
			var comment = $('input[name="hideRadios"]:checked').val();
			if($('input[name="hideRadios"]:checked').val() == ""){
				comment = $('input:text[name="txtHideReason"]').val();
				if(comment == ""){
					$.alert("<s:message code="resource.article.list.modal.placeholder.Enterreason" />");
					return;
				}
			}
          	setHideInfo(idx, comment);
        });
        return false;
	}
	
	function getList(){
		var data = {
				masterIdx: masterIdx,
				langCode: selLang.val(),
				class1Code: selMainUnit.val(),
				class2Code: selSubUnit.val(),
				startDt: dpcWrite.data("daterangepicker").startDate.format("YYYY-MM-DD HH:mm"),
				endDt: dpcWrite.data("daterangepicker").endDate.format("YYYY-MM-DD HH:mm"),
				nickname: txtNickname.val().trim()
			};
		
		$.ajaxWM({
			url: "/ajax/forum/article/list",
			data: data,
			success: function(result) {
				dtArticle.clear().draw();
				
				for (var d in result.data) {
					var row = result.data[d];
					
					if(row.content.length > 150){
						row.content = row.content.substring(0, 150) + "\n" + row.content.substring(150);
					}
					
					dtArticle.row.add([
						row.articleIdx,
						row.langCode,
						row.class1Name + "-" + row.class2Name,
						row.nickname + "(" + row.accountIdx + ")",
						row.content,
						row.likeCnt,
						moment(new Date(row.createDt)).format("YYYY-MM-DD HH:mm:ss"),
						"<button type=\"button\" class=\"btn btn-sm btn-warning d-hide\" onclick=\"showHideModal('" + row.articleIdx + "');\"><s:message code="resource.article.list.btn.hide" /></button>"
					])
					.order([0, "desc"])
					.draw(false);
				}
			}
		});
	}
</script>