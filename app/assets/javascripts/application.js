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
//= require bootstrap
//= require_tree .

function remove_fields(link){
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
};

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
};

$(document).ready(function() {
		
  $('#army_era_id').change(function() {
    $.ajax({
      url: $(this).attr('data-url'),
			data: {
				era_id : $(this).val()
			},
      dataType: "script"
    });
  });

	$(document).on("click", ".open-SetUnitClass", function () {
			var myBattalionId = $(this).data('id');
			$(".modal-body #btlnId").val( myBattalionId );
			// As pointed out in comments,
			// it is superfluous to have to manually call the modal.
			// $('#addBookDialog').modal('show');
	});
		
});
