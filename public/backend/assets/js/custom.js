function updatePercentDiscount() {
    var old_price = parseFloat($("input#product_info_old_price").val());
    var price = parseFloat($("input#product_price").val());
    
    if (old_price > 0 && price > 0) {
        $("input#product_info_sale_off_price").val(((old_price - price)/old_price)*100);
    }
}

function updateOldPrice() {
    var discount_percent = parseFloat($("input#product_info_sale_off_price").val());
    var price = parseFloat($("input#product_price").val());
    
    if (discount_percent > 0 && price > 0) {
        $(".form-group input#product_info_old_price").val(price/(1 - (discount_percent/100)));
    }
}

$(document).ready(function () {
    
    // select2
    $(".select").select2();
    
    $(".form-group input#product_info_old_price").keyup(function() {
        updatePercentDiscount();
    });
    
    $(".form-group input#product_info_sale_off_price").keyup(function() {
        updateOldPrice();
    });
    
    // display orther tab in article/_form.html.erb
    
    // END ---- display orther tab in article/_form.html.erb
});