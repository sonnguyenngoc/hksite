function loadAjaxBox(box) {
    var url = box.attr('data-url');
    var controls = $(box.attr('data-control'));

    //// insert loading box
    //box.html('<div class="ajax-box-loading"><div class="loader"><div class="ball-clip-rotate-pulse"><div></div><div></div></div></div></div>');

    //controls.on('change keyup', function() {
    //    str = box.attr('data-control');
    //    //console.log(str);
    //
    //    var datas = [];
    //    str.split(',').forEach(function(str) {
    //        datas.push($(str).val());
    //    });
    //
    //    $.ajax({
    //        url: url,
    //        method: 'GET',
    //        data: {
    //            datas: datas
    //        }
    //    }).done(function( result ) {
    //        box.html(result);
    //        // jsForAjaxContent(box);
    //    });
    //});
    //
    //// controls.eq(0).trigger('change');

    box.addClass('loaded');

    $.ajax({
        url: url,
        method: 'GET',
    }).done(function( result ) {
        box.html(result);
    });
}

function autoSearchMoveUp(box) {
    var current_li = box.find('li.current');
    var prev;
    if (current_li.length) {
        prev = current_li.prev();
    } else {
        prev = box.find('li').last();
    }

    box.find('li').removeClass('current');

    if (prev.length) {
        prev.addClass('current');
    } else{
        current_li.parents('ul').find('li').last().addClass('current');
    }
}

function autoSearchMoveDown(box) {
    var current_li = box.find('li.current');
    var next;
    if (current_li.length) {
        next = current_li.next();
    } else {
        next = box.find('li').first();
    }


    box.find('li').removeClass('current');

    if (next.length) {
        next.addClass('current');
    } else{
        next.parents('ul').find('li').eq(0).addClass('current');
    }
}

var autosearch_xhr;
function autoSearch(box) {
    var input = box.find('.autosearch-input');
    var keyword = input.val();
    var url = box.attr('data-url');
    var result_box = box.find('.autosearch-result-box ul');
    var menu_id = box.find('select').val();

    // if keyword == ''
    if (keyword.trim() == '') {
        result_box.parent().hide();
        return;
    }

    if (!box.find('.autosearch-result-box').length) {
        box.append('<div class="autosearch-result-box"><ul></ul></div>');
        var result_box = box.find('.autosearch-result-box ul');
    }

    // ajax autosearch
	if(autosearch_xhr && autosearch_xhr.readyState != 4){
		autosearch_xhr.abort();
	}
    autosearch_xhr = $.ajax({
        url: url,
        data: {
            search: keyword,
            menu_id: menu_id
        }
    }).done(function( items ) {
        result_box.html('');
        result_box.parent().show();
        items.forEach(function(item) {
            result_box.append(
                '<li><a title="' + item.name + '" href="' + item.link + '">' +
                    '<img src="' +item.image+ '" />' +
                    '<div><span class="title">' + item.name + '</span>' +
                    '<span class="price sold_out_' +item.is_sold_out+ '">' + (item.is_sold_out ? 'Giá liên hệ' : item.price) + '</span>' +
                    ' <span class="old_price old_price_'+item.old_price+'"><span class="num">' + item.old_price + '</span></span>' +
                '</div></a></li>'
            );
        });
        if (items.length) {
            // result_box.find('li').eq(0).addClass('current');
        } else {
            result_box.append(
                '<li class="autosearch-empty-line">Không có sản phẩm phù hợp</li>'
            );
        }
    });
}

$(document).ready(function () {
    $(document).on('keyup', '.autosearch-input', function(e) {
        var box = $(this).parents('.autosearch');
        var form = $(this).parents('form');

        var code = (e.keyCode ? e.keyCode : e.which);
        if (code === 38) {
            autoSearchMoveUp(box);
            return;
        }
        if (code === 40) {
            autoSearchMoveDown(box);
            return;
        }
        if (code === 13) {
            if (box.find('li.current a').length) {
                var link = box.find('li.current a').attr('href');
                window.location = link;
                return;
            } else {
                form.submit();
            }
        }
        autoSearch(box);
    });

    $(document).on('change', '.autosearch select', function(e) {
        var box = $(this).parents('.autosearch');

        autoSearch(box);
    });

    $(document).on('focusout', '.autosearch-input', function() {
        var box = $(this).parents('.autosearch');
        setTimeout(function() {
            box.find('.autosearch-result-box').hide();
        }, 500);
    });

    $(document).on('focusin', '.autosearch-input', function() {
        var box = $(this).parents('.autosearch');
        box.find('.autosearch-result-box').show();
    });

    $('.ajax-box').each(function() {
        // insert loading box
        $(this).html('<div class="ajax-box-loading"><div class="loader"><div class="ball-clip-rotate-multiple"><div></div><div></div></div></div></div>');
    });

    // Ajax box
    setTimeout(function() {
        $('.ajax-box').appear();
        $(document).on('appear', '.ajax-box:not(.loaded)', function() {
            // insert loading box
            // $(this).html('');

            loadAjaxBox($(this));
        });
    }, 2000);

});
