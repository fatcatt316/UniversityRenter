// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.turbolinks
//= require turbolinks
//= require_self
//= require_tree .

// $(document).on('ready page:load', function() {
//   $(document).trigger('turbo:ready');
// });

/////// Nested forms //////////
function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".fields").hide();
}

function add_fields(link, association, content, where) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var divregexp = new RegExp("NEWATTRIBUTEDIV", "g"); /* used to differentiate 'address' nested forms */
  if(where=="before"){
    jQuery(link).parent().before(content.replace(regexp, new_id).replace(divregexp, new_id));
  } else if(where=="bottom") {
    jQuery(link).parent().parent().append(content.replace(regexp, new_id).replace(divregexp, new_id));
  } else {
    jQuery(link).parent().after(content.replace(regexp, new_id).replace(divregexp, new_id));
  }
}

/////// END Nested forms END //////////


jQuery(document).ready(function($) {
  
  $('.login_or_register_to_edit .login_link').click(function(e) {
    $('#new_user_form').hide();
    $('#login_form').show();
    e.preventDefault();
  });
  
  $('.login_or_register_to_edit .register_link').click(function(e) {
    $('#login_form').hide();
    $('#new_user_form').show();
    e.preventDefault();
  });
  
  // Used on listings/community_college_picker
  // TODO: Consider loading this JS only on pages that use this partial.
  $('select#state_id').change(function(){
    var state_id = jQuery(this).val();
    $.ajax({
      url: '/addresses/select_state',
      data: 'state_id=' + state_id
    });
  });

  $('select.college_dropdown').on('change', function() {
    $.ajax({
      url: '/communities/update_dropdown',
      data: 'college_id=' + this.value
    });
  });
  
  // ZIP code city and state populator
  $('input.zip_field').on('keyup', function() {
    if (this.value.length == 5) {
      $.ajax({
        url: '/addresses/get_city_and_state',
        data: 'zip_code=' + this.value
      });
    }
  });
  
  $(function() {
    $('.datepicker').datepicker({
      dateFormat : "yy-mm-dd"
    });
  });

  $('select#city').on("change", function(){
    var state_id = jQuery('select#state_id').val();
    var city = jQuery(this).val();
    
    $.ajax({
      url: '/addresses/select_city',
      data: 'city=' + city + '&state_id=' + state_id
    });
  });

  
  // Used on listings/_form
  // TODO: Consider loading this only on pages that use this partial.
  var selected_id = $("input[name=\"listing[wanted]\"]:checked").attr('id');
  
  $('#listing_wanted_false').change(function() {
    $('#wanted_label').removeClass("chosen_label");
    $('#for_rent_label').addClass("chosen_label");
    $('.wanted :input').attr('disabled', true);
    $(".wanted").hide();
    $(".for_rent :input").removeAttr('disabled');
    $(".for_rent").show();
  });
    
  $('#listing_wanted_true').change(function() {
    $('#for_rent_label').removeClass("chosen_label");
    $('#wanted_label').addClass("chosen_label");
    $('.for_rent :input').attr('disabled', true);
    $(".for_rent").hide();
    $(".wanted :input").removeAttr('disabled');
    $(".wanted").show();
  });
  
  $('#' + selected_id).change();
});
