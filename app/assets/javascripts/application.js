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
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require turbolinks

$(document).ready(function() {
	function setValuesFromRateChart() {
		qty = parseInt($("#my_stock_quantity").val());
		price = parseFloat($("#my_stock_purchase_price").val());
		
		commission = parseFloat($("#purchase_current_rate_chart_commission").text());
		commission_min = parseFloat($("#purchase_current_rate_chart_commission_min").text());
		commission_iva = parseFloat($("#purchase_current_rate_chart_commission_iva").text());
		market_right = parseFloat($("#purchase_current_rate_chart_market_right").text());
		market_right_iva = parseFloat($("#purchase_current_rate_chart_market_right_iva").text());
		
		purchase_commission = ((qty * price) * commission / 100 > commission_min) ? (qty * price) * commission / 100 : commission_min;
		purchase_commission = Math.round(purchase_commission * 100) / 100;
		
		purchase_commission_iva = purchase_commission * commission_iva / 100;
		purchase_commission_iva = Math.round(purchase_commission_iva * 100) / 100;
		
		purchase_market_right = (qty * price) * market_right / 100;
		purchase_market_right = Math.round(purchase_market_right * 100) / 100;
		
		purchase_market_right_iva = purchase_market_right * market_right_iva / 100;
		purchase_market_right_iva = Math.round(purchase_market_right_iva * 100) / 100;
		
		$("#my_stock_purchase_commission").val(purchase_commission);
		$("#my_stock_purchase_commission_iva").val(purchase_commission_iva);
		$("#my_stock_purchase_market_right").val(purchase_market_right);
		$("#my_stock_purchase_market_right_iva").val(purchase_market_right_iva);
		
		
	};
	
	
	function getCurrentRateChart(element) {
		$.ajax({
			type: "GET",
			url: "/rate_charts_current",
			data: {type: $("#my_stock_type_stock").val(),date: $(element).val()},
			callback: null
		});
		return true;
	};
	
	
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
	};
	
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
	
	
	$("#calculate_pruchase").click(function () {
		getCurrentRateChart($("#my_stock_purchase_date"));
		setValuesFromRateChart();
		getTotalPurchase();
	});
	
	$("#my_stock_purchase_date").blur(function(){
		getCurrentRateChart(this);
	});
});