// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery.min
//= require js/bootstrap.bundle.min
//= require rs-plugin-5/js/jquery.themepunch.tools.min
//= require rs-plugin-5/js/jquery.themepunch.revolution.min
//= require magnific-popup/jquery.magnific-popup.min
//= require waypoints/jquery.waypoints.min
//= require waypoints/sticky.min
//= require countTo/jquery.countTo
//= require slick/slick.min
//= require template
//= require custom

$(window).scroll(function(){
	$('header').toggleClass('scrolled', $(this).scrollTop() > 0);
});

$(document).on('turbolinks:load', function() {

	let i = 0

	let j = 0

	let k = 0

	$('#additional-primary-stat').click(function() {
		i++
		$("#input-primary-stat").append("<input type='text' class='form-control m-3' name='prim[" + i + "]'>")
	});

	$('#additional-secondary-stat').click(function() {
		j++
		$("#input-secondary-stat").append("<input type='text' class='form-control m-3' name='sec[" + j + "]'>")
	});

	$('#additional-item').click(function() {
		k++
		$("#input-item").append("<input type='text' class='form-control m-3' name='item[" + k + "]'>")
	});

})
