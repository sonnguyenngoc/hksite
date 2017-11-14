(function($){
    "use strict"; // Start of use strict



    //Owl carousel
    function init_carousel(){
        $(".owl-carousel").each(function(index, el) {
            var config = $(this).data();
            config.navText = ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'];
            var animateOut = $(this).data('animateout');
            var animateIn  = $(this).data('animatein');
            var slidespeed = $(this).data('slidespeed');
            if(typeof animateOut != 'undefined' ){
                config.animateOut = animateOut;
            }
            if(typeof animateIn != 'undefined' ){
                config.animateIn = animateIn;
            }
            if(typeof (slidespeed) != 'undefined' ){
                config.smartSpeed = slidespeed;
            }

            var owl = $(this);
            owl.on('initialized.owl.carousel',function(event){
                var total_active = owl.find('.owl-item.active').length;
                var i            = 0;
                owl.find('.owl-item').removeClass('item-first item-last');
                setTimeout(function(){
                    owl.find('.owl-item.active').each(function () {
                        i++;
                        if (i == 1) {
                            $(this).addClass('item-first');
                        }
                        if (i == total_active) {
                            $(this).addClass('item-last');
                        }
                    });

                }, 100);
            })
            owl.on('refreshed.owl.carousel',function(event){
                var total_active = owl.find('.owl-item.active').length;
                var i            = 0;
                owl.find('.owl-item').removeClass('item-first item-last');
                setTimeout(function(){
                    owl.find('.owl-item.active').each(function () {
                        i++;
                        if (i == 1) {
                            $(this).addClass('item-first');
                        }
                        if (i == total_active) {
                            $(this).addClass('item-last');
                        }
                    });

                }, 100);
            })
            owl.on('change.owl.carousel',function(event){
                var total_active = owl.find('.owl-item.active').length;
                var i            = 0;
                owl.find('.owl-item').removeClass('item-first item-last');
                setTimeout(function(){
                    owl.find('.owl-item.active').each(function () {
                        i++;
                        if (i == 1) {
                            $(this).addClass('item-first');
                        }
                        if (i == total_active) {
                            $(this).addClass('item-last');
                        }
                    });

                }, 100);
                owl.addClass('owl-changed');
                setTimeout(function () {
                    owl.removeClass('owl-changed');
                },config.smartSpeed)
            })
            owl.on('drag.owl.carousel',function(event){
                owl.addClass('owl-changed');
                setTimeout(function () {
                    owl.removeClass('owl-changed');
                },config.smartSpeed)
            })

            owl.owlCarousel(config);

        });
    }

    //COUNTDOWN
     function kt_countdown(){
        if($('.kt-countdown').length >0){
          var labels = ['Years', 'Months', 'Weeks', 'Days', 'Hrs', 'Mins', 'Secs'];
          var layout = '<span class="box-count day"><span class="number">{dnn}</span> <span class="text">Days</span></span><span class="dot">:</span><span class="box-count hrs"><span class="number">{hnn}</span> <span class="text">Hrs</span></span><span class="dot">:</span><span class="box-count min"><span class="number">{mnn}</span> <span class="text">Mins</span></span><span class="dot">:</span><span class="box-count secs"><span class="number">{snn}</span> <span class="text">Secs</span></span>';
          $('.kt-countdown').each(function() {
              var austDay = new Date($(this).data('y'),$(this).data('m') - 1,$(this).data('d'),$(this).data('h'),$(this).data('i'),$(this).data('s'));
              $(this).countdown({
                  until: austDay,
                  labels: labels,
                  layout: layout
              });
          });
        }
     }

    //PRODUCT TAB EFFECT
    function tab_product_fade_effect(){
      // effect click
      $(document).on('click','.tab-product-fade-effect a[data-toggle="tab"]',function(){
        var tab_id = $(this).attr('href');
        var tab_animated = $(this).data('animated');
        tab_animated = ( tab_animated == undefined || tab_animated =="" ) ? 'fadeInUp' : tab_animated;

        $(tab_id).find('.product-item').each(function(i){
            var t = $(this);
            var style = $(this).attr("style");
            style     = ( style == undefined ) ? '' : style;
            var delay  = i * 50;
            t.attr("style", style +
                      ";-webkit-animation-delay:" + delay + "ms;"
                    + "-moz-animation-delay:" + delay + "ms;"
                    + "-o-animation-delay:" + delay + "ms;"
                    + "animation-delay:" + delay + "ms;"
            ).addClass(tab_animated+' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                t.removeClass(tab_animated+' animated');
                t.attr("style", style);
            });
        })
      })
    }

    //MENU REPONSIIVE
    function krystal_menu_reposive(){
        var kt_is_mobile = (Modernizr.touch) ? true : false;
        if(kt_is_mobile === true){
            $(document).on('click', '.krystal-nav .menu-item-has-children >a', function(e){
                var licurrent = $(this).closest('li');
                var liItem = $('.krystal-nav .menu-item-has-children');
                if ( !licurrent.hasClass('show-submenu') ) {
                    liItem.removeClass('show-submenu');
                    licurrent.parents().each(function (){
                        if($(this).hasClass('menu-item-has-children')){
                            $(this).addClass('show-submenu');
                        }
                        if($(this).hasClass('main-menu')){
                            return false;
                        }
                    })
                    licurrent.addClass('show-submenu');
                    // Close all child submenu if parent submenu is closed
                    if ( !licurrent.hasClass('show-submenu') ) {
                        licurrent.find('li').removeClass('show-submenu');
                    }
                    return false;
                    e.preventDefault();
                }else{
                    licurrent.removeClass('show-submenu');
                    var href = $(this).attr('href');
                    if ( $.trim( href ) == '' || $.trim( href ) == '#' ) {
                        licurrent.toggleClass('show-submenu');
                    }
                    else{
                        window.location = href;
                    }
                }
                // Close all child submenu if parent submenu is closed
                if ( !licurrent.hasClass('show-submenu') ) {
                    licurrent.find('li').removeClass('show-submenu');
                }
                e.stopPropagation();
            });
            $(document).on('click', function(e){
                var target = $( e.target );
                if ( !target.closest('.show-submenu').length || !target.closest('.krystal-nav').length ) {
                    $('.show-submenu').removeClass('show-submenu');
                }
            });
            // On Desktop
        }else{
            $(document).on('mousemove','.krystal-nav .menu-item-has-children',function(){
                $(this).addClass('show-submenu');
                if( $(this).closest('.krystal-nav').hasClass('main-menu')){
                    $('body').addClass('is-show-menu');
                }
            })

            $(document).on('mouseout','.krystal-nav .menu-item-has-children',function(){
                $(this).removeClass('show-submenu');
                $('body').removeClass('is-show-menu');
            })
        }
    }
    //Resize mega menu
     function krystal_resizeMegamenu(){
        var window_size = jQuery('body').innerWidth();
        window_size += krystal_get_scrollbar_width();
        if( window_size > 991 ){
          if( $('.site-header .header-menu-resize').length >0){
            var container = $('.site-header .header-menu-resize');
            if( container!= 'undefined'){
              var container_width = 0;
              container_width = container.innerWidth();
              var container_offset = container.offset();
              setTimeout(function(){
                  $('.header-menu .item-megamenu').each(function(index,element){
                      $(element).children('.megamenu').css({'max-width':container_width+'px'});
                      var sub_menu_width = $(element).children('.megamenu').outerWidth();
                      var item_width = $(element).outerWidth();
                      $(element).children('.megamenu').css({'left':'-'+(sub_menu_width/2 - item_width/2)+'px'});
                      var container_left = container_offset.left;
                      var container_right = (container_left + container_width);
                      var item_left = $(element).offset().left;
                      var overflow_left = (sub_menu_width/2 > (item_left - container_left));
                      var overflow_right = ((sub_menu_width/2 + item_left) > container_right);
                      if( overflow_left ){
                        var left = (item_left - container_left);
                        $(element).children('.megamenu').css({'left':-left+'px'});
                      }
                      if( overflow_right && !overflow_left ){
                        var left = (item_left - container_left);
                        left = left - ( container_width - sub_menu_width );
                        $(element).children('.megamenu').css({'left':-left+'px'});
                      }
                  })
              },100);
            }
          }
        }
     }
     function krystal_get_scrollbar_width() {
        var $inner = jQuery('<div style="width: 100%; height:200px;">test</div>'),
            $outer = jQuery('<div style="width:200px;height:150px; position: absolute; top: 0; left: 0; visibility: hidden; overflow:hidden;"></div>').append($inner),
            inner = $inner[0],
            outer = $outer[0];
        jQuery('body').append(outer);
        var width1 = inner.offsetWidth;
        $outer.css('overflow', 'scroll');
        var width2 = outer.clientWidth;
        $outer.remove();
        return (width1 - width2);
    }
    //Auto width vertical menu
    function krystal_auto_width_vertical_menu(){
        var full_width = parseFloat($('.container').actual('width'));
        var menu_width = parseFloat($('.vertical-menu-content').actual('width'));
        var w = (full_width - menu_width);
        $('.vertical-menu-content').find('.megamenu').each(function(){
            $(this).css('max-width',w+'px');
        });
    }

    //EQUAL ELEM
    function better_equal_elems() {
        setTimeout(function(){
            $('.equal-container').each(function () {
                var $this = $(this);
                if ($this.find('.equal-elem').length) {
                    $this.find('.equal-elem').css({
                        'height': 'auto'
                    });
                    var elem_height = 0;
                    $this.find('.equal-elem').each(function () {
                        var this_elem_h = parseFloat($(this).height());
                        if (elem_height < this_elem_h) {
                            elem_height = this_elem_h;
                        }
                    });
                    $this.find('.equal-elem').height(elem_height);
                }
            });
        }, 3000);
    }
    //popup - newsletter
    // if($('#popup-newsletter').length >0){
    //     $('#popup-newsletter').modal({
    //         keyboard: false
    //     })
    // }

    //Scripts initialization
    $(window).load(function() {
      krystal_resizeMegamenu();
      better_equal_elems();
    });

    //Scripts resize
    $(window).on("resize", function() {
      krystal_resizeMegamenu();
      better_equal_elems();
      krystal_auto_width_vertical_menu();
      krystal_menu_reposive();
      // header_sticky();
    });

    //Scripts scroll
    $(window).scroll(function(){
      krystal_resizeMegamenu();
    });

    //Scripts ready
    $(document).ready(function() {
        $('.header-menu-bar ').sticky({ topSpacing: 0 });

        $(window).scroll(function () {
            var scroll = $(window).scrollTop();
            if($(window).width()>991){
                var _headerOffse = $('.header-menu-bar').offset().top;
                if (scroll >= _headerOffse) {
                    $(".vertical-menu-content").addClass('is-home');
                } else {
                    $(".vertical-menu-content").removeClass('is-home');
                }
            }
        });

        /* ------------------------------------------------
                Arctic modal
        ------------------------------------------------ */

        if($.arcticmodal){
            $.arcticmodal('setDefault',{
                type : 'ajax',
                ajax : {
                    cache : false
                },
                afterOpen : function(obj){

                    var mw = $('.modal_window');

                    mw.find('.custom_select').customSelect();

                    mw.find('.product_preview .owl_carousel').owlCarousel({
                        margin : 10,
                        themeClass : 'thumbnails_carousel',
                        nav : true,
                        navText : [],
                        rtl: window.ISRTL ? true : false
                    });

                    Core.events.productPreview();

                    addthis.toolbox('.addthis_toolbox');

                }
            });
        }

        /* ------------------------------------------------
                Fancybox
        ------------------------------------------------ */

        if($.fancybox){
            $.fancybox.defaults.direction = {
                next: 'left',
                prev: 'right'
            }
        }

        if($('.fancybox_item').length){
            $('.fancybox_item').fancybox({
                openEffect : 'elastic',
                closeEffect : 'elastic',
                helpers : {
                    overlay: {
                        css : {
                            'background' : 'rgba(0,0,0, .6)'
                        }
                    },
                    thumbs  : {
                        width   : 50,
                        height  : 50
                    }
                }
            });
        }

        if($('.fancybox_item_media').length){
            $('.fancybox_item_media').fancybox({
                openEffect  : 'none',
                closeEffect : 'none',
                helpers : {
                    media : {}
                }
            });
        }

        /* ------------------------------------------------
                Elevate Zoom
        ------------------------------------------------ */

        if($('#img_zoom').length){
            $('#img_zoom').elevateZoom({
                zoomType: "inner",
                gallery:'thumbnails',
                galleryActiveClass: 'active',
                cursor: "crosshair",
                responsive:true,
                easing:true,
                zoomWindowFadeIn: 500,
                zoomWindowFadeOut: 500,
                lensFadeIn: 500,
                lensFadeOut: 500
            });

            $(".open_qv").on("click", function(e) {
                var ez = $(this).siblings('img').data('elevateZoom');
                $.fancybox(ez.getGalleryList());
                e.preventDefault();
            });

        }
        //Woocommerce plus and minius
        $(document).on('click', '.quantity .plus, .quantity .minus', function (e) {

            // Get values
            var $qty = $(this).closest('.quantity').find('.qty'),
                currentVal = parseFloat($qty.val()),
                max = parseFloat($qty.attr('max')),
                min = parseFloat($qty.attr('min')),
                step = $qty.attr('step');

            // Format values
            if (!currentVal || currentVal === '' || currentVal === 'NaN') currentVal = 0;
            if (max === '' || max === 'NaN') max = '';
            if (min === '' || min === 'NaN') min = 0;
            if (step === 'any' || step === '' || step === undefined || parseFloat(step) === 'NaN') step = 1;

            // Change the value
            if ($(this).is('.plus')) {

                if (max && ( max == currentVal || currentVal > max )) {
                    $qty.val(max);
                } else {
                    $qty.val(currentVal + parseFloat(step));
                }

            } else {

                if (min && ( min == currentVal || currentVal < min )) {
                    $qty.val(min);
                } else if (currentVal > 0) {
                    $qty.val(currentVal - parseFloat(step));
                }

            }

            // Trigger change event
            $qty.trigger('change');

            e.preventDefault();

        });
        $('.slider-range-price').each(function(){
                var min             = parseInt($(this).data('min'));
                var max             = parseInt($(this).data('max'));
                var unit            = $(this).data('unit');
                var value_min       = parseInt($(this).data('value-min'));
                var value_max       = parseInt($(this).data('value-max'));
                var label_reasult   = $(this).data('label-reasult');
                var t               = $(this);
                $( this ).slider({
                    range: true,
                    min: min,
                    max: max,
                    values: [ value_min, value_max ],
                    slide: function( event, ui ) {
                        var result = label_reasult +" <span>"+ unit + ui.values[ 0 ] +' </span> - <span> '+ unit +ui.values[ 1 ]+'</span>';
                        t.closest('.price_slider_wrapper').find('.price_slider_amount').html(result);
                    }
                });
            });
        // menu on mobile
        $(".header-nav .toggle-submenu").on( 'click', function() {
            $( this ).parent().toggleClass('open-submenu');
            return false;
        }) ;

        $("[data-action='toggle-nav']").on( 'click', function() {
            $( this ).toggleClass('active');
            $(".header-nav").toggleClass("has-open");
            $('body').toggleClass("menu-open");
            return false;

        }) ;
        $(".header-menu .btn-close").on( 'click', function(){
                $('.header-nav').removeClass('has-open');
                return false;
        });

        // vertical megamenu on mobile
        $(".box-vertical-megamenus .title").on( 'click', function() {
                $( this ).toggleClass('active');
                $( this ).parent().toggleClass('has-open');
                $("body").toggleClass("categori-open");
                return false;
        }) ;
        $(".vertical-menu-content .btn-close").on( 'click', function(){
                $('.box-vertical-megamenus').removeClass('has-open');
                return false;
        });

        $(".box-vertical-megamenus .toggle-submenu").on( 'click', function() {
            $( this ).parent().toggleClass('open-submenu');
            return false;
        }) ;

        // search on mobile
        $(".nav-right .search-hidden").on( 'click', function(){
              $('.block-search-mobile').addClass('open');
              return false;
        });

        //// quick-view
        //$(".quick-view").on( 'click', function(){
        //      $('.block-quick-view-popup').addClass('open');
        //      // $('body').removeClass("open");
        //      return false;
        //});
        $('.block-quick-view-popup').on( 'click', function(){
              setTimeout(function() {
                $('.block-quick-view-popup').removeClass("open");
                return false;
              }, 200);
        });

        $(".block-search-mobile .close-block-serach").on( 'click', function(){
              $('.block-search-mobile').removeClass('open');
              return false;
        });

        $(".about-text-info").on('click','.about-text-title', function(){
            $('.about-text-title').not(this).removeClass('active');
            $(this).toggleClass('active');
         })

        //chosen-select
        if( $('.chosen-select').length > 0 ){
                $('.chosen-select').chosen();
            }
        //Wow animate
        new WOW().init();
        //slide popup
        $('.product-thumbs').bxSlider({
            mode: 'vertical',
            slideWidth: 70,
            minSlides: 4,
            slideMargin: 10,
            pager: false
        });
        // OWL CAROUSEL
        init_carousel();
        // Resize Megamenu
        tab_product_fade_effect();
        // header_sticky();
        kt_countdown();
        krystal_resizeMegamenu();
        krystal_auto_width_vertical_menu();
        krystal_menu_reposive();



        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
              $('#scrollup').fadeIn();
          } else {
              $('#scrollup').fadeOut();
          }
          });
        $('#scrollup').on('click', function (){
              $("html, body").animate({
                  scrollTop: 0
              }, 600);
              return false;
          });
    });

})(jQuery); // End of use strict
