jQuery(function($){
	"use strict";

	//Check for mobile device
	var isMobile = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Bada|Tizen|webOS|IEMobile|Opera Mini|Opera Mobi)/);

	//Search box
	$('#header .search-box .input-group-btn .btn').click(function(){
		$(this).closest('.search-box').toggleClass('opened');
		return false;
	});

	//Enabling menu hovering on desktops
	if (!isMobile) {
		$('body').addClass('desktop');
	}

	//Navabr fixed top
	$('#navbar.navbar-fixed-top').affix({
		offset: {
			top: ($('#header').outerHeight()-$('#navbar').height())
		}
	});
	$('#navbar').on('affix-top.bs.affix', function() {
		$('#header').css('margin-bottom',0);
	});
	$('#navbar').on('affix.bs.affix', function() {
		$('#header').css('margin-bottom',($('#navbar').outerHeight()+5));
	});

	//Navbar menu 3-rd level
	$('.dropdown-menu .dropdown-toggle, .nav>.menu-item-language>a').on('click', function(){
		$(this).parent().toggleClass('open').siblings().removeClass('open');
		return false;
	});

	//Navbar menu language submenu toggle
	$('body').click(function(e) {
		if(!$(e.target).is('.sub-menu *') && $(!('.sub-menu'))) {
			$('.menu-item-language').removeClass('open');
		}
	});

	//Countdown timer
	$('.countdown').each(function(index) {
		var countdown=$(this);
		var timer = new Date($(countdown).data('timestamp'));
		$(countdown).countdown({
			until: timer,
			padZeroes: true,
			format: 'DHMS'
		});
	});

	//Go top
	jQuery('.go-top a').click(function(){
		jQuery('html,body').stop().animate({scrollTop: 0},500,'easeOutExpo');
		return false;
	});

	//Call fancybox popup
	$('a.fancybox').fancybox({
		//width: 'auto',
		height: 'auto',
		helpers: {
			media : {},
			overlay: {
			  locked: false
			}
		}
	});

    //Order form
    $('.order-form').each(function(){
        $(this).find('.amount-button').click(function(){
            var amount = $(this).attr('data-val');
            $(this).addClass('active').siblings().removeClass('active');
        });
        $(this).find('.custom-amount').change(function(){
            var amount = parseInt($(this).val());
            $(this).siblings().removeClass('active');
        });
    });

	$('.donate-form').fancybox({

	});

	//Launch animations
	if (isMobile) {
		$('.animated').each(function() {
			$(this).removeClass('animated');
		});
	}

	if (!isMobile){
		$(window).on('scroll', function() {
			launchAnimation();
		});
	}

	$(window).trigger('scroll');

	function launchAnimation() {
		var index=-1;
		$('.animated:not(.start-animation):in-viewport').each(function () {
			var $this=$(this);
			if (!$this.hasClass('start-animation') && !$this.hasClass('animation-triggered')) {
				$this.addClass('animation-triggered');
				index++;
				setTimeout(function () {
					$this.addClass('start-animation');
				}, 150*index);
			}
		});
	}
	
	$('.paypal-amount-wrapper .amount-button').live('click',function(){
		$('.paypal-amount-wrapper .custom-amount').val('');
	});

});

function print_color_styles() {
	"use strict";
	var $ = jQuery;
	if ( typeof _color_selectors != 'object' || typeof _color_values != 'object' ) return;
	var style = '';
	var gen = function( values, key, rules ) {
		var value = values[key];
		if ( typeof( rules ) == 'string' && typeof(  value ) == 'string' ) {
			rules = rules.replace( /%value/g, value );
			style += '\n' + rules;
		}
		if ( typeof( rules ) == 'object' && typeof( value ) == 'object' ) {
			$.each( rules, gen.bind( this, value ) );
		}
	};
	$.each( _color_selectors, gen.bind( this, _color_values ) );
	$( '#stm-custom-colors-css').next( 'style' ).empty().append( style );
}