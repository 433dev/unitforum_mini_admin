<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
	<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
		<li class="active"><a href="#control-sidebar-theme-demo-options-tab" data-toggle="tab"><i class="fa fa-wrench"></i></a></li>
		<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
		<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
	</ul>
	
	<div class="tab-content">
		<div class="tab-pane active" id="control-sidebar-theme-demo-options-tab">
			<div>
				<h4 class="control-sidebar-heading">Layout Options</h4>
				<div class="form-group">
					<label class="control-sidebar-subheading">
						<input type="checkbox" data-layout="fixed" class="pull-right" name="cbLayout"> Fixed Layout
					</label>
				</div>
				<div class="form-group">
					<label class="control-sidebar-subheading">
						<input type="checkbox" data-layout="layout-boxed" class="pull-right" name="cbLayout"> Boxed Layout
					</label>
				</div>
				<div class="form-group">
					<label class="control-sidebar-subheading">
						<input type="checkbox" data-layout="sidebar-collapse" class="pull-right" name="cbLayout"> Toggle Sidebar
					</label>
				</div>
				<div class="form-group">
					<label class="control-sidebar-subheading">
						<input type="checkbox" data-layout="control-sidebar-open" class="pull-right" name="cbLayout"> Toggle Right Sidebar Slide
					</label>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="control-sidebar-home-tab">
			<div>
				<h4 class="control-sidebar-heading"><s:message code="resource.common.time" /></h4>
				<div class="form-group">
					<label class="control-sidebar-subheading">UTC : ${tzUtcNow}</label>
				</div>
				<div class="form-group">
					<label class="control-sidebar-subheading">System : ${tzSystemNow}</label>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="control-sidebar-settings-tab">
			<div>
				<h4 class="control-sidebar-heading"><s:message code="resource.article.list.select.language" /></h4>
				<div class="form-group">
					<label class="control-sidebar-subheading">
						<input type="radio" class="pull-right" name="rdoLanguage" value="en" /> English
					</label>
					<label class="control-sidebar-subheading">
						<input type="radio" class="pull-right" name="rdoLanguage" value="ko" /> 한국어
					</label>
					<label class="control-sidebar-subheading">
						<input type="radio" class="pull-right" name="rdoLanguage" value="ja" /> 日本の
					</label>
				</div>
			</div>
		</div>
	</div>
</aside>

<script>
	(function($) {
		
		$(function() {
			init();
			$("#control-sidebar-theme-demo-options-tab input").on("click", function() {
				var self = $(this),
				d = self.data();
				var cu = new CookieUtil();
				
				if (self.prop("checked")){
					$("body").addClass(d.layout);
				}else{
					$("body").removeClass(d.layout);
				}
				cu.setCookie("ftt_Layout", $('body').attr('class'), 30);
			});
		});
		
		$("input[name=rdoLanguage]").change(function() {
			var rdoLanguage = $(this).val();
			var cu = new CookieUtil();
			
			if(rdoLanguage.includes("-")){
				rdoLanguage = rdoLanguage.replace("-", "_");
			}
			
			cu.setCookie("ftt_lang", rdoLanguage, 30);
			location.reload();
		});
		
		function init()	{
			$(document).ready(function() {
				var cu = new CookieUtil();
				optLayout = cu.getCookie("ftt_Layout");
				if(optLayout != ""){
					 $('input:checkbox[name="cbLayout"]').each(function() {
						 if(optLayout.indexOf($(this).attr("data-layout")) > -1){
							 this.checked = true;
						 }
					 });
					$("body").addClass(optLayout);
				}
				if("${pageContext.response.locale}" != null || "${pageContext.response.locale}" != ''){
					$("input:radio[name='rdoLanguage']:radio[value='${pageContext.response.locale}']").attr("checked",true);
				}
			});
		}
		
		function ParamUtil() {

			this.status = false;
			this.aParamData = [];
			
			this.init = function() {
				var sQueryStr = decodeURIComponent(window.location.href.slice(window.location.href.indexOf('?') + 1));
				if (sQueryStr.substr(sQueryStr.length-1, 1) == '#')
					sQueryStr = sQueryStr.slice(0, -1);
				
				var aQueryStrField = sQueryStr.split('&');
				for (var i = 0; i < aQueryStrField.length; i++) {
			        var aQueryStrCol = aQueryStrField[i].split('=');
			        this.aParamData[this.aParamData.length] = { name:aQueryStrCol[0], value:aQueryStrCol[1] }
			    }
				if(this.aParamData.length <= 1) {
					this.aParamData = [];
				}
				this.status = true;
			}
			
			this.getAllParam = function(nType) {
				if (!this.status)
					this.init();
				
				if (typeof(nType) == 'undefined' || nType == null || nType == 0) {
					return this.aParamData;
				}
				else if (nType == 1) {
					var result = {};
					for (var i = 0; i < this.aParamData.length; i++)
						result[this.aParamData[i].name] = this.aParamData[i].value;
					
					return result;
				}
			}
			
			this.getParam = function (name) {
				if (!this.status)
					this.init();
				
				for (var i = 0; i < this.aParamData.length; i++)
					if (this.aParamData[i].name == name)
						return this.aParamData[i].value;
				
				return '';
			}

			this.setParam = function (name, value) {
				if (!this.status)
					this.init();
				
				var found = false;
				for (var i = 0; i < this.aParamData.length; i++) {
					if (this.aParamData[i].name == name) {
						this.aParamData[i].value = value;
						found = true;
						break;
					}
			    }
				
				if (!found) // add new param
					this.aParamData[this.aParamData.length] = { 'name':name, 'value':value }
			}
			
			this.getUrl = function() {
				if (!this.status)
					this.init();
				return window.location.pathname + '?' + jQuery.param(this.getAllParam());
			}
		}
		
		function CookieUtil() {
			
			this.setCookie = function(cname, cvalue, exdays) {
				var d = new Date();
			    d.setTime(d.getTime() + (exdays*24*60*60*1000));
			    var expires = "expires="+d.toUTCString();
			    document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/";
			}
			
			this.getCookie = function(cname) {
			    var name = cname + "=";
			    var ca = document.cookie.split(';');
			    for(var i=0; i<ca.length; i++) {
			        var c = ca[i];
			        while (c.charAt(0)==' ') c = c.substring(1);
			        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
			    }
			    return "";
			}
		}
	})(jQuery);
</script>
