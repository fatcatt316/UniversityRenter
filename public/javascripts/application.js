// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
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