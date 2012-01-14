jQuery(document).ready(function() {
	
	var selected_id = jQuery("input[@name=listing[wanted]]:checked").attr('id');
	
	jQuery('#listing_wanted_false').change(function() {
	  jQuery(".wanted").hide();
	  jQuery(".for_rent").show();
	});
		
	jQuery('#listing_wanted_true').change(function() {
	  jQuery(".wanted").show();
	  jQuery(".for_rent").hide();
	});
	
	jQuery('#' + selected_id).change();
});

jQuery.noConflict();