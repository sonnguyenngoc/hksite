function updatePercentDiscount() {
    var old_price = parseFloat($("input#product_old_price").val());
    var price = parseFloat($("input#product_price").val());
    
    if (old_price > 0 && price > 0) {
        $("input#product_discount_percent").val(((old_price - price)/old_price)*100);
    }
}

function updatePrice() {
    var old_price = parseFloat($(".form-group input#product_old_price").val());
    var discount_percent = parseFloat($("input#product_discount_percent").val());
    
    if (old_price > 0 && discount_percent > 0) {
        $(".form-group input#product_price").val(old_price*(1 - (discount_percent/100)));
    }
}

function updateOldPrice() {
    var discount_percent = parseFloat($("input#product_discount_percent").val());
    var price = parseFloat($("input#product_price").val());
    
    if (discount_percent > 0 && price > 0) {
        $(".form-group input#product_old_price").val(price/(1 - (discount_percent/100)));
    }
}

$(document).ready(function () {
    
    // events when changing anything in filter box
    $(".filter-box select").change(function() {
        $(this).parents("form").submit();
    });
    $(".filter-box input.date-select").change(function() {
        $(this).parents("form").submit();
    });
    $(".filter-box .keyword_search_button").click(function() {
        $(this).parents("form").submit();
    });
    
    // select2
    $(".select").select2();
    
    $(".form-group input#product_price").keyup(function() {
        updatePercentDiscount();
    });
    
    $(".form-group input#product_old_price").keyup(function() {
        updatePercentDiscount();
    });
    
    $(".form-group input#product_discount_percent").keyup(function() {
        updatePrice();
    });
    
    // display orther tab in article/_form.html.erb
    
    // END ---- display orther tab in article/_form.html.erb
});