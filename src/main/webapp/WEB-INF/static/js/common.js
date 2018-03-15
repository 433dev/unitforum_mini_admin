"use strict";
"use restrict";

(function($) {
  var mdlAlert;
  
  // Global init
  $(function() {
    mdlAlert = $("#mdlAlert").modal({
      show: false
    });
  });
  
  // Ajax wrapper
  $.ajaxWM = function (options) {
    var opts,
    defaultOption = {
      type: "POST",
      dataType: "json",
      cache: false,
    };

    opts = $.extend(true, defaultOption, options || {});

    $.ajax($.extend(opts, {
      error: function (result, status, err) {
        if (result.message) {
          $.alert(result.message + "(" + result.code + ")");
        }
        else {
          $.alert("Error.(" + result.code + ")");
        }
        
        if ($.isFunction(options.fail))
            options.fail(result);
      },
      success: function (result) {
        console.log(result);
        if (result && result.code == 0) {
          if ($.isFunction(options.success))
            options.success(result);
        }
        else {
          if (result.message) {
            $.alert(result.message + "(" + result.code + ")");
          }
          else {
            $.alert("Error.(" + result.code + ")");
          }
        }
      }
    }));
  };
  
  // Bootstrap modal alert
  $.alert = function(content, cbButton) {
    mdlAlert.modal("show");
    
    mdlAlert.find(".modal-body").html(content);
    if (cbButton && $.isFunction(cbButton)) {
      mdlAlert.on("hidden.bs.modal", cbButton);
    }
  };
  
  // Array key, value object to json object
  $.fn.serializeObject = function() {
    var a = this.serializeArray(),
      o = {};
      
    $.each(a, function() {
      if (o[this.name] !== undefined) {
        if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
        }
        o[this.name].push(this.value || '');
      } else {
        o[this.name] = this.value || '';
      }
    });
    return o;
  };
})(jQuery);