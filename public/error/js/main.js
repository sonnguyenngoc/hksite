/**
*
* ---------------------------------------------------------------------------
*
* Template :    June
* Author :      CoderHut
* Author URI :  http://hiknik.com/june/
* Version :     1.0
*
* --------------------------------------------------------------------------- 
*
*/

(function ($) {

    'use strict';

/*  ======================================
	Banner typed
	====================================== */
	var typer = $('.themetyped');
	typer.typed({
		stringsElement: $('#typed-strings'),
		typeSpeed: 150,
		backDelay: 1000,
		loop: true,
		contentType: 'html',
		loopCount: false,
		showCursor: false
	});
	
/*=========================================================================
	Color Schemes
	=========================================================================*/
	var colorHandle = $('.color-handle i');
	colorHandle.on('click', function(e) {
		$('.color-schemes').toggleClass('show');
	});
	
	var colorPalate = $('.color-plate a.single-color');
	colorPalate.on('click', function(e) {
		e.preventDefault();
		$('link#colors').attr('href',$(this).attr('href'));
		return false;
	});
	
/*=========================================================================
	Mobile Menu
	=========================================================================*/
	var mobileMenu = $('.main-menu');
	mobileMenu.slicknav({
		prependTo:'.mobile-menu'
	});
	
	var mobileMenuClass = $('.slicknav_btn');
	mobileMenuClass.on('click', function() {
		$('.color-schemes').toggleClass('color-schemesz');
	});

    $(window).on('load', function () {

    /*  ======================================
        Preloader
        ====================================== */
		var themePreloader = $('.theme-preloader');
        themePreloader.fadeOut('500');
    });
}(jQuery));