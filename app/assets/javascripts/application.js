// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require main
//= require css_browser_selector
//= require jquery.cookie
//= require google-analytics-turbolinks

$(document).ready(function () {

  // This requires jQuery at least for now
  function setupFlash () {

    $.flash = function(message, options) {
      options = $.extend({type: 'notice', timeout: 5000}, options);
      var $flash = $('<p class="' + options.type + '">' + message + ' <a class="close-btn" onclick="$(this).parent().hide();">×</a></p>');
      $('.main').prepend($flash);
    };

    function loadFlashFromCookies() {
      if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        var name = 'flash';
        var cookieValue = null;
        var data = null;

        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
              // replace fixes problems with Rails escaping. Duh.
              cookieValue = decodeURIComponent(cookie.substring(name.length + 1).replace(/\+/g,'%20'));
              if (cookieValue.length > 0) break; // there might be empty "flash=" cookies
            }
        }

        try {
          data = $.parseJSON(cookieValue);
        } catch(e) {
        }

        if (data!=null) {
          var last;
          $.each(data, function(i, d) {
            if (last == data) {
              return;
            }
            last = data;
            $.flash(d[1], {type: d[0]});
          });
        }

        host = window.location.hostname;

        if (r = host.match(/([^.]+\.[^.]+$)/))
        {
            host = r[1];
        }
        document.cookie = 'flash=; path=/; domain=' + host;
      }
    }

    loadFlashFromCookies();

    $('html').ajaxSuccess(function(event,request,options) {
      loadFlashFromCookies();
    });
  }

  setupFlash();
});