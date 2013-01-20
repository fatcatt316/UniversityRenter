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

  jQuery('.datepicker').live('focus', function () {
      jQuery(this).not('.hasDatePicker').datepicker();
  });

  jQuery('select#city').live("change", function(){
    var state_id = jQuery('select#state_id').val();
    var city = jQuery(this).val();
    
    console.log("state_id:" + state_id + " city:" + city);
    jQuery.ajax({
      url: '/addresses/select_city',
      data: 'city=' + city + '&state_id=' + state_id
    });
  });

  
  // Used on listings/_form
  // TODO: Consider loading this only on pages that use this partial.
  var selected_id = jQuery("input[name=\"listing[wanted]\"]:checked").attr('id');
  
  jQuery('#listing_wanted_false').change(function() {
    jQuery('.wanted :input').attr('disabled', true)
    jQuery(".wanted").hide();
    jQuery(".for_rent :input").removeAttr('disabled');
    jQuery(".for_rent").show();
  });
    
  jQuery('#listing_wanted_true').change(function() {
    jQuery('.for_rent :input').attr('disabled', true)
    jQuery(".for_rent").hide();
    jQuery(".wanted :input").removeAttr('disabled');
    jQuery(".wanted").show();
  });
  
  jQuery('#' + selected_id).change();
});

jQuery.noConflict();