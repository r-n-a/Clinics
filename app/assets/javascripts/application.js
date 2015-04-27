// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $("#searchInput1").keyup(function(I) {
	switch(I.keyCode) {
            case 13:
            case 27:
            case 38: 
            case 40:
			case 16:
            break;
            default:
                if($(this).val().length>1){	
					$("#rs1").html('');
					words_id1 = $("#searchInput1").val();
					words_path_with_params = "/static_pages/get_proc_for_select/?words_id1=" + words_id1;
					$.ajax(words_path_with_params, {
					  type: 'GET',
					  dataType: 'script'
					});
				}
			break;
        }	
	 }); 
	 $("#searchInput2").keyup(function(I) {
	switch(I.keyCode) {
            case 13:
            case 27:
            case 38: 
            case 40:
			case 16:
            break;
            default:
                if($(this).val().length>1){	
					$("#rs2").html('');
					words_id2 = $("#searchInput2").val();
					words_path_with_params = "/static_pages/get_adr_for_select/?words_id2=" + words_id2;
					$.ajax(words_path_with_params, {
					  type: 'GET',
					  dataType: 'script'
					});
				}
			break;
        }	
	 }); 
}); 
 

  
