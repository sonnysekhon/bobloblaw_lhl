// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// $(document).ready(function(){               
//   $('.materialboxed').materialbox();
//   $('.parallax').parallax();
// });
var ready;
ready = function() {
  $('.materialboxed').materialbox();
  $('.parallax').parallax();

}
$(document).ready(ready);
$(document).on('page:load', ready);

$(function () {
  $('.colorPickerContainer').hide();
  $("#firstColor").on('click', function() {
    $('.mainColor').show("slow");
  });
  $("#secondColor").on('click', function() {
    $('.secondaryColor').show("slow");
  });
  $("#accentColor").on('click', function() {
    $('.accentColor').show("slow");
  });



  $('.colorPickerContainer').on('mouseleave', function() {
    $(this).hide(600);
  })

  $('.item').on('mousedown', function() {
    $(this).addClass('clicked-item')
  });
  $('.item').on('mouseup', function() {
    $(this).removeClass('clicked-item')
  });
  $('.item').on('mouseleave', function() {
    $(this).removeClass('clicked-item')
  });


  var selection = {

  };

  $('.item').on('click', function(e)
  {
      var x = $(this).css('backgroundColor');
      var hexColor = hexc(x);
      var target = $(this).parent().data('color');
      selection[target] = hexColor;
      // console.log(hexColor, target);
  })

  $('button#save').on('click', function()
  {
      console.log(selection);
  });

  function hexc(colorval) {
      var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
      delete(parts[0]);
      for (var i = 1; i <= 3; ++i) {
          parts[i] = parseInt(parts[i]).toString(16);
          if (parts[i].length == 1) parts[i] = '0' + parts[i];
      }
      return '#' + parts.join('');;
  };

});

