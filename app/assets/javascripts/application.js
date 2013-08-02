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


// TODO: Change "jQuery" to "$"
jQuery(document).ready(function() {
  
  // Used on listings/community_college_picker
  // TODO: Consider loading this JS only on pages that use this partial.
  jQuery('select#state_id').change(function(){
    var state_id = jQuery(this).val();
    jQuery.ajax({
      url: '/addresses/select_state',
      data: 'state_id=' + state_id
    });
  });
  
  jQuery('select.college_dropdown').on('change', function() {
    jQuery.ajax({
      url: '/communities/update_dropdown',
      data: 'college_id=' + this.value
    });
  });
  
  // ZIP code city and state populator
  jQuery('input.zip_field').on('keyup', function() {
    if (this.value.length == 5) {
      jQuery.ajax({
        url: '/addresses/get_city_and_state',
        data: 'zip_code=' + this.value
      });
    }
  });

  // jQuery('.datepicker').on('focus', function () {
  //   jQuery(this).not('.hasDatePicker').datepicker();
  // });
  
  jQuery(function() {
    jQuery('.datepicker').datepicker({
      dateFormat : "yy-mm-dd"
    });
  });

  jQuery('select#city').on("change", function(){
    var state_id = jQuery('select#state_id').val();
    var city = jQuery(this).val();
    
    // console.log("state_id:" + state_id + " city:" + city);
    jQuery.ajax({
      url: '/addresses/select_city',
      data: 'city=' + city + '&state_id=' + state_id
    });
  });

  
  // Used on listings/_form
  // TODO: Consider loading this only on pages that use this partial.
  var selected_id = jQuery("input[name=\"listing[wanted]\"]:checked").attr('id');
  
  jQuery('#listing_wanted_false').change(function() {
    jQuery('#wanted_label').removeClass("chosen_label");
    jQuery('#for_rent_label').addClass("chosen_label");
    jQuery('.wanted :input').attr('disabled', true);
    jQuery(".wanted").hide();
    jQuery(".for_rent :input").removeAttr('disabled');
    jQuery(".for_rent").show();
  });
    
  jQuery('#listing_wanted_true').change(function() {
    jQuery('#for_rent_label').removeClass("chosen_label");
    jQuery('#wanted_label').addClass("chosen_label");
    jQuery('.for_rent :input').attr('disabled', true);
    jQuery(".for_rent").hide();
    jQuery(".wanted :input").removeAttr('disabled');
    jQuery(".wanted").show();
  });
  
  jQuery('#' + selected_id).change();
});
