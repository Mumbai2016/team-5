(function($){
	"use strict";

	Stm.ajaxUpdateRegion = function(base, new_html, options) {
		base = $(base).get(0);
		if (!base) return;
		options = $.extend({
			replace: null,
			append: null,
			after_replace: null,
			after_append: null
		}, options);
		var $html = $('<div>'+new_html+'</div>');
		if (options.replace) $.each(options.replace, function(i, selector){
			var found = $html.find(selector);
			$(selector, base).replaceWith(found);
			if ($.isFunction(options.after_replace)) {
				options.after_replace(found);
			}
		});
		if (options.append) $.each(options.append, function(i, selector){
			var found = $html.find(selector).children();
			$(selector, base).append(found);
			if ($.isFunction(options.after_append)) {
				options.after_append(found);
			}
		});
	};

	// Data editing dialog
	$(document).on('click', '.action-edit-data', function(){
		var $module = $(this).closest('.dslc-module-front');
		$module.find('.modal').modal('show');
		if (!$module.hasClass('dslca-module-being-edited')) {
			$module.find('.dslca-module-edit-hook').trigger('click');
		}
	});

	$(document).on('click', '.action-save-data', function(){
		var $module = $('.dslca-module-being-edited');
		var data = $('form', $(this).closest('.modal')).serialize();
		$('.dslca-module-option-front[data-id="data"]', $module).val(data);
		//dslc_confirm_changes();
		dslc_option_changed();
		dslc_preview_change( function(){
			$module.addClass('dslca-module-change-made');
			jQuery('.dslca-container-loader').hide();
		});
	});


})(jQuery);

function submitDonation(){

	var data = jQuery('#donationForm').serialize();
	jQuery('.has-error').removeClass('has-error');
	jQuery.ajax({
		url		: '/?stm_post_donation=1',
		data	: data,
		dataType: 'json',
		type	: 'post'
	}).done(function(data){

		if(data.result == true){
			jQuery('#redirectMessage').show();
			jQuery('#form-loader').show();
			top.location.href = data.paypalUrl;
		} else {


			jQuery.each(data.error, function( index, value ) {

				jQuery('#donor_' + index).parent().addClass('has-error');

			});

		}

	});

}