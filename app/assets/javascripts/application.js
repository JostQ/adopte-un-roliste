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

$(document).on('turbolinks:load', function() {

	let i = 0

	let j = 0

	let k = 0

	$('#additional-primary-stat').click(function() {
		i++
		if(i === 1){
			$("#input-primary-stat").append("<div class='row justify-content-center'><div class='col-md-5'>Nom</div>-<div class='col-md-2 ml-3'>Valeur</div></div>")
		}
		$("#input-primary-stat").append("<div class='form-group row m-3 justify-content-center align-items-center'><input type='text' class='form-control col-md-5 mr-3' name='primnames[" + i + "]'> : <input type='text' class='form-control col-md-2 ml-3' name='primvals[" + i + "]'></div>")
	});

	$('#additional-secondary-stat').click(function() {
		j++
		if(j === 1){
			$("#input-secondary-stat").append("<div class='row justify-content-center'><div class='col-md-5'>Nom</div>-<div class='col-md-2 ml-3'>Valeur</div></div>")
		}
		$("#input-secondary-stat").append("<div class='form-group row m-3 justify-content-center align-items-center'><input type='text' class='form-control col-md-5 mr-3' name='secnames[" + j + "]'> : <input type='text' class='form-control col-md-2 ml-3' name='secvals[" + j + "]'></div>")

	});

	$('#additional-item').click(function() {
		k++
		$("#input-item").append("<input type='text' class='form-control m-3' name='items[" + k + "]'>")
	});

  $('#search_game').on('change', function(){
    console.log($(this))
    $("#search_result").load('/game_sessions?search=' + $("#search_game").val() + ' #list_game_session')
  })

  $('#characters_select').on('change', function(){
    console.log("test 1")
    if($(this).val() !== "gm"){
      console.log('/characters/' + $(this).val())
      console.log($(this).val())
      $('#info-charach').load('/characters/' + $(this).val() + ' #info_character')
      $('#prim-specs').load('/characters/' + $(this).val() + ' #primary_specs')
      $('#sec-specs').load('/characters/' + $(this).val() + ' #secondary_specs')
      $('#inv-charac').load('/characters/' + $(this).val() + ' #items_inventory')
      $('#link-profile').load('/characters/' + $(this).val() + ' #link_profile')
    }
    else{
      $('#info-charach>ul').remove()
      $('#prim-specs>ul').remove()
      $('#sec-specs>ul').remove()
      $('#inv-charac>ul').remove()
      $('#link-profile>div').remove()
    }
  })

})
