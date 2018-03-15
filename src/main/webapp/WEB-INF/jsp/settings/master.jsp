<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ftt" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<ftt:page>
	<ftt:content>
		<section class="content-header">
			<h1>Settings</h1>
		</section>

		<section class="content">
			<%-- <div class="callout callout-danger">
				<p>
					<span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;<strong><s:message code="resource.setting.main.message.possible" /></strong>
				</p>
			</div> --%>
			<div class="row">
				<div class="col-md-3">
					<div id="divAddSec" class="box box-warning">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.setting.main.message.addforum" /></h3>
						</div>
						<form id="formMaster" role="form">
							<div class="box-body">
								<div class="form-group">
									<label for="formMasterGame"><s:message code="resource.setting.main.message.game" /></label>
									<select id="formMasterGame" name="ssn" class="form-control input-sm">
										<c:forEach items="${gameCodeTable}" var="row">
											<option value="${row.key}">${row.value}(${row.key})</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="formMasterDesc"><s:message code="resource.setting.main.message.description" /></label>
									<input id="formMasterDesc" name="desc" type="text" class="form-control input-sm" maxlength="200" placeholder="<s:message code='resource.setting.main.message.200' />" />
								</div>
								<div class="form-group">
									<label for="formMasterViewType"><s:message code="resource.setting.main.message.viewtype" /></label>
									<select id="formMasterViewType" name="viewType" class="form-control input-sm">
										<option value="1">White</option>
										<option value="2">Black</option>
										<option value="3">Brown</option>
									</select>
								</div>
								<div class="form-group">
									<label for="formMasterUnitType"><s:message code="resource.setting.main.message.unittype" /></label>
									<select id="formMasterUnitType" name="unitType" class="form-control input-sm">
										<option value="skill">skill</option>
										<option value="character">character</option>
										<option value="job">job</option>
										<option value="equipment">equipment</option>
										<option value="prefix">prefix</option>
										<option value="coworker">co-worker</option>
									</select>
								</div>
							</div>
							<c:if test="${cnfEnv ne 'Test'}">
								<div class="box-footer">
									<button id="formMasterSubmit" type="button" class="btn btn-sm btn-primary"><s:message code="resource.setting.main.btn.add" /></button>
								</div>
							</c:if>
						</form>
					</div>
				</div>
				<div class="col-md-9">
					<div class="box">
						<div class="box-body">
							<table id="tblList" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th><s:message code="resource.setting.main.message.gameorder" /></th>
										<th><s:message code="resource.setting.main.message.gamename" /></th>
										<th><s:message code="resource.setting.main.message.forumdescription" /></th>
										<th><s:message code="resource.setting.main.message.usestatus" /></th>
										<th><s:message code="resource.setting.main.message.unittype" /></th>
										<th><s:message code="resource.setting.main.message.viewtype" /></th>
										<th><s:message code="resource.setting.main.message.features" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${masterList}" var="row">
										<tr data-idx="${row.masterIdx}" data-name="${gameCodeTable.get(row.ssn)}" data-desc="${row.desc}">
											<td>${row.masterIdx}</td>
											<td>${gameCodeTable.get(row.ssn)}(${row.ssn})</td>
											<td>
												<input type="text" class="form-control input-sm" value="${row.desc}" />
												<button type="button" class="btn btn-sm btn-primary d-update"><s:message code="resource.setting.main.btn.edit" /></button>
											</td>
											<td>
												<c:if test="${row.showYn=='Y'}">
													<input type="checkbox" class="input-sm" checked />
												</c:if>
												<c:if test="${row.showYn=='N'}">
													<input type="checkbox" class="input-sm" />
												</c:if>
											</td>
											<td>
												${row.unitType}
											</td>
											<td>
												${row.viewType}
											</td>
											<td>
												<c:if test="${cnfEnv ne 'Test'}">
													<button type="button" class="btn btn-sm btn-warning d-remove"><s:message code="resource.setting.main.btn.delete" /></button>
												</c:if>
												<button type="button" class="btn btn-sm btn-primary d-world" data-toggle="modal" data-target="#mdlWorld"><s:message code="resource.setting.main.btn.worldinfo" /></button>
												<button type="button" class="btn btn-sm btn-primary d-unit"><s:message code="resource.setting.main.btn.mainunitinfo" /></button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="mdlWorld" role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
							<h4 class="modal-title"><s:message code="resource.setting.main.btn.worldinfo" /></h4>
						</div>
						<div class="modal-body">
							<div class="box box-warning">
								<div class="box-body">
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-worldIdx" placeholder="ID" />
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-worldName" placeholder="Name" />
									</div>
									<div class="col-xs-2">
										<button type="button" class="btn btn-primary d-worldAdd">Add</button>
									</div>
								</div>
							</div>
							<div class="box">
								<div class="box-body">
									<table id="tblWorld" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</ftt:content>
</ftt:page>

<script>
	(function($) {
		var mdlWorld, tblWorld, master, world;
		
		$(function() {
			init();
			bindEvent();
		});
		
		function init() {
			tblWorld = $("#tblWorld").dataTable();
			
			$("section.content input[type='checkbox']").bootstrapSwitch({
				size: "small",
				animate: false,
				onText: "<s:message code="resource.setting.main.btn.on" />",
				offText: "<s:message code="resource.setting.main.btn.off" />",
				onColor: "danger",
				offColor: "primary"
			});
		}
		
		function bindEvent() {
			$("#formMasterSubmit").on("click", master.addInfo);
			$("#tblList button.d-remove").on("click", master.removeInfo);
			$("#tblList button.d-update").on("click", master.updateDesc);
			$("#tblList button.d-unit").on("click", function() {
				var self = $(this),
					data = self.closest("tr").data();
				
				location.href = "/settings/unit?masterIdx=" + data.idx;
			});
			
			$("section.content input[type='checkbox']").on("switchChange.bootstrapSwitch", function(event, state) {
				var self = $(this),
					data = self.closest("tr").data();
				master.changeStatus(data.idx, state);
			});
			
			mdlWorld = $("#mdlWorld").on("shown.bs.modal", function(e) {
				var self = $(this),
					btn = $(e.relatedTarget),
					data = btn.closest("tr").data(),
					elId = self.find(".d-worldIdx"),
					elName = self.find(".d-worldName");
				
				world.getList(data.idx, mdlWorld.find("tbody"));
				
				elId.trigger("focus");
				self.find(".d-worldAdd").unbind().on("click", function() {
					world.addInfo(data.idx, elId.val().trim(), elName.val().trim());
				});
				self.find(".modal-title").text(data.name + "(" + data.desc + ") <s:message code="resource.setting.main.btn.worldinfo" />");
			})
			.on("hidden.bs.modal", function(e){
				var self = $(this),
					elId = self.find(".d-worldIdx"),
					elName = self.find(".d-worldName");
				
				elId.val("");
				elName.val("");
				self.find("tbody").empty();
				self.find(".modal-title").text("");
			});
		}
		
		master = {
			addInfo: function() {
				var data = $("#formMaster").serializeObject();
				
				if("${cnfEnv}" == "Live") {
					$.ajaxWM({
						url: "http://ts-unitforum-admin.four33.co.kr:14075/api/settings/master/add",
						data: data,
						success: function(result) {
							console.log(result);
						}
					});
				}
				
				$.ajaxWM({
					url: "/ajax/settings/master/add",
					data: data,
					success: function(result) {
						$.alert("<s:message code="resource.common.alert.btn.successful" />", function() {
							location.reload();
						});
					}
				});
			},
			changeStatus: function(idx, status) {
				var data = {
						masterIdx : idx,
						status: status
					};
				
				$.ajaxWM({
					url: "/ajax/settings/master/changeStatus",
					data: data,
					success: function(result) {
						$.alert("<s:message code="resource.common.alert.btn.successful" />");
					}
				});
			},
			updateDesc: function() {
				var self = $(this),
					data = {
						masterIdx: self.closest("tr").data().idx,
						desc: self.siblings("input").val().trim()
					};
				
				$.ajaxWM({
					url: "/ajax/settings/master/changeDesc",
					data: data,
					success: function(result) {
						$.alert("<s:message code="resource.common.alert.btn.successful" />");
					}
				});
			},
			removeInfo: function() {
				var self = $(this),
					data = {
						masterIdx: self.closest("tr").data().idx
					};
				if("${cnfEnv}" == "Live") {
					$.ajaxWM({
						url: "http://ts-unitforum-admin.four33.co.kr:14075/api/settings/master/remove",
						data: data,
						success: function(result) {
							self.closest("tr").remove();
							$.alert("<s:message code="resource.common.alert.btn.successful" />");
						}
					});
				}
				$.ajaxWM({
					url: "/ajax/settings/master/remove",
					data: data,
					success: function(result) {
						self.closest("tr").remove();
						$.alert("<s:message code="resource.common.alert.btn.successful" />");
					}
				});
			}
		};
		
		world = {
			getList: function(masterIdx, elTarget) {
				var data = {
						masterIdx: masterIdx
					};
				
				$.ajaxWM({
					url: "/ajax/settings/world/list",
					data: data,
					success: function(result) {
						elTarget.empty();
						for (var d in result.data) {
							
							elTarget.append("<tr data-idx=\"" + result.data[d].worldIdx + "\"><td>" + result.data[d].worldIdx + "</td><td>" + result.data[d].worldName + "</td><td><button type=\"button\" class=\"btn btn-sm btn-warning d-worldRemove\"><s:message code='resource.setting.main.btn.delete' /></button></td></tr>");
						}
						elTarget.find(".d-worldRemove").on("click", function() {
							var self = $(this);
							world.removeInfo(self, masterIdx);
						});
					}
				});
			},
			addInfo: function(masterIdx, id, name) {
				var self = $(this),
					data = {
						masterIdx: masterIdx,
						worldIdx: id,
						worldName: name
					};
				
				$.ajaxWM({
					url: "/ajax/settings/world/add",
					data: data,
					success: function(result) {
						world.getList(masterIdx, mdlWorld.find("tbody"));
						$.alert("<s:message code="resource.common.alert.btn.successful" />");
					}
				});
			},
			removeInfo: function(el, masterIdx) {
				var data = {
						masterIdx: masterIdx,
						worldIdx: el.closest("tr").data().idx
					};
				
				$.ajaxWM({
					url: "/ajax/settings/world/remove",
					data: data,
					success: function(result) {
						el.closest("tr").remove();
						world.clearForm();
						$.alert("<s:message code="resource.common.alert.btn.successful" />");
					}
				});
			},
			clearForm: function() {
				mdlWorld.find(".d-worldIdx").val("");
				mdlWorld.find(".d-worldName").val("");
			}
		};
	})(jQuery);
</script>