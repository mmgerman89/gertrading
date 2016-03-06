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
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() { 
	function getTotalPurchase() {
		var subtotal = 0;
		
		qty = parseInt($("#my_stock_quantity").val());
		price = parseFloat($("#my_stock_purchase_price").val());
		
		subtotal = qty * price;
		subtotal = Math.round(subtotal * 100) / 100;
		
		taxes = parseFloat($("#my_stock_purchase_commission").val()) + parseFloat($("#my_stock_purchase_commission_iva").val()) +
				parseFloat($("#my_stock_purchase_market_right").val()) + parseFloat($("#my_stock_purchase_market_right_iva").val());
		taxes = Math.round(taxes * 100) / 100;
		
		total = subtotal + taxes;
		total = Math.round(total * 100) / 100;
		
		$("#my_stock_subtotal_purchase").val(subtotal);
		$("#my_stock_tax_purchase").val(taxes);
		$("#my_stock_total_purchase").val(total);
	}
	
	$("#my_stock_purchase_price").blur(function(){
		getTotalPurchase();
	});
	
	$("#my_stock_quantity").blur(function(){
		getTotalPurchase();
	});
	
	$("#my_stock_purchase_commission").blur(function(){
		getTotalPurchase();
	});
	
	$("#my_stock_purchase_commission_iva").blur(function(){
		getTotalPurchase();
	});
	
	$("#my_stock_purchase_market_right").blur(function(){
		getTotalPurchase();
	});
	
	$("#my_stock_purchase_market_right_iva").blur(function(){
		getTotalPurchase();
	});
});