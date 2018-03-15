<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ftt" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<ftt:page>
	<ftt:content>
		<section class="content-header">
			<h1>${gameCodeTable.get(masterInfo.ssn)}(${masterInfo.desc}) <s:message code="resource.setting.subunit.title" /></h1>
		</section>

		<section class="content">
			<div class="row">
				<div id="divMainUnit" class="col-md-6" data-masteridx="${masterInfo.masterIdx}">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title"><s:message code="resource.setting.subunit.message.mainunit" /></h3>
						</div>
						<div class="box-body">
							<div class="box box-warning">
								<div class="box-body">
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-class1Code" placeholder="Code" />
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-class1Name" placeholder="Name" />
									</div>
									<div class="col-xs-2">
										<button type="button" class="btn btn-primary d-mainUnitAdd">Add</button>
									</div>
								</div>
							</div>
							<div class="box">
								<div class="box-body">
									<table id="tblMainUnit" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="divSubUnit" class="col-md-6 hidden">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title"></h3>
						</div>
						<div class="box-body">
							<div class="box box-warning">
								<div class="box-body">
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-class2Code" placeholder="Code" />
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control input-sm d-class2Name" placeholder="Name" />
									</div>
									<div class="col-xs-2">
										<button type="button" class="btn btn-primary d-subUnitAdd">Add</button>
									</div>
								</div>
							</div>
							<div class="box">
								<div class="box-body">
									<table id="tblSubUnit" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</ftt:content>
</ftt:page>

<script>
var divMainUnit, divSubUnit, tblMainUnit, tblSubUnit;

	(function($) {
		$(function() {
			init();
			bindEvent();
			
			getMainUnitList();
		});
		
		function init() {
			divMainUnit = $("#divMainUnit");
			divSubUnit = $("#divSubUnit");
			tblMainUnit = $("table", divMainUnit).DataTable({columns: [
   				 	{orderable: true, order: "desc"},
				 	{orderable: true},
					{orderable: false}
				]});
			tblSubUnit = $("table", divSubUnit).DataTable({columns: [
   				 	{orderable: true, order: "desc"},
   				 	{orderable: true},
   					{orderable: false}
   				]});
			
		}
		
		function bindEvent() {
			divMainUnit.find(".d-mainUnitAdd").on("click", function() {
				mainUnit.addInfo();
			});
			divSubUnit.find(".d-subUnitAdd").on("click", function() {
				subUnit.addInfo();
			})
		}
		
		mainUnit = {
			getList: function() {

			},
			addInfo: function() {
				var data = {
						masterIdx: divMainUnit.data().masteridx,
						class1Code: divMainUnit.find(".d-class1Code").val().trim(),
						class1Name: divMainUnit.find(".d-class1Name").val().trim()
					};
				
				$.ajaxWM({
					url: "/ajax/settings/mainunit/add",
					data: data,
					success: function(result) {
						getMainUnitList();
						divMainUnit.find(".d-class1Code").val("");
						divMainUnit.find(".d-class1Name").val("");
						$.alert("정상적으로 처리되었습니다.");
					}
				});
			},
			removeInfo: function(code) {

			}
		};
		
		subUnit = {
			addInfo: function() {
				var self = $(this),
					data = {
						masterIdx: divSubUnit.data().masteridx,
						class1Code: divSubUnit.data().mainunitidx,
						class2Code: divSubUnit.find(".d-class2Code").val().trim(),
						class2Name: divSubUnit.find(".d-class2Name").val().trim()
					};
				
				$.ajaxWM({
					url: "/ajax/settings/subunit/add",
					data: data,
					success: function(result) {
						getSubUnitList();
						divSubUnit.find(".d-class2Code").val("");
						divSubUnit.find(".d-class2Name").val("");
						$.alert("정상적으로 처리되었습니다.");
					}
				});
			},
			removeInfo: function(code) {
				var data = {
						masterIdx: divSubUnit.data().masteridx,
						class1Code: divSubUnit.data().mainunitidx,
						class2Code: code
					};
				
				$.ajaxWM({
					url: "/ajax/settings/subunit/remove",
					data: data,
					success: function(result) {
						getSubUnitList();
						$.alert("정상적으로 처리되었습니다.");
					}
				});
			}
		};
	})(jQuery);
	
	function getMainUnitList(){
		divMainUnit = $("#divMainUnit");
		
		var data = {
				masterIdx: divMainUnit.data().masteridx
			};
		
		$.ajaxWM({
			url: "/ajax/settings/mainunit/list",
			data: data,
			success: function(result) {
				tblMainUnit.clear().draw();
				
				for (var d in result.data) {
					var row = result.data[d];
					tblMainUnit.row.add([row.class1Code, row.class1Name, "<button type=\"button\" onclick=\"removeSubInfo('" + row.class1Code + "');\" class=\"btn btn-sm btn-warning d-remove\"><s:message code='resource.setting.main.btn.delete' /></button><button type=\"button\" onclick=\"initSubUnit('" + row.masterIdx + "','" + row.class1Code + "','" + row.class1Name + "');\" class=\"btn btn-sm btn-warning d-subUnit\"><s:message code='resource.setting.main.message.subunitmanege' /></button>"]);
				}
				tblMainUnit.draw(false);
				
			}
		});
	}
	
	function initSubUnit(masterIdx, mainUnitIdx, mainUnitName){
		divSubUnit = $("#divSubUnit");
		divSubUnit.find(".box-title").text(mainUnitName + " <s:message code='resource.setting.main.message.subunit' />");
		divSubUnit.removeClass("hidden").data({
			masteridx: masterIdx,
			mainunitidx: mainUnitIdx
		});
		getSubUnitList();
	}
	
	function getSubUnitList(){		
		divSubUnit = $("#divSubUnit");
		
		var data = {
				masterIdx: divSubUnit.data().masteridx,
				class1Code: divSubUnit.data().mainunitidx
			};
		
		$.ajaxWM({
			url: "/ajax/settings/subunit/list",
			data: data,
			success: function(result) {
				tblSubUnit.clear().draw();
				
				for (var d in result.data) {
					var row = result.data[d];
					tblSubUnit.row.add([row.class2Code, row.class2Name, "<button type=\"button\" class=\"btn btn-sm btn-warning d-remove\"><s:message code='resource.setting.main.btn.delete' /></button>"]);
				}
				tblSubUnit.draw(false);
				
				divSubUnit.find("button.d-remove").each(function(i) {
					$(this).on("click", function() {
						subUnit.removeInfo(tblSubUnit.row(i).data()[0]);
					});
				});
			}
		});
	}
	
	function removeSubInfo(code){
		divMainUnit = $("#divMainUnit");
		var data = {
				masterIdx: divMainUnit.data().masteridx,
				class1Code: code
			};
		
		$.ajaxWM({
			url: "/ajax/settings/mainunit/remove",
			data: data,
			success: function(result) {
				getMainUnitList();
				$.alert("정상적으로 처리되었습니다.");
			}
		});
	}
</script>